package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;

import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.model.TransactionLineId;

public interface TransactionLineService {

	ArrayList<TransactionLine> findAllTransactionLines();
	
	TransactionLine findTransactionLine(TransactionLineId ceid);

	TransactionLine createTransactionLine(TransactionLine TransactionLine);

	TransactionLine changeTransactionLine(TransactionLine TransactionLine);

	void removeTransactionLine(TransactionLine TransactionLine);

}