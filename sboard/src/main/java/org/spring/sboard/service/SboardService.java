package org.spring.sboard.service;

import org.spring.sboard.dto.SboardDTO;
import org.spring.sboard.dto.SboardLikeDTO;
import org.spring.sboard.dto.SboardReplyDTO;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

public interface SboardService {
	public String writeForm(Model model);
	public String list(Model model, SboardDTO dto);
	public String writePro(SboardDTO dto, MultipartFile [] upload, String path);
	public String read(int num, Model model, String writer);
	public String like(SboardLikeDTO likeDTO, int change);
	public String searchList(String search, String searchValue, Model model);
	
	public String replyInsert(SboardReplyDTO dto, Model model);
}
