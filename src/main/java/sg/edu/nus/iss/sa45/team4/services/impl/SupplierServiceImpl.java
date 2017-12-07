package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.repository.SupplierRepository;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;


@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Resource
	private SupplierRepository SupplierRepository;
	


	@Override
	@Transactional
	public ArrayList<Supplier> findAllSuppliers() {
		ArrayList<Supplier> l = (ArrayList<Supplier>) SupplierRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public Supplier findSupplier(String ceid) {
		return SupplierRepository.findOne(ceid);

	}

	
	@Override
	@Transactional
	public Supplier createSupplier(Supplier Supplier) {
		return SupplierRepository.saveAndFlush(Supplier);
	}

	
	@Override
	@Transactional
	public Supplier changeSupplier(Supplier Supplier) {
		return SupplierRepository.saveAndFlush(Supplier);
	}

	@Override
	@Transactional
	public void removeSupplier(Supplier Supplier) {
		SupplierRepository.delete(Supplier);
	}

}
