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
}
