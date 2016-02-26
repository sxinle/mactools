package com.mx.cam.net.service;

import com.mx.cam.net.conf.Mazda;
import com.mx.server.common.config.ConfigLoader;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.JacksonConverterFactory;
import retrofit2.Retrofit;
import retrofit2.http.*;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
public interface MazdaAuth {

    OkHttpClient client = new OkHttpClient.Builder().connectTimeout(Mazda.CGI.timeout(), TimeUnit.SECONDS).build();

    Retrofit retrofit = new Retrofit.Builder().client(client).baseUrl(ConfigLoader.getProperty("mx_device_shop.service.auth"))
            .addConverterFactory(JacksonConverterFactory.create()).build();

    MazdaAuth api = retrofit.create(MazdaAuth.class);

    @GET
    Call<Map> checkHasActive(@Url String url, @QueryMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> saveDevUserAndActive(@Url String url, @FieldMap Map<String, String> param);
    @GET
    Call<Map> tspRenew(@Url String url, @QueryMap Map<String, String> param);
    @GET
    Call<Map> upgradeCheckDeviceNo(@Url String url, @QueryMap Map<String, String> param);
    @GET
    Call<Map> saveUpgradeExport(@Url String url, @QueryMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> retrieveActCode(@Url String url, @FieldMap Map<String, String> param);
    @GET
    Call<Map> tspInfoQuery(@Url String url, @QueryMap Map<String, String> param);
}
