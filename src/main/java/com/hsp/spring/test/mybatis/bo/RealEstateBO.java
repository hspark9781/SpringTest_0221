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
	
	
	// 전달 받은 id와 일치하는 데이터 조회
	public RealEstate getRealEstateId(int id) {
		RealEstate realEstate = realEstateDAO.selectRealEstateId(id);
		return realEstate;
		
	}
	
	// 전달 받은 월세 금액보다 낮은 매물 정보들 리턴
	public List<RealEstate> getRealEstateRent(int rent) {
		List<RealEstate> realEstate = realEstateDAO.selectRealEstateRent(rent);
		return realEstate;
	}
	
	public List<RealEstate> getRealEstateAreaPrice(int area, int price) {
		return realEstateDAO.selectRealEstateAreaPrice(area, price);
	}
	
	
	
	public int addReviewByObject(RealEstate realEstate) {
		return realEstateDAO.insertRealEstateByObject(realEstate);
	}
	
	public int addReview(
			int realtorId
			, String address
			, int area
			, String type
			, int price
			, int rentPrice) {
		return realEstateDAO.insertRealEstate(realtorId, address, area, type, price, rentPrice);
		
		
	}
	
}
