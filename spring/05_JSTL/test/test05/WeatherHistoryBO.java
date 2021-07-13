package com.hagulu.test.lesson05.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.test.lesson05.dao.WeatherHistoryDAO;
import com.hagulu.test.lesson05.model.Weather;

@Service
public class WeatherHistoryBO {
	@Autowired
	private WeatherHistoryDAO weatherHistoryDAO;
	
	public void addWeatherHistory(
			String date, 
			String weather, 
			double temperatures, 
			double precipitation, 
			String microDust, 
			double windSpeed) {
		
		weatherHistoryDAO.insertWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
		
	}
	
	public List<Weather> getWeatherHistory() {
		return weatherHistoryDAO.selectWeatherHistory();
	}
	

}
