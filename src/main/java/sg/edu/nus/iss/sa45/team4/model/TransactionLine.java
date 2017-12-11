package sg.edu.nus.iss.sa45.team4.model;


import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/*
 * See link below
 * https://en.wikibooks.org/wiki/Java_Persistence/Identity_and_Sequencing#Advanced
 */
@Entity
@Table(name="transactionlines")
@IdClass(TransactionLineId.class)
public class TransactionLine {

	@Id
	@Column(name="transaction_no")
	private String transactionNo;
	@Id
	@Column(name="line_no")
	private int lineNo;
	
	@Column(name="product_no")
	private String productNo;
	@Column(name="posted_qty")
	private int postedQty;
	

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="transaction_no", insertable=false, updatable=false)
	private Transaction transaction;

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

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public int getPostedQty() {
		return postedQty;
	}

	public void setPostedQty(int postedQty) {
		this.postedQty = postedQty;
	}

	public Transaction getTransaction() {
		return transaction;
	}

	public void setTransaction(Transaction transaction) {
		this.transaction = transaction;
	}
	


	
	
}