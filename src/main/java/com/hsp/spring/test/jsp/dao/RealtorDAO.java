package com.hsp.spring.test.jsp.dao;

import org.springframework.stereotype.Repository;

import com.hsp.spring.test.jsp.model.Realtor;

@Repository
public interface RealtorDAO {

	
	public int InsertRealtorByObject(Realtor realtor);
}
