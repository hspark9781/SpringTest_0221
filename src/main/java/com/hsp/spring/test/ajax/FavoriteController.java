package com.hsp.spring.test.ajax;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hsp.spring.test.ajax.bo.FavoriteBO;
import com.hsp.spring.test.ajax.model.Favorite;

@Controller
@RequestMapping("/ajax/favorite")
public class FavoriteController {
	@Autowired
	private FavoriteBO favoriteBO;
	
	@GetMapping("/list")
	public String favorite(Model model) {
		List<Favorite> favorite = favoriteBO.getFavoriteList();
		
		model.addAttribute("favorite", favorite);
		
		return "ajax/favorite/list";
		
	}
}
