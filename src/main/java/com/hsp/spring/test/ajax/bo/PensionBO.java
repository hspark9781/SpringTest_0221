package com.hsp.spring.test.ajax.bo;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hsp.spring.test.ajax.dao.PensionDAO;
import com.hsp.spring.test.ajax.model.Booking;

@Service
public class PensionBO {

	@Autowired
	private PensionDAO pensionDAO;
	
	
	public List<Booking> getBookingList() {
		return pensionDAO.selectAllBooking();
	}
	
	
	public int addBooking(String name, int headcount, int day, Date date, String phoneNumber) {
		return pensionDAO.insertBooking(name, headcount, day, date, phoneNumber);
	}
	
	public int isDelete(int id) {
		return pensionDAO.deleteBooking(id);
	}
	
}
