package com.hsp.spring.test.jsp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hsp.spring.test.jsp.bo.RealtorBO;
import com.hsp.spring.test.jsp.model.Realtor;

@Controller
@RequestMapping("/jsp/realtor")
public class RealtorController {

	@Autowired
	private RealtorBO realtorBO;
	
	
	@PostMapping("/add")
	public String addRealtor(Model model
			, @RequestParam("office") String office
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("address") String address
			, @RequestParam("grade") String grade) {
		
		Realtor realtor = new Realtor();
		realtor.setOffice(office);
		realtor.setPhoneNumber(phoneNumber);
		realtor.setAddress(address);
		realtor.setGrade(grade);
		
		int count = realtorBO.addRealtor(realtor);
		
		model.addAttribute("realtor", realtor);
		
		return "jsp/realtor_info";
	}
	
	@GetMapping("/input")
	public String realtorInput() {
		return "jsp/realtor_input";
	}
	
	@GetMapping("/info")
	public String realtorInfo() {
		return "jsp/realtor_info";
	}
	
	
		
		
		
		
	
}
