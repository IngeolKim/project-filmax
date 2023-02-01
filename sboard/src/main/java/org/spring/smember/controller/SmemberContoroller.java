package org.spring.smember.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.spring.smember.dto.SmemberDTO;
import org.spring.smember.service.SmemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/smember/*")
public class SmemberContoroller {
	@Autowired
	private SmemberService service;
	
	@RequestMapping("main")
	public String main() {		
		return "member/main";
	}
	@GetMapping("loginForm")
	public String loginForm() {
		return service.loginForm();
	}
	@PostMapping("loginPro")
	public String loginPro(SmemberDTO dto, HttpSession session) {
		return service.loginCheck(session,dto);
	}
	
	@GetMapping("inputForm")
	public String inputForm() {
		return service.inputForm(); 
	}
	@RequestMapping("inputPro")
	public String inputPro(SmemberDTO dto, MultipartFile upload, HttpServletRequest request) {
		String path= request.getRealPath("/resources/memberImg");
		return service.inputPro(dto, upload,path);
	}
	
}