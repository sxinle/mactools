package com.mx.cam.net.service;

import com.mx.cam.net.conf.Std;
import com.mx.server.common.config.ConfigLoader;
import okhttp3.OkHttpClient;
import retrofit2.Call;
import retrofit2.JacksonConverterFactory;
import retrofit2.Retrofit;
import retrofit2.http.FieldMap;
import retrofit2.http.FormUrlEncoded;
import retrofit2.http.POST;
import retrofit2.http.Url;

import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * Created by hsong on 16-1-6.
 */
public interface StdAuth {

    OkHttpClient client = new OkHttpClient.Builder().connectTimeout(Std.CGI.timeout(), TimeUnit.SECONDS).build();

    Retrofit retrofit = new Retrofit.Builder().client(client).baseUrl(ConfigLoader.getProperty("mx_device_shop.service.auth"))
            .addConverterFactory(JacksonConverterFactory.create()).build();

    StdAuth api = retrofit.create(StdAuth.class);

    @FormUrlEncoded
    @POST
    Call<Map> firstActive(@Url String url, @FieldMap Map<String, String> param);

}
