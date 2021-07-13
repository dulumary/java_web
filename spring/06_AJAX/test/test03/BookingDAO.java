package com.hagulu.test.lesson06.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagulu.test.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	
	public List<Booking> selectBookingList();
	
	public void deleteBooking(@Param("id") int id);
	
	public int insertBooking(@Param("name") String name
			, @Param("date") String date
			, @Param("day") int day
			, @Param("headcount") int headcount
			, @Param("phoneNumber") String phoneNumber
			, @Param("state") String state);
	
	public Booking selectBooking(
			@Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	

}
