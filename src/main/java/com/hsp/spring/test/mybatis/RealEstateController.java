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
@RequestMapping("/mybatis")
public class RealEstateController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	@RequestMapping("/test01/1")
	@ResponseBody
	public RealEstate realEstateId(@RequestParam("id") int id) {
		RealEstate realEstate = realEstateBO.getRealEstateId(id);
		return realEstate;
	}
	
	
	@RequestMapping("/test01/2")
	@ResponseBody
	public List<RealEstate> realEstateRent(@RequestParam("rent") int rent) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateRent(rent); 
		return realEstate;
	}
	
	
	@RequestMapping("/test01/3")
	@ResponseBody
	public List<RealEstate> realEstateAreaPrice(
			@RequestParam("area") int area
			, @RequestParam("price") int price) {
		List<RealEstate> realEstate = realEstateBO.getRealEstateAreaPrice(area, price);
		return realEstate;
	}
	
	// 객체로 insert 하기
	@RequestMapping("/test02/1")
	@ResponseBody
	public String addRealEstateByObject() {
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		int count = realEstateBO.addRealEstateByObject(realEstate);
		
		return "입력 성공 : " + count; 
		
	}
	
	// field 로 insert 하기
	@RequestMapping("/test02/2")
	@ResponseBody
	public String addRealEstate(@RequestParam("realtorId") int realtorId) {
		int count = realEstateBO.addRealEstate(realtorId, "썅떼빌리버 오피스텔 814호", 45, "월세", 100000, 120);
		
		return "입력 성공 : " + count;
		
	}
	
	@RequestMapping("/test03")
	@ResponseBody
	public String updateRealEstate() {
		int count = realEstateBO.updateRealEstate(31, "전세", 70000);
		
		return "수정 성공 : " + count;
	}
	
	
	@RequestMapping("/test04")
	@ResponseBody
	public String deleteRealEstate(@RequestParam("id") int id) {
		int count = realEstateBO.deleteRealEstate(id);
		
		return "삭제 성공 : " + count;
	}
	
		
	
	
	
	
}
