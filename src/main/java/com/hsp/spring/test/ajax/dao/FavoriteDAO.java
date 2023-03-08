package com.hsp.spring.test.ajax.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hsp.spring.test.ajax.model.Favorite;

@Repository
public interface FavoriteDAO {

	public List<Favorite> selectFavorite();
}
