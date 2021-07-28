package com.spring.treemap.controller;

import java.util.List;

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

import com.spring.treemap.domain.AddressVO;
import com.spring.treemap.security.domain.CustomUser;
import com.spring.treemap.service.MapService;

@Controller
@RequestMapping("/treeMap/*")
public class MapContoller {
	
	@Autowired
	MapService service;
	
	@GetMapping("/map")
	public void openMap(Model model) {
		System.out.println("접근");
		int userNo = 1;

	}
	
	@PostMapping("/favorites")
	@ResponseBody
	public void ajaxTest(AddressVO vo) {
		System.out.println(vo);
		
		service.insertCategory(vo);
		service.insertAddress(vo);
	}
	
}
