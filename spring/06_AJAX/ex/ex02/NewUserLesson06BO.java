package com.hagulu.lesson06.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.lesson06.dao.NewUserLesson06DAO;

@Service
public class NewUserLesson06BO {
	
	@Autowired
	private NewUserLesson06DAO newUserDAO;
	
	public void addNewUser(String name, String yyyymmdd, String introduce, String email) {
		newUserDAO.insertNewUser(name, yyyymmdd, introduce, email);
	}
	
	public boolean existNewUserByName(String name) {
		return newUserDAO.existNewUserByName(name);
	}
	

}
