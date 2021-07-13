package com.hagulu.test.lesson05;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagulu.test.lesson05.bo.WeatherHistoryBO;
import com.hagulu.test.lesson05.model.Weather;

@RequestMapping("/lesson05/test05")
@Controller
public class WeatherController {
	
	@Autowired
	private WeatherHistoryBO weatherHistoryBO;
	
	@RequestMapping("add_weather_view")
	public String addWeatherView() {
		
		return "lesson05/test05/addWeather";
	}

	@RequestMapping("add_weather")
	public String addWeather(
			@RequestParam("date") String date, 
			@RequestParam("weather") String weather, 
			@RequestParam("temperatures") double temperatures, 
			@RequestParam("precipitation") double precipitation, 
			@RequestParam("microDust") String microDust, 
			@RequestParam("windSpeed") double windSpeed) {
		
			weatherHistoryBO.addWeatherHistory(date, weather, temperatures, precipitation, microDust, windSpeed);
			
			return "redirect:/lesson05/test05/weather_history";
		
	}
	
	@RequestMapping("weather_history")
	public String weatherHistory(Model model) {
		
		List<Weather> weatherList = weatherHistoryBO.getWeatherHistory();
		
		model.addAttribute("weatherHistory", weatherList);
		return "lesson05/test05/weatherHistory";
	}
}
