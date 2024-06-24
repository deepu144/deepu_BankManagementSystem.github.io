package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminSignInDao {
	private String name ;
	private String password ;
	
	public AdminSignInDao(String name, String password) {
		this.name = name;
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "AdminSignInDao [name=" + name + ", password=" + password + "]";
	}
	
	public boolean isAdmin() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select username , password from admindb where username = ? ";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getName());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			if(rs.getString(2).equals(getPassword())) {
				return true;
			}
		}
		return false;
	}
	
	
}
