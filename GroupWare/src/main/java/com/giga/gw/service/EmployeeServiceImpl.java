package com.giga.gw.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.giga.gw.dto.EmployeeDto;
import com.giga.gw.repository.IEmployeeDao;
import com.giga.gw.repository.ILoginDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class EmployeeServiceImpl implements IEmployeeService {
	
	private final IEmployeeDao employeeDao;
	private final ILoginDao loginDao;
	
	@Override
	public boolean saveSignature(Map<String, Object> map) {
		employeeDao.updateSignature(map.get("empno").toString());
		return employeeDao.saveSignature(map);
	}

	@Override
	public List<Map<String, Object>> readSignature(String empno) {
		
		return employeeDao.readSignature(empno);
	}

	@Override
	public String getNextEmpno(String hiredate) {
		return employeeDao.getNextEmpno(hiredate);
	}

	@Override
	public List<EmployeeDto> employeeList() {
		return employeeDao.employeeList();
	}
	
	@Override
	public EmployeeDto getEmpno(String empno) {
		return employeeDao.getEmpno(empno);
	}

	@Override
	public EmployeeDto getMypage(String empno) {
		return employeeDao.getMypage(empno);
	}

	

	

}
