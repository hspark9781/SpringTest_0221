package com.hsp.spring.test.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsp.spring.test.mybatis.bo.RealEstateBO;
import com.hsp.spring.test.mybatis.model.RealEstate;

@Controller
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/mybatis/test01/1")
	@ResponseBody
	public RealEstate realEstateId(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstateId(id);
		return realEstate;
	}
	
	
	@RequestMapping("/mybatis/test01/2")
	@ResponseBody
	public List<RealEstate> realEstateRent(@RequestParam("rent") int rent) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateRent(rent); 
		return realEstate;
	}
	
	
	@RequestMapping("/mybatis/test01/3")
	@ResponseBody
	public List<RealEstate> realEstateAreaPrice(@RequestParam("area") int area, @RequestParam("price") int price) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateAreaPrice(area, price);
		return realEstate;
	}
	
	
	
	
	
}
