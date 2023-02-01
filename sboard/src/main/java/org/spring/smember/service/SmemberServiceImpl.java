package org.spring.smember.service;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.spring.smember.dao.SmemberMapper;
import org.spring.smember.dto.SmemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SmemberServiceImpl implements SmemberService{

	@Autowired
	private SmemberMapper mapper;
	
	@Override
	public String loginForm() {
		return "smember/loginForm";
	}
	@Override
	public String loginCheck(HttpSession session, SmemberDTO dto) {
		String result="/smember/loginPro";
		int count = mapper.login(dto);
		if(count==1) {
			session.setAttribute("sid", dto.getId());
			result = "redirect:main";	
		}		
		return "smember/loginPro";
	}
	@Override
	public String inputForm() {
		return "smember/inputForm";	
	} 
	@Override
	public String inputPro(SmemberDTO dto, MultipartFile upload, String path) {
		String orgName = upload.getOriginalFilename();
		dto.setImg("default.png");
		if(orgName.equals("")) {
			String ext = orgName.substring(orgName.lastIndexOf("."));
			File copy = new File(path +"//"+dto.getId()+ext);
			try {
				upload.transferTo(copy);
			}catch(Exception e) {
				e.printStackTrace();
			}
			dto.setImg(dto.getId()+ext);
		}
		mapper.inputMember(dto);
		return "smember/inputPro";
	}



	

	

}
