package com.hsp.spring.test.jstl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsp.spring.test.jstl.bo.WeatherhistoryBO;
import com.hsp.spring.test.jstl.model.Weatherhistory;

@Controller
@RequestMapping("/jstl/weatherhistory")
public class WeatherhistoryController {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	
	@GetMapping("/info")
	public String info(Model model) {
		
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getWeatherhistoryList();
		model.addAttribute("weatherhistoryList", weatherhistory);
		return "jstl/weatherhistory_info";
	}
	
	@GetMapping("/add")
	public String add(
			@RequestParam("date") 
			@DateTimeFormat(pattern="yyyy-MM-dd") Date date
			, @RequestParam("weather") String weather
			, @RequestParam("temperatures") double temperatures
			, @RequestParam("precipitation") double precipitation
			, @RequestParam("microDust") String microDust
			, @RequestParam("windSpeed") double windSpeed
			, Model model) {
		
		Weatherhistory weatherhistory = new Weatherhistory();
		weatherhistory.setDate(date);
		weatherhistory.setWeather(weather);
		weatherhistory.setTemperatures(temperatures);
		weatherhistory.setMicroDust(microDust);
		weatherhistory.setWindSpeed(windSpeed);
		
		int count = weatherhistoryBO.addWeatherhistory(weatherhistory);
		
		model.addAttribute("weatherhistory", weatherhistory);
		
		
		
		return "jstl/weatherhistory_info";
	}
//	private Date date;
//	private  String weather;
//	private double temperatures;
//	private double precipitation;
//	private String microDust;
//	private double windSpeed;
	
	
	@GetMapping("/input")
	public String input(Model model) {
		return "jstl/weatherhistory_input";
	}
	

}
