package com.hsp.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsp.spring.test.ajax.bo.FavoriteBO;
import com.hsp.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/list")
	public String favoriteList(Model model) {
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		
		model.addAttribute("favoriteList", favoriteList);
		
		return "ajax/favorite/list";
		
	}
	
	@GetMapping("/add")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name
			, @RequestParam("url") String url
			, Model model) {
		
		int count = favoriteBO.addFavorite(name, url);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count ==  1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	
	@GetMapping("/input") 
		public String input() {
			return "ajax/favorite/input";
		
	}
	
	
}
