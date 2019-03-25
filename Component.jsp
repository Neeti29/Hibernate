<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*,org.hibernate.*,org.hibernate.cfg.Configuration,com.niit.hiber.Student,com.niit.hiber.StudentClass" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	Session sess = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Transaction t = sess.beginTransaction();
	
	StudentClass studentClass = new StudentClass("IT2" , "BE1");
	Student student = new Student("Mohit", "Malhotra" , "IT/01/14" , 28 , studentClass);
	sess.save(student); //saved as Persistent Object
	
	
	t = sess.beginTransaction();
	List <Student> students = sess.createQuery("From Student").list();
	
	for(Student student1:students)
	{
		out.println("First Name:" + student1.getFirstName()+"<br>");
		
		out.println("Last Name:" + student1.getLastName()+"<br>");
		
		out.println("RollNo:" + student1.getRollNo()+"<br>");
		
		out.println("Age:" + student1.getAge()+"<br>");
		
		StudentClass studentClass1 = student.getStudentClass();
		
		out.println("Class Name:" +studentClass1.getClassName()+"<br>" );
		
		out.println("Class Id:"+studentClass.getClassId()+"<br>");
		
	}
	
	t.commit();
	sess.close();
%>
</body>
</html>