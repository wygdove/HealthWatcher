package com.wygdove.hw.common.utils;

public class ImageUtil {
	public static String getCondImg(String cond,String dn) {
		String res="";
		switch(cond) {
			case "晴":res=dn.equals("d")?"qing":"qing_night";break;
			case "多云":res=dn.equals("d")?"duoyun":"duoyun_night";break;
			case "霾":res="mai";break;
			case "阴":res="yin";break;
			case "细雨":res="xiyu";break;
			case "阵雨":res="leizhenyu";break;
			case "雷阵雨":res="leizhenyu";break;
			case "小雨":res="xiaoyu";break;
			case "中雨":res="zhongyu";break;
			case "大雨":res="dayu";break;
			case "暴雨":res="baoyu";break;
			case "雨夹雪":res="yujiaxue";break;
			case "小雪":res="xiaoxue";break;
			case "中雪":res="zhongxue";break;
			case "大雪":res="daxue";break;
			case "暴雪":res="baoxue";break;
			case "小冰雹":res="xiaobingbao";break;
			case "冰雹":res="bingbao";break;
			case "大冰雹":res="dabingbao";break;
		}
		res+=".png";
		return res;
	}
}
