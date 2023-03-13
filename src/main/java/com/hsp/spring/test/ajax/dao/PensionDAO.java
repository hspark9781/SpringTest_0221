package com.hsp.spring.test.ajax.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hsp.spring.test.ajax.model.Booking;

@Repository
public interface PensionDAO {
	
	public List<Booking> selectAllBooking();
	
	
	public int insertBooking(
			@Param("name") String name
			, @Param("headcount") int headcount
			, @Param("day") int day
			, @Param("date") Date date
			, @Param("phoneNumber") String phoneNumber);
	
	public int deleteBooking(@Param("id") int id);

}
