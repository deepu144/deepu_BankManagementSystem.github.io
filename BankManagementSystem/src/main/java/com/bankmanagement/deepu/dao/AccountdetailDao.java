package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class AccountdetailDao {
	private String userName ;
	private long accNo ;
	private double balance ;
	private String referenceId ;
	private String status ;
	private Date openingDate;
	private String accType;
	
	public AccountdetailDao(String userName) throws ClassNotFoundException, SQLException {
		super();
		this.userName = userName;
		this.getAttributes();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getAccNo() {
		return accNo;
	}

	public void setAccNo(long accNo) {
		this.accNo = accNo;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}
	
	public String getReferenceId() {
		return referenceId;
	}

	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(Date openingDate) {
		this.openingDate = openingDate;
	}
	
	public String getAccType() {
		return accType;
	}

	public void setAccType(String accType) {
		this.accType = accType;
	}

	@Override
	public String toString() {
		return "AccountdetailDao [userName=" + userName + ", accNo=" + accNo + ", balance=" + balance + "]";
	}
	
	public String getRandom() {
		long min = 10000000;
		long max = 99999999;
		String id = "TX"+((long)(Math.random() * (max - min + 1) + min));
		setReferenceId(id);
		return id;
	}
	
	public void getAttributes() throws SQLException, ClassNotFoundException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select * from accountinfo where username = ? ;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			this.setAccNo(rs.getLong(2));
			this.setBalance(rs.getDouble(5));
			this.setStatus(rs.getString(7));
			this.setOpeningDate(rs.getDate(6));
			this.setAccType(rs.getString(4));
		}
	}
	
	public boolean isUserFound() throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select * from accountinfo where username = ? ;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ResultSet rs = ps.executeQuery();
		
		if(rs.next()) {
			return true ;
		}
		
		return false;
	}
	
	public boolean doCredit(double amount , AccountdetailDao ad ) throws ClassNotFoundException, SQLException {
		
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query1 = "update accountinfo set balance = ? where username = ? ;";
		String query2 = "insert into alltransaction(username , reference_id , description , transaction_type , amount , status) values(?,?,?,?,?,?);";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		con.setAutoCommit(false);
		PreparedStatement ps = con.prepareStatement(query1);
		ps.setDouble(1, getBalance() + amount);
		ps.setString(2, getUserName());
		int r = ps.executeUpdate();
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, getUserName());
		ps2.setString(2, getRandom());
		ps2.setString(3, "Fund Received from "+ad.getUserName()+"");
		ps2.setString(4, "Credit");
		ps2.setDouble(5, amount);
		ps2.setString(6, "Success");
		int r2 = ps2.executeUpdate();
		if(r!=0 && r2!=0) {
			con.commit();
			return true;
		}
		con.rollback();
		return false ;
	}
	
	public boolean doDebit(double amount , String description , AccountdetailDao ad) throws SQLException, ClassNotFoundException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query1 = "update accountinfo set balance = ? where username = ? ;";
		String query2 = "insert into alltransaction(username , reference_id , description , transaction_type , amount , status) values(?,?,?,?,?,?);";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		con.setAutoCommit(false);
		PreparedStatement ps1 = con.prepareStatement(query1);
		ps1.setDouble(1, getBalance() - amount);
		ps1.setString(2, getUserName());
		int r1 = ps1.executeUpdate();
		
		PreparedStatement ps2 = con.prepareStatement(query2);
		ps2.setString(1, getUserName());
		ps2.setString(2, ad.getReferenceId());
		ps2.setString(3,description);
		ps2.setString(4,"Debit");
		ps2.setDouble(5, amount);
		ps2.setString(6, "Success");
		int r2 = ps2.executeUpdate();
		
		if(r1!=0 && r2!=0) {
			con.commit();
			return true;
		}
		con.rollback();
		return false;
	}
	
	public boolean doFailedUpdate(Double amount , String description) throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "insert into alltransaction(username , reference_id , description , transaction_type , amount , status) values(?,?,?,?,?,?);";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, getUserName());
		ps.setString(2, getRandom());
		ps.setString(3, description);
		ps.setString(4, "Debit");
		ps.setDouble(5, amount);
		ps.setString(6, "Failed");
		int r = ps.executeUpdate();
		if(r!=0) {
			return true;
		}
		return false;
	}
	
	public boolean doUpdate(String changeStatus , String changeAccountType) throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "update accountinfo set account_status = ? , account_type = ? where username = ?";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, changeStatus);
		ps.setString(2, changeAccountType);
		ps.setString(3, userName);
		int result = ps.executeUpdate();
		
		if(result > 0) {
			return true;
		}
		return false;
	}
}
