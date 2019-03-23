<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.util.* , org.hibernate.*,org.hibernate.cfg.Configuration,com.niit.hiber.Employee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hibernate Collection Mapping Demo</title>
</head>
<body>
<%
	Session sess = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory().openSession();
	Transaction t = sess.beginTransaction();
	
	Employee e = new Employee();
	e.setEmployeeName("Rohit");
	Set<String> phoneNumbers = new HashSet<String>();
	phoneNumbers.add("99999910");
	phoneNumbers.add("3451235");
	phoneNumbers.add("5558824");
	e.setPhoneNumbers(phoneNumbers);
	sess.save(e);
	t.commit();
	
	Query query = sess.createQuery("from Employee");
	List<Employee> list = query.list();
	
	Iterator<Employee> itr = list.iterator();
	while(itr.hasNext())
	{
		Employee emp = itr.next();
		out.println("Employee Name: " + emp.getEmployeeName());
		
		
		//printing answers
		Set<String> set = emp.getPhoneNumbers();
		Iterator<String> itr2 = set.iterator();
		
		while(itr2.hasNext())
		{
			out.println(itr2.next());
		}
		
		out.println("<br>");
	}
	sess.close();
	out.println("Success");
	
	
%>
</body>
</html>