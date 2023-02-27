package com.hsp.spring.test.jsp.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface SellerDAO {

	public int insertSeller(
				@Param("nickname") String nickname
				, @Param("temperature") String temperature
				, @Param("profileImage") String profileImage);
	
}
