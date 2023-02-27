package com.hsp.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsp.spring.test.jsp.bo.SellerBO;

@Controller
@RequestMapping("/jsp/test01")
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	// 1. seller 추가
	@PostMapping("/add_seller")
	@ResponseBody
	public String addSeller(String nickname
			, String temperature
			, String profileImage) {
		int count = sellerBO.addSeller(nickname, temperature, profileImage);
		return "입력 성공" + count;
	}
	
	
}
