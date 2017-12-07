package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.Transaction;
import sg.edu.nus.iss.sa45.team4.repository.TransactionRepository;
import sg.edu.nus.iss.sa45.team4.services.TransactionService;


@Service
public class TransactionServiceImpl implements TransactionService{
	
	@Resource
	private TransactionRepository TransactionRepository;
	


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
		return TransactionRepository.saveAndFlush(Transaction);
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
