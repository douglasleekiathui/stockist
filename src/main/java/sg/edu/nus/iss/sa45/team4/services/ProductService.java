package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;


import sg.edu.nus.iss.sa45.team4.model.Product;

public interface ProductService {

	ArrayList<Product> findAllProducts();

	Product findProduct(String ceid);

	Product createProduct(Product Product);

	Product changeProduct(Product Product);

	void removeProduct(Product Product);

}