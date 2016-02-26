package com.mx.cam.net.service;

import com.mx.cam.net.conf.PEUSystem;
import com.mx.server.common.config.ConfigLoader;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.JacksonConverterFactory;
import retrofit2.Retrofit;
import retrofit2.http.GET;
import retrofit2.http.QueryMap;
import retrofit2.http.Url;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
public interface PEUSystemOrder {

    OkHttpClient client = new OkHttpClient.Builder().connectTimeout(PEUSystem.CGI.timeout(), TimeUnit.SECONDS).build();

    Retrofit retrofit = new Retrofit.Builder().client(client).baseUrl(ConfigLoader.getProperty("mx_device_shop.service.PEUSystem"))
            .addConverterFactory(JacksonConverterFactory.create()).build();

    PEUSystemOrder api = retrofit.create(PEUSystemOrder.class);

    @GET
    Call<Map> getCardPay(@Url String url, @QueryMap Map<String, String> param);
    @GET
    Call<Map> getOrderState(@Url String url, @QueryMap Map<String, String> param);

}
