package com.mx.cam.common.common.base;

import com.mx.cam.common.common.Constants;
import com.mx.cam.common.common.ResponseBuilder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @author xiaojian
 * @date 2015年6月16日 下午5:20:14
 * @description
 */
public class BaseController {
    /**
     * 基于@ExceptionHandler异常处理
     */
    @ExceptionHandler
    @ResponseBody
    public String exp(Exception ex) {
        ex.printStackTrace();
        if(ex instanceof IllegalArgumentException) {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_ERR_NOT_LOGIN);
        } else {
            return ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE);
        }
    }
    
    protected Map<Object, Object> respBody(int respCode, Object list) {
    	Map<Object, Object> map = new HashMap<>();
    	map.put("respCode", respCode);
    	if(list != null){
    		map.put("result", list);
    	}
    	return map;
	}
    
    protected Map<Object, Object> respPageBody(int respCode, Object list, Integer total) {
    	Map<Object, Object> map = new HashMap<>();
    	map.put("respCode", respCode);
    	map.put("rows", list);
    	if(total == null){
    		total = 0;
    	}
    	map.put("total", total);
    	return map;
		
	}
}