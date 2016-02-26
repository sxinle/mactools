package com.mx.auth.common.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mx.auth.common.service.ProductService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-*.xml")
public class ProductServiceImplTest extends AbstractJUnit4SpringContextTests {
    
    @Autowired
    private ProductService productService;
    
    @Test
    public void testGetProductSeries() {
        try {
            JSONObject results = (JSONObject)productService.getProductSeries(null);
            assertEquals(results.getInt("respCode"), 100);
            JSONArray resultArr = results.getJSONArray("result");
            assertTrue(resultArr.size() > 0);
            for (int i = 0; i < resultArr.size(); ++i) {
                JSONObject productObj = resultArr.getJSONObject(i);
                assertTrue(productObj.containsKey("id"));
                assertTrue(productObj.containsKey("name"));
                assertTrue(productObj.containsKey("secretKey"));
                assertTrue(productObj.containsKey("permission"));
            }
        } catch (Exception e) {
            fail(e.getMessage());
        }
    }

}
