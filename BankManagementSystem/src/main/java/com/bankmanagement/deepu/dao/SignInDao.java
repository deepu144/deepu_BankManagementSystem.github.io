package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignInDao {
	
	private String username ;
	private String accountPassword;
	
	
	public SignInDao(String username, String accountPassword) {
		this.username = username;
		this.accountPassword = accountPassword;
	}

	
	public String getUsername() {
		return username;
	}

	public String getAccountPassword() {
		return accountPassword;
	}

	public boolean check() throws SQLException, ClassNotFoundException {
		
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select username , acc_password from accountinfo where username = ? ";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUsername());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			if(rs.getString(1).equals(getUsername()) && rs.getString(2).equals(getAccountPassword())) {
				return true;
			}
		}		
		return false;
	}

	@Override
	public String toString() {
		return "SignInDao [username=" + username + ", accountPassword=" + accountPassword + "]";
	}
	
	
}
