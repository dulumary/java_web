package com.hagulu.test.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson02.model.Seller;

@Repository
public interface SellerDAO {

	public List<Seller> selectSeller();
}
