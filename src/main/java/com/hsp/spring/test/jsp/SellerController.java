package com.hsp.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsp.spring.test.jsp.bo.SellerBO;
import com.hsp.spring.test.jsp.model.Seller;

@Controller
@RequestMapping("/jsp/seller")
public class SellerController {

	@Autowired
	private SellerBO sellerBO;
	
	// 1. seller 추가
	@PostMapping("/add")
	@ResponseBody
	public String addSeller(@RequestParam("nickname")String nickname
			, @RequestParam("temperature")double temperature
			, @RequestParam("profileImage")String profileImage) {
		int count = sellerBO.addSeller(nickname, temperature, profileImage);
		return "입력 성공 : " + count;
	}
	
	
	@GetMapping("/input")
	public String sellerInput() {
		return "jsp/seller_input";
	}
	
	
	
	@GetMapping("/info")
	public String sellerInfo(Model model) {
		Seller seller = sellerBO.getLastSeller();
		model.addAttribute("seller", seller);
		return "jsp/seller_info";
	}
	
	
}
