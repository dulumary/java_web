package com.hagulu.test.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.hagulu.test.lesson06.dao.BookingDAO;
import com.hagulu.test.lesson06.model.Booking;

@Service
public class BookingBO {
	
	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList() {
		
		return bookingDAO.selectBookingList();
	}
	
	public void deleteBooking(int id) {
		bookingDAO.deleteBooking(id);
	}
	
	public int insertBooking(
			String name
			,String date
			,int day
			,int headcount
			,String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber, "대기중");
	}
	
	public Booking getBooking(String name, String phoneNumber) {
		return bookingDAO.selectBooking(name, phoneNumber);
	}

}
 