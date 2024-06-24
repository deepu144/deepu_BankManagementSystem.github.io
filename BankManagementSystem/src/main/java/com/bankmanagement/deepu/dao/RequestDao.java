package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class RequestDao {
	private int sno ;
	private String userName ;
	private String name ;
	private String email ;
	private Date dob ;
	private long number ;
	private long aadhar ;
	private String gender ;
	private String address ;
	private String city ;
	private String state ;
	private long zipCode ;
	private String accType ;
	private String password1 ;
	private String password2 ;
	
	
	public RequestDao() {
		
	}
	
	public RequestDao(String userName) throws ClassNotFoundException, SQLException {
		this.userName = userName;
		this.setAttribute();
	}

	public RequestDao(String userName, String name, String email, Date dob, long number, long aadhar,
			String gender, String address, String city, String state, long zipCode, String accType, String password1,
			String password2) {
		
		this.userName = userName;
		this.name = name;
		this.email = email;
		this.dob = dob;
		this.number = number;
		this.aadhar = aadhar;
		this.gender = gender;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zipCode = zipCode;
		this.accType = accType;
		this.password1 = password1;
		this.password2 = password2;
	}

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

	public long getAadhar() {
		return aadhar;
	}

	public void setAadhar(long aadhar) {
		this.aadhar = aadhar;
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

	public long getZipCode() {
		return zipCode;
	}

	public void setZipCode(long zipCode) {
		this.zipCode = zipCode;
	}

	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	@Override
	public String toString() {
		return "RequestDao [userName=" + userName + ", name=" + name + ", email=" + email + ", dob=" + dob + ", number="
				+ number + ", aadhar=" + aadhar + ", gender=" + gender + ", address=" + address + ", city=" + city
				+ ", state=" + state + ", zipCode=" + zipCode + ", accType=" + accType + ", password1=" + password1
				+ ", password2=" + password2 + "]";
	}
	
	public void setAttribute() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "select * from request where username = ?";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, userName);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			this.setSno(rs.getInt(1));
			this.setName(rs.getString(3));
			this.setEmail(rs.getString(4));
			this.setDob(rs.getDate(5));
			this.setNumber(rs.getLong(6));
			this.setAadhar(rs.getLong(7));
			if(rs.getString(8).equalsIgnoreCase("m")) {
				this.setGender("Male");
			}
			else {
				this.setGender("Female");
			}
			this.setAddress(rs.getString(9));
			this.setCity(rs.getString(10));
			this.setState(rs.getString(11));
			this.setZipCode(rs.getInt(12));
			this.setAccType(rs.getString(13));
			this.setPassword1(rs.getString(14));
		}
	}
	
	public boolean insertRequestToDb() throws SQLException, ClassNotFoundException {
		
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "insert into request(username , name , email , dob , phone_no , aadhar_no , gender , address , city , state , zipcode ,account_type , password1 , password2 ) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ps.setString(2, getName());
		ps.setString(3, getEmail());
		ps.setDate(4,getDob());
		ps.setLong(5, getNumber());
		ps.setLong(6,getAadhar());
		ps.setString(7, Character.toString(getGender().charAt(0)));
		ps.setString(8,getAddress());
		ps.setString(9, getCity());
		ps.setString(10,getState());
		ps.setLong(11, getZipCode());
		ps.setString(12, getAccType());
		ps.setString(13, getPassword1());
		ps.setString(14, getPassword2());
		
		int result = ps.executeUpdate();
		
		if(result > 0) {
			return true ;
		}
		
		return false;
	}
	
	public ArrayList<String> getAllRequest() throws ClassNotFoundException, SQLException{
		ArrayList<String> allRequest = new ArrayList<String>();
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "select username from request;";
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery(query);
		
		while(rs.next()) {
			allRequest.add(rs.getString(1));
		}
		rs.close();
		con.close();
		return allRequest;
	}
	
	public boolean addToClientTable() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "insert into clientinfo values(?,?,?,?,?,?,?,?,?,?,?,?);";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ps.setString(2, getName());
		ps.setString(3, getEmail());
		ps.setDate(4,getDob());
		ps.setLong(5, getNumber());
		ps.setLong(6,getAadhar());
		ps.setString(7, Character.toString(getGender().charAt(0)));
		ps.setString(8,getAddress());
		ps.setString(9, getCity());
		ps.setString(10,getState());
		ps.setLong(11, getZipCode());
		ps.setString(12, getAccType());
		int result = ps.executeUpdate();
		
		if(result > 0) {
			return true;
		}
		return false;
	}
	
	public long generateRandom() {
		long max = 9999999999999999l ;
        long min = 1111111111111111l ;
        return (long)(Math.random() * (max - min + 1) + min);
        
	}
	
	public boolean addToAccounttable() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "insert into accountinfo(username , account_no , acc_password , account_type , balance , account_status) values(?,?,?,?,?,?);";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		long accNumber = generateRandom();
		ps.setLong(2, accNumber);
		ps.setString(3, getPassword1());
		ps.setString(4, getAccType());
		ps.setDouble(5, 0.0);
		ps.setString(6, "Active");
		int result = ps.executeUpdate();
		if(result > 0) {
			return true;
		}
		return false;
	}
	
	public boolean removeRequest() throws ClassNotFoundException, SQLException {
		String url = "jdbc:mysql://localhost:3306/bankmanagement";
		String dbName = "root" ;
		String dbPassword = "Password@123";
		String query = "delete from request where username = ? ;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,dbName,dbPassword);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,getUserName());
		int result = ps.executeUpdate();
		
		if(result > 0) {
			return true;
		}
		return false;
	}
	
}
