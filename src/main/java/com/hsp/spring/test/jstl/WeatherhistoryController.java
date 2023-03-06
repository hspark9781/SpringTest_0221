package com.hsp.spring.test.jstl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsp.spring.test.jstl.bo.WeatherhistoryBO;
import com.hsp.spring.test.jstl.model.Weatherhistory;

@Controller
@RequestMapping("/weatherhistory")
public class WeatherhistoryController {
	
	@Autowired
	private WeatherhistoryBO weatherhistoryBO;
	
	
	@GetMapping("/info")
	public String info(Model model) {
		
		List<Weatherhistory> weatherhistory = weatherhistoryBO.getWeatherhistoryList();
		model.addAttribute("weatherhistoryList", weatherhistory);
		return "jstl/weatherhistory_info";
	}
	
	@GetMapping("/input")
	public String input(Model model) {
		return "jstl/weatherhistory_input";
	}
	

}
