package com.hagulu.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hagulu.lesson04.dao.NewStudentDAO;
import com.hagulu.lesson04.model.NewStudent;

@Service
public class NewStudentBO {
	
	@Autowired
	private NewStudentDAO newStudentDAO;
	
	public int addNewStudent(NewStudent newStudent) {
		return newStudentDAO.insertNewStudent(newStudent);
	}

}
