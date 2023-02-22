package com.hsp.spring.test.database;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsp.spring.test.database.bo.StoreBO;
import com.hsp.spring.test.database.model.Store;

@Controller
public class StoreController {
	
	@Autowired
	private StoreBO storeBO;
	
	@RequestMapping("/database/test01")
	@ResponseBody
	public List<Store> test01() {
		// store 목록 가져오기
		List<Store> storeList = storeBO.
	}
}
