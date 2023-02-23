package com.hsp.spring.test.mybatis.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.spring.test.mybatis.dao.RealEstateDAO;
import com.hsp.spring.test.mybatis.model.RealEstate;

@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	public RealEstate getRealEstateId(int id) {
		RealEstate realEstate = realEstateDAO.selectRealEstateId(id);
		return realEstate;
		
	}
	
	public List<RealEstate> getRealEstateRent(int rent) {
		List<RealEstate> realEstate = realEstateDAO.selectRealEstateRent(rent);
		return realEstate;
	}
	
	public List<RealEstate> getRealEstateAreaPrice(int area, int price) {
		List<RealEstate> realEstate = realEstateDAO.selectRealEstateAreaPrice(area, price);
		return realEstate;
	}
	
}
