package com.hsp.spring.test.mybatis.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hsp.spring.test.mybatis.model.RealEstate;

@Repository
public interface RealEstateDAO {
	// id 로 select 하기
	public RealEstate selectRealEstateId(@Param("id") int id);
	
	// 월세 조건 select
	public List<RealEstate> selectRealEstateRent(@Param("rent") int rent);
	
	// 복합조건 select
	public List<RealEstate> selectRealEstateAreaPrice(
			@Param("area") int area
			, @Param("price") int price);
	
	// 객체로 insert 하기
	public int insertRealEstateByObject(RealEstate realEstate);
	
	// field 로 insert 하기
	public int insertRealEstate(
			@Param("realtorId") int realtorId
			, @Param("address") String address
			, @Param("area") int area
			, @Param("type") String type
			, @Param("price") int price
			, @Param("rentPrice") int rentPrice);
	
	public int updateRealEstate(
			@Param("id") int id
			, @Param("type") String type
			, @Param("price") int price
			);
	
	public int deleteRealEstate(@Param("id") int id);
	
	
}