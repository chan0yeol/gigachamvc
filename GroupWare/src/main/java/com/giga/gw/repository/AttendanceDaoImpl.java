package com.giga.gw.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AttendanceDaoImpl implements IAttendanceDao {

	private final SqlSessionTemplate sessionTemplate;
	private final String NS = "com.giga.gw.repository.AttendanceDaoImpl.";
	
	@Override
	public void createattendacetable() {
		System.out.println("스케쥴러 동작 φ(゜▽゜*)♪φ(゜▽゜*)♪ φ(゜▽゜*)♪φ(゜▽゜*)♪");
		sessionTemplate.insert(NS+"createattendacetable");
	}
}
