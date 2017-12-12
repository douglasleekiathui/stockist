package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;

import sg.edu.nus.iss.sa45.team4.model.Transaction;

public interface TransactionService {

	ArrayList<Transaction> findAllTransactions();

	Transaction findTransaction(String ceid);

	Transaction createTransaction(Transaction Transaction);

	Transaction changeTransaction(Transaction Transaction);

	void removeTransaction(Transaction Transaction);

	Transaction createTransaction_Mechanic(Transaction tx);

}