package com.hagulu.test.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.test.lesson06.dao.FavoriteDAO;
import com.hagulu.test.lesson06.model.Favorite;

@Service
public class FavoriteBO {
	
	@Autowired
	FavoriteDAO favoriteDAO;
	
	public void addFavorite(String name, String url) {
		favoriteDAO.insertFavorite(name, url);
	}
	
	public List<Favorite> getFavorites() {
		return favoriteDAO.selectFavorites();
	}
	
	public boolean existFavoriteByUrl(String url) {
		return favoriteDAO.existFavoriteByUrl(url);
	}
	
	public void deleteFavorite(int id) {
		favoriteDAO.deleteFavoriteById(id);
	}

}
