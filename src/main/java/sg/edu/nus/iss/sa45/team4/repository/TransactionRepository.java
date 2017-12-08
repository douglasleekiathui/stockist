package sg.edu.nus.iss.sa45.team4.repository;


import java.util.ArrayList;
import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import sg.edu.nus.iss.sa45.team4.model.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, String>{
	
	@Query("SELECT t from Transaction t WHERE t.transactionDate BETWEEN :fromDate AND :toDate")
	ArrayList<Transaction> findTransactionBetween(@Param(value="fromDate") Date fromDate,@Param(value="toDate") Date toDate);

}
