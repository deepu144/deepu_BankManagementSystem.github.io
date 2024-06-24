package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ClientDetailDao {
	private String userName;
	private String name;
	private String email ;
	private Date dob ;
	private long number ;
	private long aadharNo ;
	private String gender ;
	private String address ;
	private String city ;
	private String state ;
	private int zipCode;
	private String accType ;
	
	public ClientDetailDao() {
		
	}

	public ClientDetailDao(String userName) throws ClassNotFoundException, SQLException {
		this.userName = userName;
		this.getDetails();
	}

	public ClientDetailDao(String userName, String name, String email, Date dob, long number,String gender, String address, String city, String state, int zipCode, String accType) {
		super();
		this.userName = userName;
		this.name = name;
		this.email = email;
		this.dob = dob;
		this.number = number;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.accType = accType;
	}

//	public ClientDetailDao(String name, long number) {
//		super();
//		this.name = name;
//		this.number = number;
//	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public Date getDob() {
		return dob;
	}
	
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public long getNumber() {
		return number;
	}
	public void setNumber(long number) {
		this.number = number;
	}
	
	public long getAadharNo() {
		return aadharNo;
	}
	
	public void setAadharNo(long aadharNo) {
		this.aadharNo = aadharNo;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	public String getCity() {
		return city;
	}
	
	public void setCity(String city) {
		this.city = city;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public int getZipCode() {
		return zipCode;
	}
	
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	
	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	@Override
	public String toString() {
		return "ClientDetailDao [userName=" + userName + ", name=" + name + ", email=" + email + ", dob=" + dob
				+ ", number=" + number + ", aadharNo=" + aadharNo + ", gender=" + gender + ", address=" + address
				+ ", city=" + city + ", state=" + state + ", zipCode=" + zipCode + "]";
	}
	
	public void getDetails() throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select * from clientinfo where username = ? ;";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			this.setName(rs.getString(2));
			this.setEmail(rs.getString(3));
			this.setDob(rs.getDate(4));
			this.setNumber(rs.getLong(5));
			this.setAadharNo(rs.getLong(6));
			if(rs.getString(7).equalsIgnoreCase("M")) {
				this.setGender("Male");
			}
			else if(rs.getString(7).equalsIgnoreCase("F")) {
				this.setGender("Female");
			}
			else {
				this.setGender("Others");
			}
			this.setAddress(rs.getString(8));
			this.setCity(rs.getString(9));
			this.setState(rs.getString(10));
			this.setZipCode(rs.getInt(11));
			this.setAccType(rs.getString(12));
		}
	}
	
	public ArrayList<String> allClients() throws ClassNotFoundException, SQLException {
		ArrayList<String> clients = new ArrayList<String>();
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select username from clientinfo;";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery(query);
		
		while(rs.next()) {
			clients.add(rs.getString(1));
		}
		return clients;
	}
	
	public boolean doUpdate() throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "update clientinfo set name = ? , email = ? , dob = ? , phone_no = ? , gender = ? , address = ? , city = ? , state = ? , zipcode = ? , account_type = ? WHERE username = ? ;";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getName() );
		ps.setString(2,getEmail());
		ps.setDate(3, getDob());
		ps.setLong(4, getNumber());
		if(getGender().equalsIgnoreCase("male")) {
			ps.setString(5, "M");
		}
		else if(getGender().equalsIgnoreCase("female")) {
			ps.setString(5, "F");
		}
		else {
			ps.setString(5, "O");
		}
		ps.setString(6, getAddress());
		ps.setString(7,getCity());
		ps.setString(8, getState());
		ps.setInt(9, getZipCode());
		ps.setString(10, getAccType());
		ps.setString(11, userName);
		
		int result = ps.executeUpdate();
		
		if(result > 0) {
			return true;
		}
		return false;
	}
	
	public String getNameFromDB(String FullName , long UserNumber) throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select username from clientinfo where name = ? and phone_no = ?;";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, FullName);
		ps.setLong(2, UserNumber);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			return rs.getString(1);
		}
		return "";
	}
	
}
