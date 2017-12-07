package sg.edu.nus.iss.sa45.team4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sg.edu.nus.iss.sa45.team4.model.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, String>{

}
