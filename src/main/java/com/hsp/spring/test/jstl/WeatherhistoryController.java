package com.hsp.spring.test.jstl;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/weatherhistory")
public class WeatherhistoryController {
	
	@GetMapping("/info")
	public String info() {
		
		return "jstl/weatherhistory_info";
	}
	

}
