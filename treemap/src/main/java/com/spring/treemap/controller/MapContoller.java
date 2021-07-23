package com.spring.treemap.controller;

import java.util.List;
import java.util.Locale.Category;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.domain.CategoryVO;
import com.spring.treemap.domain.MapVO;
import com.spring.treemap.domain.Page;
import com.spring.treemap.service.MapService;

@Controller
@RequestMapping("/treeMap/*")
public class MapContoller {

	@Autowired
	MapService service;

	// 처음 들어올시
	@GetMapping("/map")
	public String openMap(Model model,@RequestParam("num") int num
			,@RequestParam(value="keyword",required = false,defaultValue = "")String keyword) {
		
		int userNo = 1;
		System.out.println(keyword);
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.getAddressCount(keyword));
		
		page.setKeyword(keyword);
		
		model.addAttribute("mapBoardList", service.getMapBoardList(userNo,page.getDisplayPost(),page.getPostNum(),keyword));
		model.addAttribute("catName", service.getMapBoardCateNameList(userNo));
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
		return "treeMap/map";
	}

	// 이벤트 발생시 다시 받음
	@GetMapping("/reloadBoard")
	public String getMapBoard(Model model,@RequestParam("num") int num,
			@RequestParam(value="keyword",required = false,defaultValue = "")String keyword) {
		int userNo = 1;
		Page page = new Page();
		page.setNum(num);
		page.setCount(service.getAddressCount(keyword));
		
		page.setKeyword(keyword);
		System.out.println(page.getKeyword());
		
		model.addAttribute("mapBoardList", service.getMapBoardList(userNo,page.getDisplayPost(),page.getPostNum(),keyword));
		model.addAttribute("catName", service.getMapBoardCateNameList(userNo));
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		return "include/mapboard";
	}

	// 즐겨찾기 등록
	@ResponseBody
	@PostMapping("/favorites")
	public void insertMap(AddressVO address, CategoryVO category) {
		service.insertCategory(category);
		service.insertAddress(address);
	}

	// 상세보기
	@GetMapping("/mapBoardDetail")
	public String getMapBoardDetail(int adrNo,int catNo,Model model) {
		MapVO mapBoardDetail = service.getMapBoardDetail(adrNo,catNo);
		AddressVO address = mapBoardDetail.getAddress();
		CategoryVO category = mapBoardDetail.getCategory();
		
		// detail이 true면 include가 바뀜
		address.setDetail(true);
		model.addAttribute("address", address);
		model.addAttribute("category", category);

		return "include/mapboard";
	}
	
	//수정
	@ResponseBody
	@PostMapping("/modifyMapBoard")
	public String modifyMapBoard(AddressVO address, CategoryVO category) {
		service.updateCategory(category);
		service.updateAddress(address);
		
		return "include/mapboard";
	}
	
	//삭제
	@PostMapping("/deleteMapBoard")
	public String deleteMapBoard(int adrNo, int catNo) {
		service.deleteAddress(adrNo);
		service.deleteCateGory(catNo);
		
		return "include/mapboard";
	}
	
	@GetMapping("/catNameList")
	public String catNameList(String catName,Model model) {
		System.out.println(catName);
		int userNo=1;
		model.addAttribute("catName", service.getMapBoardCateNameList(userNo));
		//userNo도 받아야함
		model.addAttribute("mapBoardList", service.getCatNameList(catName));
		return "include/mapboard";
	}
	
}
