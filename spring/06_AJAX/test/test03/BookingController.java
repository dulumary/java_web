package com.hagulu.test.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hagulu.test.lesson06.bo.BookingBO;
import com.hagulu.test.lesson06.model.Booking;

@RequestMapping("/lesson06/test03")
@Controller
public class BookingController {
	
	@Autowired
	private BookingBO bookingBO;
	
	@RequestMapping("/main")
	public String main() {
		
		return "lesson06/test03/main";
	}
			
	
	@RequestMapping("/booking_list")
	public String bookingList(Model model) {
		
		model.addAttribute("bookingList", bookingBO.getBookingList());
		
		return "lesson06/test03/bookingList";
	}
	
	@RequestMapping("/delete_booking")
	@ResponseBody
	public Map<String, String> deleteBooking(
			@RequestParam("id") int bookingId
			, Model model)  {
	
		  bookingBO.deleteBooking(bookingId);     
		  
		  Map<String, String> result = new HashMap<>();
		  result.put("result", "success");
		  
		  return result;
	}
	
	@RequestMapping("/insert_view") 
	public String insertView() {
		return "lesson06/test03/insertBooking";
	}
	
	@RequestMapping("/insert_booking")
	@ResponseBody
	public Map<String, String> insertBooking (
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		bookingBO.insertBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		return result;
	}
	
	@RequestMapping("/get_booking")
	@ResponseBody
	public Map<String, Object> getBooking(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String PhoneNumber) {
		
		Map<String, Object> result = new HashMap<>();

		Booking booking = bookingBO.getBooking(name, PhoneNumber);
		if(booking != null) {
			result.put("result", "success");
			result.put("booking", booking);
		} else {
			result.put("result", "fail");
		}
		return result;
	}
	
	

}
