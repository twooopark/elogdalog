package com.edlog.boot.springboot.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class GetDate {

	public static String getCurDay() throws ParseException {
		String day = "";

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String nDate = dateFormat.format(date);
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int dayNum = cal.get(Calendar.DAY_OF_WEEK);

		switch (dayNum) {
		case 1:
			day = "일";
			break;
		case 2:
			day = "월";
			break;
		case 3:
			day = "화";
			break;
		case 4:
			day = "수";
			break;
		case 5:
			day = "목";
			break;
		case 6:
			day = "금";
			break;
		case 7:
			day = "토";
			break;
		}
		return nDate + "("+ day +")";
	}


	// 저번주 월요일

	public static String getCurMonday() {

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

		Calendar c = Calendar.getInstance();

		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		c.add(Calendar.DATE, -7);
		return formatter.format(c.getTime());

	}

	// 저번주 일요일

	public static String getCurSunday() {

		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");

		Calendar c = Calendar.getInstance();
		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);

		return formatter.format(c.getTime());

	}
	//현재 년 구하기
//	public static int getCurYear() {
//		Calendar c = Calendar.getInstance();
//		int cYear = c.get(Calendar.YEAR);
//		
//		return cYear;
//	}
//	//현재 월 구하기
//	public static int getCurMonth() {
//		Calendar c = Calendar.getInstance();
//		int cMonth = c.get(Calendar.MONTH) + 1;
//
//		return cMonth;
//	}
//
//	// 현재 날짜 주차
//	public static String getWeek() {
//
//		Calendar c = Calendar.getInstance();
//		String week = String.valueOf(c.get(Calendar.WEEK_OF_YEAR));
//
//		return week;
//
//	}
//	
//	// 특정 년,월,주 차에 월요일 구하기
//	public static String getMonday(int y, int m, int w) {
//
//		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
//		Calendar c = Calendar.getInstance();
//		
//		System.out.println(y +"/" + m +"/" + w);
//		
//		c.set(Calendar.YEAR, y);
//		System.out.println(c.getTime());
//		
//		c.set(Calendar.MONTH, m);
//		System.out.println(c.getTime());
//		
//		c.set(Calendar.WEEK_OF_MONTH, w);
//		System.out.println(c.getTime());
//		
//		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
//		System.out.println(c.getTime());
//		return formatter.format(c.getTime());
//
//	}
//	// 특정 년,월,주 차에 일요일 구하기
//
//	public static String getSunday(int y, int m, int w) {
//
//		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
//		Calendar c = Calendar.getInstance();
//		c.set(Calendar.YEAR, y);
//		c.set(Calendar.MONTH, m);
//		c.set(Calendar.WEEK_OF_MONTH, w);
//		c.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
//		c.add(Calendar.DATE, 7);
//		//System.out.println(c.getTime());
//		return formatter.format(c.getTime());
//
//	}

}
