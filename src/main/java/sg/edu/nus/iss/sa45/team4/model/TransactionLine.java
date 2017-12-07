package sg.edu.nus.iss.sa45.team4.model;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="transactionlines")
public class TransactionLine {

	@EmbeddedId
	private TransactionLineId transactionLineId;
	@Column(name="product_no")
	private String productNo;
	@Column(name="posted_qty")
	private int postedQty;
	
	public String getTransactionNo() {
		return this.transactionLineId.getTransactionNo();
	}
	public void setTransactionNo(String t) {
		this.transactionLineId.setTransactionNo(t);
	}
	public int getLineNo() {
		return this.transactionLineId.getLineNo();
	}
	public void setLineNo(int t) {
		this.transactionLineId.setLineNo(t);
	}
	
	public TransactionLineId getTransactionLineId() {
		return transactionLineId;
	}
	public void setTransactionLineId(TransactionLineId transactionLineId) {
		this.transactionLineId = transactionLineId;
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
	
	
}
