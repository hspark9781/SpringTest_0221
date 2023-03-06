package com.hsp.spring.test.jstl.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hsp.spring.test.jstl.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {

	public List<Weatherhistory> selectWeatherhistory();
}
