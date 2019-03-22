package com.niit.mockito;

public class StudentCheck {

	// private StudentDao studDAO = null;
		StudentDAO std=new StudentDAO();
		    public Student getDetails(String rollNo) throws Exception{
		        System.out.println("Before DB Call");
		        Student stud = std.getStudentDetails(rollNo);
		        System.out.println("After DB Call");
		        return stud;
		    }
		    public void setStudDAO(StudentDAO studDAO){
		        this.std = studDAO;
		    }
}