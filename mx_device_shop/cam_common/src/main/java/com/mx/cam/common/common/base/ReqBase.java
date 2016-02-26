package com.mx.cam.common.common.base;

import com.fasterxml.jackson.annotation.JsonInclude;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by hsong on 16-1-6.
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ReqBase implements IValidation {

    Logger logger = LoggerFactory.getLogger(ReqBase.class);

    public Map<String, String> toMap() throws IntrospectionException, IllegalAccessException, InvocationTargetException {
        Map<String, String> returnMap = new HashMap<>();
        BeanInfo beanInfo = Introspector.getBeanInfo(this.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (int i = 0; i < propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();
            if (!propertyName.equals("class")) {
                Method readMethod = descriptor.getReadMethod();
                Object result = readMethod.invoke(this, new Object[0]);
                if (result != null) {
                    returnMap.put(propertyName, result.toString());
                } else {
                    returnMap.put(propertyName, "");
                }
            }
        }
        return returnMap;
    }

    @Override
    public boolean validate() {
        try {
            return !hasEmptyProps();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    boolean hasEmptyProps() throws IntrospectionException, InvocationTargetException, IllegalAccessException {
        BeanInfo beanInfo = Introspector.getBeanInfo(this.getClass());
        PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
        for (int i = 0; i < propertyDescriptors.length; i++) {
            PropertyDescriptor descriptor = propertyDescriptors[i];
            String propertyName = descriptor.getName();
            if (!propNotRequired(propertyName)) {
                Method readMethod = descriptor.getReadMethod();
                Object result = readMethod.invoke(this, new Object[0]);

                if (null == result || StringUtils.isEmpty(result.toString())) {
                    logger.error("!!!======\t" + propertyName + " is Empty=====!!!");
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * @return 可以为空的属性名称, 预留给子类重写
     */
    public String[] getNotRequiredProps() {
        return new String[]{};
    }

    /**
     * exclude分页基类的属性
     */
    private String[] pageProps = new String[]{"page", "rows", "order", "sort", "offset", "total"};

    boolean propNotRequired(String propName) {
        return "class".equals(propName) || Arrays.asList(this.getNotRequiredProps()).contains(propName) || Arrays.asList(pageProps).contains(propName);
    }
}
