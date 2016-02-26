package com.mx.auth.common.common.base;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
/**
 * Created by hsong on 15-12-29.
 */
public abstract class ReqBaseParam implements IValidation {

    private static final Logger logger = LogManager.getLogger(ReqBaseParam.class);

    boolean propNotRequired(String propName) {
        return "class".equals(propName) || Arrays.asList(this.getNotRequiredProps()).contains(propName) || Arrays.asList(pageProps).contains(propName);
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

    private String[] pageProps = new String[]{"page", "rows", "order", "sort", "offset", "total"};

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
                    logger.error("" + propertyName + " is Empty!!!");
                    return true;
                }
            }
        }
        return false;
    }

    public String[] getNotRequiredProps() {
        return new String[]{};
    }
}
