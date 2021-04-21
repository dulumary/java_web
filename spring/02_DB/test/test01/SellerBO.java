package com.hagulu.test.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.test.lesson02.dao.SellerDAO;
import com.hagulu.test.lesson02.model.Seller;

@Service
public class SellerBO {
	
	@Autowired
	private SellerDAO sellerDAO;
	
	public List<Seller> getSeller() {
		return sellerDAO.selectSeller();
	}
}
