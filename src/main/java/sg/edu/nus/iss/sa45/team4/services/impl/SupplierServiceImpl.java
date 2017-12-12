package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.repository.RunningNumberRepository;
import sg.edu.nus.iss.sa45.team4.repository.SupplierRepository;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;


@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Resource
	private SupplierRepository sRepository;
	@Resource
	private RunningNumberRepository rnRepository;


	@Override
	@Transactional
	public ArrayList<Supplier> findAllSuppliers() {
		ArrayList<Supplier> l = (ArrayList<Supplier>) sRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public Supplier findSupplier(String ceid) {
		return sRepository.findOne(ceid);

	}

	
	@Override
	@Transactional
	public Supplier createSupplier(Supplier Supplier) {
		return sRepository.saveAndFlush(Supplier);
	}

	
	@Override
	@Transactional
	public Supplier changeSupplier(Supplier Supplier) {
		return sRepository.saveAndFlush(Supplier);
	}

	@Override
	@Transactional
	public void removeSupplier(Supplier Supplier) {
		sRepository.delete(Supplier);
	}

}
