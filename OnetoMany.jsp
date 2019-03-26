<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.*,org.hibernate.cfg.Configuration,java.util.*,
				 com.niit.hiberannotation.Answer,
				 com.niit.hiberannotation.Question,
                 org.hibernate.boot.Metadata,
                 org.hibernate.boot.MetadataSources,
                 org.hibernate.boot.registry.StandardServiceRegistry,
                 org.hibernate.boot.registry.StandardServiceRegistryBuilder,
                 javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>One to Many </title>
</head>
<body>
<h2>Hibernate One to Many Annotation Example</h2>
<%
	Configuration cfg=new Configuration();
	cfg.configure("hibernate.cfg.xml");
	SessionFactory sf=cfg.buildSessionFactory(
		new StandardServiceRegistryBuilder().configure().build());  //session factory is build using stnd service registrybuilder
	Session se = sf.openSession();
	Transaction t = se.beginTransaction();
	//t.begin()
	
	Answer an1 = new Answer();
	an1.setAnswername("Java is a Programming Language");
	an1.setPostedBy("Neeti Malhotra");
	
	Answer an2 = new Answer();
	an2.setAnswername("Java is a Platform");
	an2.setPostedBy("Mohit Malhotra");
	
	Answer an3 = new Answer();
	an3.setAnswername("Java is an Interface");
	an3.setPostedBy("Niharika Sharma");
	
	Answer an4 = new Answer();
	an4.setAnswername("Servlet is an API");
	an4.setPostedBy("Kanika Bhutani");
	
	Answer an5 = new Answer();
	an5.setAnswername("Hibernate is an ORM Tool");
	an5.setPostedBy("Nikita jayaswal");
	
	Answer an6 = new Answer();
	an6.setAnswername("It is a framework");
	an6.setPostedBy("Sanchita Singhal");
	
	Answer an7 = new Answer();
	an7.setAnswername("It is a plain old java object classes");
	an7.setPostedBy("Rajitha Chandran");
	
	Answer an8 = new Answer();
	an8.setAnswername("It must have an Identifier");
	an8.setPostedBy("Arun Sharma");
	
	ArrayList<Answer> list1 = new ArrayList<Answer>();
	list1.add(an1);
	list1.add(an2);
	
	ArrayList<Answer> list2 = new ArrayList<Answer>();
	list2.add(an3);
	list2.add(an4);
	
	ArrayList<Answer> list3 = new ArrayList<Answer>();
	list3.add(an5);
	list3.add(an6);
	
	ArrayList<Answer> list4 = new ArrayList<Answer>();
	list4.add(an7);
	list4.add(an8);
	
	Question q1 = new Question();
	q1.setQname("What is Java");
	q1.setAnswers(list1);
	
	Question q2 = new Question();
	q2.setQname("What is Servlet");
	q2.setAnswers(list2);
	
	Question q3 = new Question();
	q3.setQname("What is Hibernate");
	q3.setAnswers(list3);
	
	Question q4 = new Question();
	q4.setQname("What is POJO class");
	q4.setAnswers(list4);
	
	se.persist(q1); //saving a object(persist)
	se.persist(q2);
	se.persist(q3);
	t.commit();
	//se.close();
	out.println("Table Created & Record successfully Inserted");

	out.println("*************Display Data*********************");
	TypedQuery query = se.createQuery("from Question");
	List<Question> list = query.getResultList();
	
	Iterator<Question> itr = list.iterator();
	while(itr.hasNext())
	{
		Question q = itr.next();
		out.println("Question Name: "+q.getQname());
		
		//Printing Answers
		List<Answer> list5 = q.getAnswers();
		Iterator<Answer> itr2 = list5.iterator();
		
		while(itr2.hasNext())
		{
			Answer a = itr2.next();
			out.println(a.getAnswername()+ ":" +a.getPostedBy());
		}
		
		out.println("<br>");
	}
	se.close();
	System.out.println("Success");
	
%>
</body>
</html>