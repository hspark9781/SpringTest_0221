package com.hsp.spring.test.ajax;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hsp.spring.test.ajax.bo.PensionBO;
import com.hsp.spring.test.ajax.model.Booking;

@Controller
@RequestMapping("/ajax/pension")
public class PensionController {
	
	@Autowired
	private PensionBO pensionBO;
	
	
	
	@GetMapping("/home")
	public String home() {
		
		return "ajax/pension/home";
	}
	
	@GetMapping("/input")
	public String input() {
		
		return "ajax/pension/input";
	}
	
	
	@GetMapping("/list") // 브라우저 경로
	public String list(Model model) {
		
		List<Booking> bookingList = pensionBO.getBookingList();
		
		model.addAttribute("bookingList", bookingList);
		
		
		return  "ajax/pension/list"; // jsp 경로
	}
	
	@GetMapping("/add")
	@ResponseBody
	public Map<String, String> addBooking(
			@RequestParam("name") String name
			, @RequestParam("date")
			  @DateTimeFormat(pattern="yyyy-MM-dd") Date date
			, @RequestParam("headcount") int headcount
			, @RequestParam("day") int day
			, @RequestParam("phoneNumber") String phoneNumber) {
		

		int count = pensionBO.addBooking(name, headcount, day, date, phoneNumber);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	@GetMapping("/delete")
	@ResponseBody
	public Map<String, String> deleteBooking(@RequestParam("id") int id) {
		
		int count = pensionBO.deleteBooking(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
	}
	
	
	@GetMapping("/select")
	@ResponseBody
	public Map<String, Object> selectBooking(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Booking booking = new Booking();
		booking = pensionBO.selectBooking(name, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("name", name);
		result.put("date", booking.getDate());
		result.put("date", booking.getDay());
		result.put("count", booking.getHeadcount());
		result.put("state", booking.getState());
		
		return result;
	}
	

}
