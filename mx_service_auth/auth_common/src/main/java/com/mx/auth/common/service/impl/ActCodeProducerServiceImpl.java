package com.mx.auth.common.service.impl;

import com.mx.auth.common.common.ActiveCodeProducer;
import com.mx.auth.common.common.exception.LinkLibraryException;
import com.mx.auth.common.dao.EncryptionDao;
import com.mx.auth.common.model.Encryption;
import com.mx.auth.common.service.ActCodeProducerService;
import net.sf.json.JSONObject;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ActCodeProducerServiceImpl implements ActCodeProducerService {
    private static final Logger logger = LogManager.getLogger(ActCodeProducerServiceImpl.class);
    
	@Autowired
	private EncryptionDao encryptionDao;

    @Override
    public ActiveCodeProducer generateProducer(String productId, String softVer) throws LinkLibraryException {
        logger.info("generateProducer");
        logger.debug("productId={} softVer={}", productId, softVer);
        // 取得加密库文件
        Encryption encryptionBean = new Encryption();
        encryptionBean.setProduct_id(productId);
        encryptionBean.setSoft_ver(softVer);
        List<Encryption> encryptionList = encryptionDao.getEncryptionManage(encryptionBean);
        return new ActiveCodeProducer(encryptionList.get(0).getEncryption_path(),
                encryptionList.get(0).getAct_way());
    }

    @Override
    public JSONObject doActivate(String deviceNo, String productId, String softVer, String dataVer, String areaCode) throws Exception {
        ActiveCodeProducer producer = generateProducer(productId, softVer);
        return null == producer ? null : producer.pruduceActivationCode(deviceNo,
                productId,
                dataVer,
                areaCode,
                producer.getCurrentDate(),
                producer.getActWay());
    }
}
