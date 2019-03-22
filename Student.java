//Pojjo class
package com.niit.mockito;

public class Student {

	private String rollno;
	private String firstname;
	private String lastname;
	private String dept;
	
	public String getRollno() {
		return rollno;
	}
	public void setRollno(String rollno) {
		this.rollno = rollno;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String toString()
	{
		return "\n Roll no:"+rollno+"\n FirstName:"+firstname+"\n Lastname:"+lastname+"\n Dept:"+dept;
	}
	
	
}
