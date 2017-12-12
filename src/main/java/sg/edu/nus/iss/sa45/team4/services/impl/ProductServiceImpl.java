package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.RunningNumber;
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.repository.ProductRepository;
import sg.edu.nus.iss.sa45.team4.repository.RunningNumberRepository;
import sg.edu.nus.iss.sa45.team4.services.ProductService;


@Service
public class ProductServiceImpl implements ProductService{
	
	@Resource
	private ProductRepository ProductRepository;
	
	@Resource
	private RunningNumberRepository runningNumberRepository;

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
		
		Product p= Product;
		RunningNumber rn= runningNumberRepository.findOne("products");
		int pNo =rn.getValue()+1;
		rn.setValue(pNo);
		runningNumberRepository.saveAndFlush(rn);
		
		String pNumber="P"+String.format("%04d", pNo);
		p.setProductNo(pNumber);
		
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
