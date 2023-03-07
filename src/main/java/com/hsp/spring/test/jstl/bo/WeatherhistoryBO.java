package com.hsp.spring.test.jstl.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.spring.test.jstl.dao.WeatherhistoryDAO;
import com.hsp.spring.test.jstl.model.Weatherhistory;

@Service
public class WeatherhistoryBO {
	
	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;
	public List<Weatherhistory> getWeatherhistoryList () {
		List<Weatherhistory> weatherhistory =  weatherhistoryDAO.selectWeatherhistory();
		return weatherhistory;
	}
	
	
	public int addWeatherhistory(Weatherhistory weatherhistory) {
		
		return weatherhistoryDAO.insertWeatherhistoryByObject(weatherhistory);
	}

}
