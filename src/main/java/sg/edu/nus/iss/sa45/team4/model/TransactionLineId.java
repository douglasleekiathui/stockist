package sg.edu.nus.iss.sa45.team4.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;


public class TransactionLineId implements Serializable {

	
	@Id
	@Column(name="transaction_no")
	private String transactionNo;
	@Id
	@Column(name="line_no")
	private int lineNo;
	
	
	
	
	public String getTransactionNo() {
		return transactionNo;
	}
	public void setTransactionNo(String transactionNo) {
		this.transactionNo = transactionNo;
	}
	public int getLineNo() {
		return lineNo;
	}
	public void setLineNo(int lineNo) {
		this.lineNo = lineNo;
	}
	
	public boolean equals(Object o) {
		if(o instanceof TransactionLineId) {
			TransactionLineId t=(TransactionLineId) o;
			if(t.getTransactionNo()==this.transactionNo && t.getLineNo()==this.lineNo)
				return true;
		}
		return false;
	}
	
	public int getHashcode() {
		return Objects.hash(this.transactionNo,this.lineNo);
	}
	
}
