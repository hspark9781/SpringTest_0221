package com.hsp.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hsp.spring.test.jsp.dao.SellerDAO;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	// seller추가
	public int addSeller(String nickname
			, String temperature
			, String profileImage) {
		
		return sellerDAO.insertSeller(nickname, temperature, profileImage);
	}
}
