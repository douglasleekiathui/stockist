package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;
import java.util.List;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.Supplier;

public interface ProductService {

	ArrayList<Product> findAllProducts();

	Product findProduct(String ceid);

	Product createProduct(Product Product);

	Product changeProduct(Product Product);

	void removeProduct(Product Product);

	List<Product> getReorderProductByPage();
	
	List<Product> findProductsBySupplier(Supplier s);
	
	List<Product> findReorderProductsBySupplier(Supplier s);
	
	void updateUsage(String productNum, int quantity);
	
}