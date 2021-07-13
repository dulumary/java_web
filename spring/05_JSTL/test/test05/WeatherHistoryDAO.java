package com.hagulu.test.lesson05.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson05.model.Weather;

@Repository
public interface WeatherHistoryDAO {
	
	public void insertWeatherHistory(
			@Param("date") String date, 
			@Param("weather") String weather, 
			@Param("temperatures") double temperatures, 
			@Param("precipitation") double precipitation, 
			@Param("microDust") String microDust, 
			@Param("windSpeed") double windSpeed);

	public List<Weather> selectWeatherHistory();
}
