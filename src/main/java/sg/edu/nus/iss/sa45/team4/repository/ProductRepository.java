package sg.edu.nus.iss.sa45.team4.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import sg.edu.nus.iss.sa45.team4.model.Product;

public interface ProductRepository extends JpaRepository<Product, String>{

	@Query("SELECT p from Product p WHERE p.onhandQty < p.minQty")
	ArrayList<Product> findReorderProducts();
	
}
