package com.mx.auth.common.common.base;

import com.mx.auth.common.common.Constants;
import com.mx.auth.common.common.ResponseBuilder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

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
    public String exp(HttpServletRequest request, Exception ex) {
//        request.setAttribute("ex", ex);
        ex.printStackTrace();
        return ResponseBuilder.getRespCode(Constants.RESPCODE_FAILURE);
    }
}