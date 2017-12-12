package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.RunningNumber;
import sg.edu.nus.iss.sa45.team4.model.Supplier;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.repository.RunningNumberRepository;
import sg.edu.nus.iss.sa45.team4.repository.SupplierRepository;
import sg.edu.nus.iss.sa45.team4.services.SupplierService;


@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Resource
	private SupplierRepository SupplierRepository;
	@Resource
	private RunningNumberRepository runningNumberRepository;
	


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
	public Supplier createSupplier(Supplier supplier) {
		//return SupplierRepository.saveAndFlush(supplier);
		Supplier sup=supplier;
		RunningNumber rn=runningNumberRepository.findOne("suppliers");
		int sNo=rn.getValue()+1;
		rn.setValue(sNo);
		runningNumberRepository.saveAndFlush(rn);
		
		String sNumber="S"+String.format("%04d", sNo);
		//tx.setTransactionNo(txNumber);
		sup.setSupplierNo(sNumber);
		
//		int lineNo=0;
//		Iterator<TransactionLine> i= tx.getTransactionLines().iterator();
//		while(i.hasNext()) {
//			TransactionLine tl=i.next();
//			if(tl.getPostedQty()!=0) {
//				lineNo++;
//				tl.setTransactionNo(txNumber);
//				tl.setLineNo(lineNo);
//				tl.setTransaction(tx);
//			}else
//				i.remove();
//		}
		//TransactionRepository.saveAndFlush(tx);
		return SupplierRepository.saveAndFlush(sup);
//		for (TransactionLine tl: tx.getTransactionLines()) {
//			Product p= productRepository.findOne(tl.getProductNo());
//			p.setOnhandQty(p.getOnhandQty()+tl.getPostedQty());
//			transactionLineRepository.saveAndFlush(tl);
//			productRepository.saveAndFlush(p);
//		}
	
	}

	
	@Override
	@Transactional
	public Supplier changeSupplier(Supplier supplier) {
		return SupplierRepository.saveAndFlush(supplier);
	}

	@Override
	@Transactional
	public void removeSupplier(Supplier supplier) {
		SupplierRepository.delete(supplier);
	}

}
