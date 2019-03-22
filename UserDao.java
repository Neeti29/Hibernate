package com.niit.hiber;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class UserDao {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Configuration cfg=new Configuration();
		cfg.configure("hibernate.cfg.xml");
		SessionFactory sf=cfg.buildSessionFactory();
		Session session=sf.openSession();
		Transaction t=session.beginTransaction();
		
		User u1=new User();
		u1.setName("Mohit");
		u1.setEmail("mohitmalhotra08@gmail.com");
		u1.setPassword("mohit#456");
		
		session.save(u1);
		t.commit();
		System.out.println("Successfully Saved");
	}

}
