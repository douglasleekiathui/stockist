package sg.edu.nus.iss.sa45.team4.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="transactions")
public class Transaction {
	@Id
	@Column(name="transaction_no")
	private String transationNo;
	@Column(name="transaction_type")
	private String transactionType;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="transaction_date")
	private Date transactionDate;
	@Column(name="created_by")
	private String createdBy;
	public String getTransationNo() {
		return transationNo;
	}
	public void setTransationNo(String transationNo) {
		this.transationNo = transationNo;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	public String getCreatedFor() {
		return createdFor;
	}
	public void setCreatedFor(String createdFor) {
		this.createdFor = createdFor;
	}
	@Column(name="created_for")
	private String createdFor;
	
	

}
