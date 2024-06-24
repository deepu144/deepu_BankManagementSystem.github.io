package com.bankmanagement.deepu.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TransactionDetailDao {
	private String userName;
	private Date transactionDate;
	private String referenceId;
	private String description ;
	private String transactionType ;
	private double amount ;
	private String status ;
	
	
	public TransactionDetailDao(String userName,String referenceId) throws ClassNotFoundException, SQLException {
		this.referenceId = referenceId;
		this.userName = userName;
		this.getAttributes();
	}
	
	public TransactionDetailDao(String userName) {
		this.userName = userName;
	}

	public TransactionDetailDao() {
		super();
	}

	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public Date getTransactionDate() {
		return transactionDate;
	}
	
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	
	public String getReferenceId() {
		return referenceId;
	}
	
	public void setReferenceId(String referenceId) {
		this.referenceId = referenceId;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getTransactionType() {
		return transactionType;
	}
	
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	
	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public ArrayList<String> getAllTransaction() throws ClassNotFoundException, SQLException{
		
		ArrayList<String> transactions = new ArrayList<String>();
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "select distinct reference_id from alltransaction where username = ?;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, userName);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			transactions.add(rs.getString(1));
		}
		rs.close();
		ps.close();
		con.close();
		
		return transactions;
	}
	
	public void getAttributes() throws ClassNotFoundException, SQLException {
		String url ="jdbc:mysql://localhost:3306/bankmanagement";
		String name = "root";
		String password = "Password@123";
		String query = "SELECT * from alltransaction WHERE reference_id = ? AND username = ? order by transaction_date desc;";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(url,name,password);
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1,referenceId);
		ps.setString(2, userName);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			this.setTransactionDate(rs.getDate(2));
			this.setDescription(rs.getString(4));
			this.setTransactionType(rs.getString(5));
			this.setAmount(rs.getDouble(6));
			this.setStatus(rs.getString(7));
		}
	}

	@Override
	public String toString() {
		return "TransactionDetailDao [userName=" + userName + ", transactionDate=" + transactionDate + ", referenceId="
				+ referenceId + ", description=" + description + ", transactionType=" + transactionType + ", amount="
				+ amount + ", status=" + status + "]";
	}
	
	
	
}
