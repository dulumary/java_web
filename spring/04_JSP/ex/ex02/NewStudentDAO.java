package com.hagulu.lesson04.dao;

import org.springframework.stereotype.Repository;

import com.hagulu.lesson04.model.NewStudent;

@Repository
public interface NewStudentDAO {

	public int insertNewStudent(NewStudent student);
}
