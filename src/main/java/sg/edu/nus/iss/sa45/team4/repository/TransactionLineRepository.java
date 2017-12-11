package sg.edu.nus.iss.sa45.team4.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import sg.edu.nus.iss.sa45.team4.model.TransactionLine;
import sg.edu.nus.iss.sa45.team4.model.TransactionLineId;

public interface TransactionLineRepository extends JpaRepository<TransactionLine, TransactionLineId>{

}