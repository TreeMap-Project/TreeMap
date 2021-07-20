package com.spring.treemap.controller;

import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.service.MapService;

@Controller
@RequestMapping("/treeMap/*")
public class MapContoller {
	
	@Autowired
	MapService service;
	//처음 들어올시
	@GetMapping("/map")
	public String openMap(Model model) {
		System.out.println("접근");
		int userNo = 1;
		List<AddressVO> vo = service.getMapBoardList(userNo);
		
		model.addAttribute("mapBoardList",vo);
		return "treeMap/map";
	}
	
	//즐겨찾기 등록시 include 다시 받음
	@GetMapping("/reloadBoard")
	public String getMapBoard(Model model) {
		int userNo = 1;
		List<AddressVO> vo = service.getMapBoardList(userNo);
		System.out.println(vo);
		model.addAttribute("mapBoardList",vo);
		return "include/mapboard";
	}
	
	//즐겨찾기 등록
	@ResponseBody
	@PostMapping("/favorites")
	public void insertMap(AddressVO address,CategoryVO category) {
		service.insertCategory(category);
		service.insertAddress(address);
	}
	
	//상세보기
	@GetMapping("/mapBoardDetail")
	public String getMapBoardDetail(int adrNo,Model model) {
		AddressVO detail = service.getMapBoardDetail(adrNo);
		//detail이 true면 include가 바뀜
		detail.setDetail(true);
		model.addAttribute("mapBoardDetail", detail);
		
		return "include/mapboard";
	}
}
