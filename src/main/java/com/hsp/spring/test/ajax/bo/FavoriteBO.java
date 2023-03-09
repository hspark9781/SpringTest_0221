package com.hsp.spring.test.ajax.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.spring.test.ajax.dao.FavoriteDAO;
import com.hsp.spring.test.ajax.model.Favorite;

@Service
public class FavoriteBO {

	@Autowired
	private FavoriteDAO favoriteDAO;
	
	public List<Favorite> getFavoriteList() {
		return favoriteDAO.selectFavorite();
	}
	
	
	public int addFavorite(String name, String url) {
		return favoriteDAO.insertFavorite(name, url);
	}
	
	public boolean isDuplicate(String url) {
		
		int count = favoriteDAO.selectDuplicateUrl(url);
		
		if(count == 0) {
			return false;
		} else {
			return true;
		}
		
	}
	
}
