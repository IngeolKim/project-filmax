package org.spring.smember.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.spring.smember.dto.SmemberDTO;
import org.springframework.web.multipart.MultipartFile;

public interface SmemberService {
	public String loginForm();
	public String loginCheck(HttpSession session, SmemberDTO dto);
	public String inputForm();
	public String inputPro(SmemberDTO dto, MultipartFile upload, String path);
}
