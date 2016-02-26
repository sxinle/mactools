package com.mx.cam.common.common;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mx.cam.common.common.pay.MD5;
import org.springframework.amqp.AmqpException;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;


public class CommonUtils {

    //MD5加密
	public static String md5(String str) {
        return MD5.MD5Encode(str);
    }


    public static Object convertJsonToBean(String obj, Class<?> bean) {
        ObjectMapper mapper = new ObjectMapper();
        try {
            return mapper.readValue(obj, bean);
        } catch (JsonGenerationException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }
    
	public static byte[] readBytes(InputStream is, int contentLen) {
		if (contentLen > 0) {
			int readLen = 0;

			int readLengthThisTime = 0;

			byte[] message = new byte[contentLen];

			try {

				while (readLen != contentLen) {

					readLengthThisTime = is.read(message, readLen, contentLen
							- readLen);

					if (readLengthThisTime == -1) {// Should not happen.
						break;
					}

					readLen += readLengthThisTime;
				}

				return message;
			} catch (IOException e) {
				// Ignore
				// e.printStackTrace();
			}
		}

		return new byte[] {};
	}
	
    public static Map<String, String> convertParamMap(Map<String, String[]> requestParams) {
        Map<String, String> params = new HashMap<String, String>();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; ++i) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }
        return params;
    }
	
    public static void push(String message) throws AmqpException, UnsupportedEncodingException{

    	ProduceSysConfig produceSysConfig = ConfigListener.getProduceSysConfig();
        String amqpAddr = produceSysConfig.getAmqpAddr();
        int amqpPort = produceSysConfig.getAmqpPort();
        String amqpUser = produceSysConfig.getAmqpUser();
        String amqpPwd = produceSysConfig.getAmqpPwd();
        String queueName = produceSysConfig.getQueueName();
        String amqpExchange = produceSysConfig.getAmqpExchange();
        
        CachingConnectionFactory connectionFactory = new CachingConnectionFactory(amqpAddr);
        connectionFactory.setUsername(amqpUser);
        connectionFactory.setPassword(amqpPwd);
        connectionFactory.setPort(amqpPort);
        
        RabbitTemplate rabbitTemplate = new RabbitTemplate(connectionFactory);
        
        rabbitTemplate.convertAndSend(amqpExchange, queueName, MessageBuilder.withBody(message.getBytes("UTF-8")).build());
    
    }

}
