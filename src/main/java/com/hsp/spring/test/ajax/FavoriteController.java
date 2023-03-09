package com.hsp.spring.test.ajax;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	// 사이트 이름과 주소를 전달 받고, 데이터를 저장
	// api는 데이터를 저장하고 response에 어떤 타입으로 전달할지 정한다. 
	// 성공 실패 여부를 response로 전달한다.
	@PostMapping("/add")
	@ResponseBody
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
	
	@PostMapping("/is_duplicate")
	@ResponseBody
	public Map<String, Boolean> isDuplicate(@RequestParam("url") String url) {
		
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		if(favoriteBO.isDuplicate(url)) {
			resultMap.put("is_duplicate", true);
		} else {
			resultMap.put("is_duplicate", false);
		}
		
		return resultMap;
	}
	
	// json형태의 데이터가 자바스크립트 객체로 변환 가능
	// => data.result
	// 404 : 주소 오타
	// 400 : parameter문제 -> spring console 창warning , 대부분 input id 잘못됐을때
	// 500 : 서버에러
	// 405 : requestmethod -> ajax type 확인
	
	
	
	
	
	
	
	
}
