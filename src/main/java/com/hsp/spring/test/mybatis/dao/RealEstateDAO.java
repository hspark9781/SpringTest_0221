package com.hsp.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hsp.spring.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {
	// 1.
	public RealEstate selectRealEstateId(@Param("id") int id);
	
	// 2.
	public List<RealEstate> selectRealEstateRent(@Param("rent") int rent);
	
	// 3.
	public List<RealEstate> selectRealEstateAreaPrice(@Param("area") int area, @Param("price") int price);
	
}
