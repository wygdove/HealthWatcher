package com.wygdove.hw.common.constant;

/**
 * @author wygdove
 * @since 2017年2月14日下午4:31:52
 */

public class DataSourceContextHolder {
	 private static final ThreadLocal<String> contextHolder = new ThreadLocal<String>();  
	   
     public static void setDbType(String dbType) {  
         contextHolder.set(dbType);  
     }  
   
     public static String getDbType() {  
         return ((String) contextHolder.get());  
     }  
   
     public static void clearDbType() {  
         contextHolder.remove();  
     }  
}
