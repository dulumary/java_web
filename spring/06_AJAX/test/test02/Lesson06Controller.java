package com.hagulu.test.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hagulu.test.lesson06.bo.FavoriteBO;
import com.hagulu.test.lesson06.model.Favorite;

@RequestMapping("/lesson06")
@Controller
public class Lesson06Controller {
	
	@Autowired
	FavoriteBO favoriteBO;
	
	@RequestMapping("/test01/add_favorite_view")
	public String addFavoriteView() {
		
		return "lesson06/test01/addFavorite";
	}
	
	@RequestMapping("/test01/add_favorite")
	@ResponseBody
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url) {
		
		favoriteBO.addFavorite(name, url);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	
	@RequestMapping("/test01/favorite_list")
	public String favoritList(Model model) {
		
		List<Favorite> favoriteList = favoriteBO.getFavorites();
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "lesson06/test01/getFavorite";
		
	}
	
	@RequestMapping("/test02/is_duplication")
	@ResponseBody 
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url) {
		
		boolean exist = favoriteBO.existFavoriteByUrl(url);
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("result", exist);
		
		return result;
		
	}
	
	@RequestMapping("/test02/delete_favorite")
	@ResponseBody
	public Map<String, String> deleteFavorit(
			@RequestParam("id") int id) {
		
		favoriteBO.deleteFavorite(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		return result;
	}
	

}
