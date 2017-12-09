package sg.edu.nus.iss.sa45.team4.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="transactions")
public class Transaction {
	@Id
	@Column(name="transaction_no")
	private String transactionNo;
	@Column(name="transaction_type")
	private String transactionType;
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="transaction_date")
	private Date transactionDate;
	@Column(name="created_for")
	private String createdFor;
	@Column(name="created_by")
	private String createdBy;
	
	@OneToMany
	@JoinColumn(name="transaction_no")
	private List<TransactionLine> transactionLines;

	
	
	public Transaction() {
	}

	public Transaction(String transactionNo, String transactionType, Date transactionDate, String createdFor,
			String createdBy, List<TransactionLine> transactionLines) {
		super();
		this.transactionNo = transactionNo;
		this.transactionType = transactionType;
		this.transactionDate = transactionDate;
		this.createdFor = createdFor;
		this.createdBy = createdBy;
		this.transactionLines = transactionLines;
	}

	public String getTransactionNo() {
		return transactionNo;
	}

	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
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

	public String getCreatedFor() {
		return createdFor;
	}

	public void setCreatedFor(String createdFor) {
		this.createdFor = createdFor;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public List<TransactionLine> getTransactionLines() {
		return transactionLines;
	}

	public void setTransactionLines(List<TransactionLine> transactionLines) {
		this.transactionLines = transactionLines;
	}

	
	

}
