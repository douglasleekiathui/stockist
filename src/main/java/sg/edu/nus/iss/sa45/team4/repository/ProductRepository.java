package sg.edu.nus.iss.sa45.team4.repository;

import java.util.ArrayList;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.Supplier;

public interface ProductRepository extends JpaRepository<Product, String>{

	@Query("SELECT p from Product p WHERE p.onhandQty < p.reorderQty")
	ArrayList<Product> findReorderProducts();
	
	@Query("SELECT p from Product p WHERE p.primarySupplier = :s")
	ArrayList<Product> findProductsBySupplier(@Param("s") Supplier s);
	
	@Query("SELECT p from Product p WHERE p.primarySupplier = :s AND p.onhandQty < p.reorderQty")
	ArrayList<Product> findReorderProductsBySupplier(@Param("s") Supplier s);
}
