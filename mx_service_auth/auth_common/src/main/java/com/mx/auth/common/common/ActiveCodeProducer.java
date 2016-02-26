package com.mx.auth.common.common;

import com.mx.auth.common.common.exception.LinkLibraryException;
import com.sun.jna.Library;
import com.sun.jna.Native;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 激活码生成器 使用加密库获得激活码
 *
 * @author daig
 */
public class ActiveCodeProducer {
    private static final Logger logger = LogManager.getLogger(ActiveCodeProducer.class);

    /**
     * 激活方式
     */
    private String actWay;

    /**
     * 当前日期
     */
    private String currentDate;

    /**
     * JNA lib 实例
     */
    private ActiveCodeLibrary libInstance;

    /**
     * JNA接口与底层激活码生成加密库沟通接口
     *
     * @author daig
     */
    public interface ActiveCodeLibrary extends Library {

        // 生成激活码
//        int UPF_ACTV_keygen_ex_ver4_nds(
//                String hardware_id, // imei号,15位
//                String module_detail_type, // 产品系列,6位
//                String data_version, // 数据版本,16位十进制,功能ID，4位 16进制
//                int region_id, // 行政区ID,传0xFF
//                String date, // 传系统时间，格式为 YYYY-MM-DD
//                byte[] key_buffer, int key_buffer_len,
//                byte[] device_serial_num_buffer,
//                int device_serial_num_buffer_len);

        //原始序列号 + 模型号 → [美行ID]新的硬件序列号（该原始序列号格式与原硬件序列号格式相同，同为22位，能够从中识别出模型号）。
        int UPF_ACTV_create_mxid_ver5(
                String hardware_id,//原始序列号
                String module_detail_type,//产品系列加密号，长度为6位数字。
                byte[] mx_id_buffer,//[美行ID]新的硬件序列号
                int mx_id_buffer_len//指定的硬件序列号长度
        );

        //通过新的硬件序列号[美行ID]获取激活码
        int UPF_ACTV_keygen_by_mxid_ver5(
                String mx_id,//[美行ID]新的硬件序列号
                String module_detail_type,//产品系列加密号，长度为6位数字。
                String data_version,//数据版本号
                int region_id,//行政区ID
                String date,//激活时间戳
                byte[] key_buffer,//激活码
                int key_buffer_len//指定的激活码长度
        );

        //通过原始序列号获取激活码和新的硬件序列号[美行ID]
        int UPF_ACTV_keygen_by_hardware_id_ver5(
                String hardware_id,//原始序列号
                String module_detail_type,//产品系列加密号，长度为6位数字。
                String data_version,//数据版本号
                int region_id,//行政区ID
                String date,//激活时间戳
                byte[] key_buffer,//激活码
                int key_buffer_len,//指定的激活码长度
                byte[] mx_id_buffer,//[美行ID]新的硬件序列号
                int mx_id_buffer_len//指定的硬件序列号长度
        );

    }

    /**
     * 构造一个激活码生成器
     *
     * @param libFilePath 加密DLL的路径
     * @param actWay      激活方式
     * @throws LinkLibraryException 激活码生成Lib未找到
     */
    public ActiveCodeProducer(String libFilePath, String actWay) throws LinkLibraryException {
        try {
            this.actWay = actWay;
            this.currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            this.libInstance = (ActiveCodeLibrary) Native.loadLibrary(
                    libFilePath, ActiveCodeProducer.ActiveCodeLibrary.class);
        } catch (UnsatisfiedLinkError e) {
            throw new LinkLibraryException("未找到地图的加密库文件", e);
        }
    }

    /**
     * 调用激活库，生成激活码
     */
    public JSONObject pruduceActivationCode(String device_no, String product_id,
                                            String data_version, String region_id, String currentDate, String act_way) throws Exception {
        logger.info("ActiveCodeProducer ==> pruduceActivationCode");
        logger.info("device_no=" + device_no);
        logger.info("product_id=" + product_id);
        logger.info("data_version=" + data_version);
        logger.info("region_id=" + region_id);
        logger.info("currentDate=" + currentDate);
        logger.info("act_way=" + act_way);
        JSONObject json = new JSONObject();
        String actCodeStr = "";
        String deviceNoStr = "";
        final int BUFF_SIZE = 64;
        byte[] deviceSerialNum = new byte[BUFF_SIZE];
        byte[] actCodeArr = new byte[BUFF_SIZE];
        //区域ID十六进制转十进制
        int regionIdtem = Integer.parseInt(region_id, 16);

        int ret = 0;
        switch (act_way) {
            case "0":
                logger.info("======UPF_ACTV_keygen_by_hardware_id_ver5======");
                ret = this.libInstance.UPF_ACTV_keygen_by_hardware_id_ver5(device_no, product_id, data_version, regionIdtem,
                        currentDate, actCodeArr, BUFF_SIZE, deviceSerialNum, BUFF_SIZE);
                if (ret == 0) { // success
                    deviceNoStr = byte2String(deviceSerialNum);
                }
                break;
            case "1":
                logger.info("======UPF_ACTV_keygen_by_mxid_ver5======");
                deviceNoStr = device_no;
                ret = this.libInstance.UPF_ACTV_keygen_by_mxid_ver5(deviceNoStr, product_id, data_version, regionIdtem, currentDate, actCodeArr, BUFF_SIZE);
                break;
            default:
                break;
        }
        logger.info("ret=" + ret);

        if (ret == 0) { // success
            actCodeStr = byte2String(actCodeArr);

            json.put("actCodeStr", actCodeStr);
            json.put("deviceNoStr", deviceNoStr);
        }
        logger.info("actCodeStr=" + actCodeStr);
        logger.info("deviceNoStr=" + deviceNoStr);
        return json;
    }

    private String byte2String(byte[] bytes) {
        int length = 0;
        for (byte b : bytes) {
            if (b != 0) {
                length++;
            } else {
                break;
            }
        }
        return new String(bytes, 0, length);
    }

    public String getActWay() {
        return actWay;
    }

    public String getCurrentDate() {
        return currentDate;
    }
}
