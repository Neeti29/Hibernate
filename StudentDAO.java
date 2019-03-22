package com.niit.mockito;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudentDAO {


    public Student getStudentDetails(String rollNo) throws Exception{
        System.out.println("Actual DB call will occur......");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mysqljdbc","root","connection");
        PreparedStatement ps = con.prepareStatement("select * from student where rollno=?");
        Student stud = new Student();
        ps.setString(1,rollNo);
        ResultSet rs= ps.executeQuery();
        while(rs.next()){
            stud.setRollno(rs.getString("rollno"));
            stud.setFirstname(rs.getString("firstname"));
            stud.setLastname(rs.getString("lastname"));
            stud.setDept(rs.getString("dept"));
        }
        return stud;
    }
}
