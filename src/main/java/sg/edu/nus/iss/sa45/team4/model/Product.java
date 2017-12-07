package sg.edu.nus.iss.sa45.team4.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="products")
public class Product {
	@Id
	@Column(name="product_no")
	private String productNo;
	@Column(name="product_description")
	private String productDescription;
	private String manufacturer;
	private String dimension;
	@Column(name="shelf_location")
	private String shelfLocation;
	@Column(name="primary_supplier")
	private String primarySupplier;
	@Column(name="min_qty")
	private int minQty;
	@Column(name="reorder_qty")
	private int reorderQty;
	@Column(name="onhand_qty")
	private int onhandQty;
	private BigDecimal price;
	
	
	public String getProductNo() {
		return productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public String getDimension() {
		return dimension;
	}
	public void setDimension(String dimension) {
		this.dimension = dimension;
	}
	public String getShelfLocation() {
		return shelfLocation;
	}
	public void setShelfLocation(String shelfLocation) {
		this.shelfLocation = shelfLocation;
	}
	public String getPrimarySupplier() {
		return primarySupplier;
	}
	public void setPrimarySupplier(String primarySupplier) {
		this.primarySupplier = primarySupplier;
	}
	public int getMinQty() {
		return minQty;
	}
	public void setMinQty(int minQty) {
		this.minQty = minQty;
	}
	public int getReorderQty() {
		return reorderQty;
	}
	public void setReorderQty(int reorderQty) {
		this.reorderQty = reorderQty;
	}
	public int getOnhandQty() {
		return onhandQty;
	}
	public void setOnhandQty(int onhandQty) {
		this.onhandQty = onhandQty;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	
}
