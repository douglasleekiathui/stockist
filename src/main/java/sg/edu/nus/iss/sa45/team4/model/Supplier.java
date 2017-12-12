package sg.edu.nus.iss.sa45.team4.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="suppliers")
public class Supplier {
	@Id
	@Column(name="supplier_no")
	private String supplierNo;
	@Column(name="supplier_name")
	private String supplierName;
	@Column(name="supplier_contact")
	private String supplierContact;
	@Column(name="supplier_email")
	private String supplierEmail;
	@Column(name="record_status")
	private int recordStatus;
	
	@OneToMany(mappedBy="primarySupplier",fetch=FetchType.EAGER)
	private Set<Product> products;


	public int getRecordStatus() {
		return recordStatus;
	}

	public void setRecordStatus(int recordStatus) {
		this.recordStatus = recordStatus;
	}

	
	
	
	public String getSupplierNo() {
		return supplierNo;
	}

	public void setSupplierNo(String supplierNo) {
		this.supplierNo = supplierNo;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSupplierContact() {
		return supplierContact;
	}

	public void setSupplierContact(String supplierContact) {
		this.supplierContact = supplierContact;
	}

	public String getSupplierEmail() {
		return supplierEmail;
	}

	public void setSupplierEmail(String supplierEmail) {
		this.supplierEmail = supplierEmail;
	}

	public Set<Product> getProducts() {
		return products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
	
}
