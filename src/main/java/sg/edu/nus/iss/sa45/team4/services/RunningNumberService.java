package sg.edu.nus.iss.sa45.team4.services;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.RunningNumber;

public interface RunningNumberService {

	ArrayList<RunningNumber> findAllRunningNumbers();

	RunningNumber findRunningNumber(String ceid);

	RunningNumber createRunningNumber(RunningNumber RunningNumber);

	RunningNumber changeRunningNumber(RunningNumber RunningNumber);

	void removeRunningNumber(RunningNumber RunningNumber);

}