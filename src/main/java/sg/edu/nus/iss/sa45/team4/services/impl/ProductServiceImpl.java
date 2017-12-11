package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.repository.ProductRepository;
import sg.edu.nus.iss.sa45.team4.services.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Resource
	private ProductRepository ProductRepository;
	


	@Override
	@Transactional
	public ArrayList<Product> findAllProducts() {
		ArrayList<Product> l = (ArrayList<Product>) ProductRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public Product findProduct(String ceid) {
		return ProductRepository.findOne(ceid);

	}

	
	@Override
	@Transactional
	public Product createProduct(Product Product) {
		return ProductRepository.saveAndFlush(Product);
	}

	
	@Override
	@Transactional
	public Product changeProduct(Product Product) {
		return ProductRepository.saveAndFlush(Product);
	}

	@Override
	@Transactional
	public void removeProduct(Product Product) {
		ProductRepository.delete(Product);
	}


    @Transactional(readOnly=true)
    public List<Product> getReorderProductByPage(){
         List<Product> products = ProductRepository.findReorderProducts();
         return products;
//     		/*
//          * Manual implementation of pagination, because spring's page is too troublesome
//          * Takes in pageNumber and sizePerPage, returns the subList
//          * also does custom sorting which follows ReorderProductComparator
//          */
//         Collections.sort(products, new ReorderProductComparator());
//         int pageNo=Integer.parseInt(page);
//         int from = Math.max(0,pageNo*sizePerPage);
//         int to = Math.min(products.size(),(pageNo+1)*sizePerPage);
//         return products.subList(from,to);
    }
    
    
    @Override
    public List<Product> findProductsBySupplier(Supplier s){
    	List<Product> products= ProductRepository.findProductsBySupplier(s);
    	return products;
    }
    
    @Override
    public List<Product> findReorderProductsBySupplier(Supplier s){
    	List<Product> products= ProductRepository.findReorderProductsBySupplier(s);
    	return products;
    }


	@Override
	public void updateUsage(String productNum, int quantity) {
		// TODO Auto-generated method stub
		
	}
}
