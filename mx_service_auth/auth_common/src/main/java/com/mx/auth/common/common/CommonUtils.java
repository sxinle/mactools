package com.mx.auth.common.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

public class CommonUtils {

    private static final SimpleDateFormat DATEFORMAT = new SimpleDateFormat("yyyy-MM-dd");

    /**
     * @param str   X|Y，X表示时间传整数，Y表示单位。如果不限年X传-1
     * @param cDate
     * @return
     */
    public static String getEndTime(String str, Calendar cDate) {
        if ("-1".equals(str)) {
            return null;
        } else {
            String[] strs = str.split("\\|");// X|Y，X表示时间传整数，Y表示单位。如果不限年X传-1
            String date = getXOfdate(Integer.parseInt(strs[0]), Integer.parseInt(strs[1]), cDate);
            return date;
        }
    }

    public static String genUUID() {
        return UUID.randomUUID().toString().replaceAll("-", "");
    }

    /**
     * 取得X后的日期
     *
     * @param type 0：月，1:日，2：年
     * @param num  X天数，X为正数时，取得之后的日期，X为负数时，取得之前的日期
     * @return
     */
    public static String getXOfdate(int num, int type, Calendar cDate) {
//		Calendar cDate = java.util.Calendar.getInstance();

        if (type == Constants.DATE_TYPE1) {//日
            cDate.add(Calendar.DATE, num); // 获取X日前的日期
        }
        if (type == Constants.DATE_TYPE0) {//月
            cDate.add(Calendar.MONTH, num); // 获取X日月前的日期
        }
        if (type == Constants.DATE_TYPE2) {//年
            cDate.add(Calendar.MONTH, num * 12); // 获取X月前的日期
        }

        Date date2 = cDate.getTime();
        String date = DATEFORMAT.format(date2);
        // System.out.println(date);
        return date;
    }

    public static String getDate(int year) {
        Date d;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar ca = Calendar.getInstance();
        ca.add(Calendar.YEAR, year);
        d = ca.getTime();
        String backTime = format.format(d);
        return backTime;
    }

    public static String getDate(int times, int calendar_type) {
        Date d;
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Calendar ca = Calendar.getInstance();
        ca.add(calendar_type, times);
        d = ca.getTime();
        String backTime = format.format(d);
        return backTime;
    }

}
