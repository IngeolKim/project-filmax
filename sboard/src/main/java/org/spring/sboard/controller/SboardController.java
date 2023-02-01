package org.spring.sboard.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.spring.sboard.dto.SboardDTO;
import org.spring.sboard.dto.SboardLikeDTO;
import org.spring.sboard.service.SboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/sboard/*")
public class SboardController {
	
	@Autowired
	private SboardService service;
	
	@Autowired
	private ServletContext application;					//application 은 프로젝트 자체다.

	@GetMapping("list")
	public String list(Model model, SboardDTO dto,
						@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum ) {
		int pageSize = 10;
	
		dto.setStart((pageNum-1) * pageSize + 1);
		dto.setEnd(pageNum * pageSize);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("pageNum", pageNum);
		return service.list(model, dto);
	}
	@GetMapping("writeForm")
	public String writeForm(SboardDTO dto,Model model) {
		return service.writeForm(model);
	}
	
	@PostMapping("writePro")
	public String writePro(SboardDTO dto, MultipartFile [] upload) {
		String path = application.getRealPath("/resources/sboard/file");
		return service.writePro(dto, upload, path);
	}
	@GetMapping("read")
	public String read(int num, Model model, HttpServletRequest request) {
		return service.read(num,model,request.getRemoteAddr());
	}
	@GetMapping("like")
	public @ResponseBody String like(SboardLikeDTO likeDTO, int change, HttpServletRequest request) {		//@ResponseBody 는 전달받은 값을 뷰로 안보낼때
		likeDTO.setWriter(request.getRemoteAddr());
		return service.like(likeDTO, change);				//getRemoteAddr 요청한 사용자의 IP
	}
	@GetMapping("searchList")
	public String searchList(String search, String searchValue, Model model) {
		return service.searchList(search, searchValue, model);
	}
	
}
