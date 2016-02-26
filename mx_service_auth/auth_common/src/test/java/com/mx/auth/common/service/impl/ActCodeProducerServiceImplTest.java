package com.mx.auth.common.service.impl;

import com.mx.auth.common.service.ActCodeProducerService;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.fail;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-*.xml")
public class ActCodeProducerServiceImplTest extends AbstractJUnit4SpringContextTests {

    @Autowired
    private ActCodeProducerService actCodeProducerService;
    
    @Test
    public void testDoActivate() {
        String deviceNo  = "CG021543266646990005";
        String productId = "610301";
        String softVer   = "T10.MX.610301.8003.0000-02-08.01.00.01.01.01.34.00-01-CB";
        String areaCode  = "5600";
        String dataVer = "T04.8003.02.09.01.00-15.03.01-02-N";

        JSONObject retObj;
        try {
            retObj = actCodeProducerService.doActivate(deviceNo, productId, softVer, dataVer, areaCode);
            System.out.println(retObj);

            retObj = actCodeProducerService.doActivate(deviceNo, productId, softVer, dataVer, areaCode);
            System.out.println(retObj);


//            String actCode = retObj.getString("actCodeStr");
//            assertTrue(!StringUtils.isEmpty(actCode));
        } catch (Exception e) {
            fail(e.getMessage());
        }        
    }
}
