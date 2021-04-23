package com.hagulu.test.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hagulu.test.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	
	public int insertRealtor(Realtor realtor);
	public Realtor selectRealtor(@Param("id") int id);

}
