package com.giga.gw.service;

import java.util.List;
import java.util.Map;

import com.giga.gw.dto.ApprovalCategoryDto;

public interface IApprovalCategoryService {
	int categoryInsert(ApprovalCategoryDto categoryDto);
	List<ApprovalCategoryDto> categorySelect();
	List<ApprovalCategoryDto> categorySelectAll();
	ApprovalCategoryDto categorySelectById(String category_id);
	int categoryCheck(String category_yname);
	boolean categoryUpdateUseYN(Map<String, Object> map);
	int cntCategoryAll();
}
