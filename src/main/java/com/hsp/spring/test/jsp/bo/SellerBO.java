package com.hsp.spring.test.jsp.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.spring.test.jsp.dao.SellerDAO;
import com.hsp.spring.test.jsp.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	// seller추가
	public int addSeller(String nickname
			, double temperature
			, String profileImage) {
		
		return sellerDAO.insertSeller(nickname, temperature, profileImage);
	}
	
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public Seller getSeller(int id) {
		return sellerDAO.selectSeller(id);
	}
}
