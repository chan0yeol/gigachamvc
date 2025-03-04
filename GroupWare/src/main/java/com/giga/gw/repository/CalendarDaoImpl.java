package com.giga.gw.repository;

import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CalendarDaoImpl implements ICalendarDao {

	private final SqlSessionTemplate sessionTemplate;
	private final String NS = "com.giga.gw.repository.CalendarDaoImpl.";
	
	@Override
	public int scheduleSave(Map<String, Object> schedule) {
		return sessionTemplate.insert(NS+"scheduleSave",schedule);
	}
	
	@Override
	public List<Map<String, Object>> loadSchedule() {
	    
	    List<Map<String, Object>> schedules = sessionTemplate.selectList(NS + "loadSchedule");

	    // 날짜 형식 변환
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");

	    for (Map<String, Object> schedule : schedules) {
	        Timestamp startTimestamp = (Timestamp) schedule.get("sch_startdate");
	        Timestamp endTimestamp = (Timestamp) schedule.get("sch_enddate");

	        // 🛑 NULL 체크 추가 → NULL이면 기본값 설정!
	        String startDate = (startTimestamp != null) 
	            ? startTimestamp.toLocalDateTime().format(formatter) 
	            : null;  // 또는 LocalDateTime.now().format(formatter);
	        
	        String endDate = (endTimestamp != null) 
	            ? endTimestamp.toLocalDateTime().format(formatter) 
	            : null;  // 또는 LocalDateTime.now().format(formatter);

	        schedule.put("start", startDate);
	        schedule.put("end", endDate);

	        // 컬럼명 변경 (FullCalendar에서 사용할 수 있도록)
	        schedule.put("title", schedule.remove("sch_title"));
	        schedule.put("backgroundColor", schedule.remove("sch_color"));
	    }

	    return schedules;
	}

}
