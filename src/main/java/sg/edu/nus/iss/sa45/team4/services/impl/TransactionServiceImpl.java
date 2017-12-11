package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;
import java.util.Iterator;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Product;
import sg.edu.nus.iss.sa45.team4.model.RunningNumber;
import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.repository.ProductRepository;
import sg.edu.nus.iss.sa45.team4.repository.RunningNumberRepository;
import sg.edu.nus.iss.sa45.team4.repository.TransactionLineRepository;
import sg.edu.nus.iss.sa45.team4.repository.TransactionRepository;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;


@Service
public class TransactionServiceImpl implements TransactionService{
	
	@Resource
	private TransactionRepository TransactionRepository;
	@Resource
	private RunningNumberRepository runningNumberRepository;
	@Resource
	private ProductRepository productRepository;
	@Resource
	private TransactionLineRepository transactionLineRepository;
	

	@Override
	@Transactional
	public ArrayList<Transaction> findAllTransactions() {
		ArrayList<Transaction> l = (ArrayList<Transaction>) TransactionRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public Transaction findTransaction(String ceid) {
		return TransactionRepository.findOne(ceid);

	}

	@Override
	@Transactional
	public Transaction createTransaction(Transaction Transaction) {
		
		
		Transaction tx=Transaction;
		RunningNumber rn=runningNumberRepository.findOne("transactions");
		int txNo=rn.getValue()+1;
		rn.setValue(txNo);
		runningNumberRepository.saveAndFlush(rn);
		
		String txNumber="T"+String.format("%04d", txNo);
		tx.setTransactionNo(txNumber);
		
		int lineNo=0;
		Iterator<TransactionLine> i= tx.getTransactionLines().iterator();
		while(i.hasNext()) {
			TransactionLine tl=i.next();
			if(tl.getPostedQty()!=0) {
				lineNo++;
				tl.setTransactionNo(txNumber);
				tl.setLineNo(lineNo);
				tl.setTransaction(tx);
			}else
				i.remove();
		}
		TransactionRepository.saveAndFlush(tx);
		for (TransactionLine tl: tx.getTransactionLines()) {
			Product p= productRepository.findOne(tl.getProductNo());
			p.setOnhandQty(p.getOnhandQty()+tl.getPostedQty());
			transactionLineRepository.saveAndFlush(tl);
			productRepository.saveAndFlush(p);
		}
		return tx;
	}

	
	@Override
	@Transactional
	public Transaction changeTransaction(Transaction Transaction) {
		return TransactionRepository.saveAndFlush(Transaction);
	}

	@Override
	@Transactional
	public void removeTransaction(Transaction Transaction) {
		TransactionRepository.delete(Transaction);
	}

}
