package com.hagulu.test.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson06.model.Favorite;

@Repository
public interface FavoriteDAO {
	
	public void insertFavorite(@Param("name") String name, @Param("url") String url);
	
	public List<Favorite> selectFavorites();
	
	public boolean existFavoriteByUrl(@Param("url") String url);
	
	public void deleteFavoriteById(@Param("id") int id);

}
