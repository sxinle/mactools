package com.mx.auth.mazda.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mx.auth.mazda.service.MazdaTspAuthService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-*.xml")
public class AuthServiceImplTest extends AbstractJUnit4SpringContextTests {
    
    @Autowired
    private MazdaTspAuthService authService;
    
    @Test
    public void testGetTspAuth() {
        System.setProperty("catalina.home", "F:/Projects/workspace2/mx_service_auth/auth_common/src/test/resources/");
        try {
            String response = authService.getTspAuth("267422", "A123456232", "1");
            if (StringUtils.isEmpty(response)) {
                fail();
            }
            JSONObject retObj = JSONObject.fromObject(response);
            assertEquals(100, retObj.getInt("respCode"));
            System.out.println(retObj.toString());
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

}
