package com.hsp.spring.test.database.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hsp.spring.test.database.model.Store;


@Repository
public interface StoreDAO {

	// store 테이블 데이터 조회
	public List<Store> selectStoreList();
	
}
