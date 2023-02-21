package com.hsp.spring.test.lifecycle;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/lifecycle/test01")
public class Test01Controller {
	// HttpMessageConverter와 Annotation 1
	
	// 2.
	@RequestMapping("/1")
	@ResponseBody
	public String stringTest() {
		return "<h3>테스트 프로젝트 완성</h3>"
				+ "해당 프로젝트를 통해서 문제풀이를 진행합니다.";
	}
	
	// 3.
	@RequestMapping("/2")
	@ResponseBody
	public Map<String, Integer> mapResponse () {
		Map<String, Integer> score = new HashMap<>();
		score.put("국어", 80);
		score.put("수학", 90);
		score.put("영어", 85);
		
		return score;
	}
	
	
	
	
	
	
	
}
