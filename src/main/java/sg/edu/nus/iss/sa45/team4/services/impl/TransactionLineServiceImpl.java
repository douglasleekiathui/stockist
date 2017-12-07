package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.model.TransactionLineId;
import sg.edu.nus.iss.sa45.team4.repository.TransactionLineRepository;
import sg.edu.nus.iss.sa45.team4.services.TransactionLineService;


@Service
public class TransactionLineServiceImpl implements TransactionLineService {
	
	@Resource
	private TransactionLineRepository TransactionLineRepository;
	


	@Override
	@Transactional
	public ArrayList<TransactionLine> findAllTransactionLines() {
		ArrayList<TransactionLine> l = (ArrayList<TransactionLine>) TransactionLineRepository.findAll();
		return l;
	}


	
	@Override
	@Transactional
	public TransactionLine createTransactionLine(TransactionLine TransactionLine) {
		return TransactionLineRepository.saveAndFlush(TransactionLine);
	}

	
	@Override
	@Transactional
	public TransactionLine changeTransactionLine(TransactionLine TransactionLine) {
		return TransactionLineRepository.saveAndFlush(TransactionLine);
	}

	@Override
	@Transactional
	public void removeTransactionLine(TransactionLine TransactionLine) {
		TransactionLineRepository.delete(TransactionLine);
	}



	@Override
	public TransactionLine findTransactionLine(TransactionLineId ceid) {
		return TransactionLineRepository.findOne(ceid);
	}

}
