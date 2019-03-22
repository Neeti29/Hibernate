package com.niit.mockito;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;
import static org.mockito.Mockito.*;

@RunWith(MockitoJUnitRunner.class)
public class StudentTest {


	@Mock
	StudentDAO studentdao;
	
	@Test
	public void testGetDetails001()throws Exception {
		String rollno="111";
		Student s=new Student();
		s.setRollno("111");
		when(studentdao.getStudentDetails(rollno)).thenReturn(s);
		StudentCheck sc=new StudentCheck();
		Student st=sc.getDetails(rollno);
		assertEquals("111",st.getRollno());
	}
	

}
