package com.mx.cam.net.service;

import com.mx.cam.net.conf.Common;

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
public interface CommonAuth {

    OkHttpClient client = new OkHttpClient.Builder().connectTimeout(Common.CGI.timeout(), TimeUnit.SECONDS).build();

    Retrofit retrofit = new Retrofit.Builder().client(client).baseUrl(ConfigLoader.getProperty("mx_device_shop.service.auth"))
            .addConverterFactory(JacksonConverterFactory.create()).build();

    CommonAuth api = retrofit.create(CommonAuth.class);

    @FormUrlEncoded
    @POST
    Call<Map> getProduct(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> updateProduct(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getProductSeries(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getEncryption(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> updateEncryption(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getDeviceInfo(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> updateDeviceUserInfo(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getNdsDataActiveLog(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getNdsTopDataVer(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getNdsDataServiceAuth(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getAuthOrder(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getNdsDataSellActiveAuth(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getRegionsMinDataVer(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getPrefixInfo(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getTsp(@Url String url, @FieldMap Map<String, String> param);
    @FormUrlEncoded
    @POST
    Call<Map> getTspAuth(@Url String url, @FieldMap Map<String, String> param);

}
