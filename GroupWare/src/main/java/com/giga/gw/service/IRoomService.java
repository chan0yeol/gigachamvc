package com.giga.gw.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.giga.gw.dto.RoomDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

public interface IRoomService {
	
	int insertRoom(RoomDto roomDto);
	List<RoomDto> selectAllRooms();
	RoomDto selectRoomById(String roomId);
	int updateRoom(RoomDto roomDto);
	int delRooms(List<String> roomId);
	
	

}
