package sg.edu.nus.iss.sa45.team4.services.impl;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import sg.edu.nus.iss.sa45.team4.model.RunningNumber;
import sg.edu.nus.iss.sa45.team4.repository.RunningNumberRepository;
import sg.edu.nus.iss.sa45.team4.services.RunningNumberService;



@Service
public class RunningNumberServiceImpl implements RunningNumberService{
	
	@Resource
	private RunningNumberRepository RunningNumberRepository;
	


	@Override
	@Transactional
	public ArrayList<RunningNumber> findAllRunningNumbers() {
		ArrayList<RunningNumber> l = (ArrayList<RunningNumber>) RunningNumberRepository.findAll();
		return l;
	}


	@Override
	@Transactional
	public RunningNumber findRunningNumber(String ceid) {
		return RunningNumberRepository.findOne(ceid);

	}

	
	@Override
	@Transactional
	public RunningNumber createRunningNumber(RunningNumber RunningNumber) {
		return RunningNumberRepository.saveAndFlush(RunningNumber);
	}

	
	@Override
	@Transactional
	public RunningNumber changeRunningNumber(RunningNumber RunningNumber) {
		return RunningNumberRepository.saveAndFlush(RunningNumber);
	}

	@Override
	@Transactional
	public void removeRunningNumber(RunningNumber RunningNumber) {
		RunningNumberRepository.delete(RunningNumber);
	}

}
