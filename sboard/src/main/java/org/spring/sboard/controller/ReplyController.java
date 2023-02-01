package org.spring.sboard.controller;

import org.spring.sboard.dto.SboardReplyDTO;
import org.spring.sboard.service.SboardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/sboard/reply/*")
public class ReplyController {
	
	@Autowired
	private SboardService service;
	
	@GetMapping("replyPro")
	public String replyPro(SboardReplyDTO dto, Model model) {
		return service.replyInsert(dto, model);
	}
}
