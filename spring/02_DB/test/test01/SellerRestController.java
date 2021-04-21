package com.hagulu.test.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hagulu.test.lesson02.bo.SellerBO;
import com.hagulu.test.lesson02.model.Seller;

@RestController
public class SellerRestController {
	
	@Autowired
	private SellerBO sellerBO;

	@RequestMapping("/lesson02/test01")
	public List<Seller> test01() {
		return sellerBO.getSeller();
	}
}
