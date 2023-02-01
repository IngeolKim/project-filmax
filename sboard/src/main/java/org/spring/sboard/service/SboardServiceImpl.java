package org.spring.sboard.service;

import java.io.File;

import org.spring.sboard.dao.SboardMapper;
import org.spring.sboard.dto.SboardDTO;
import org.spring.sboard.dto.SboardFileDTO;
import org.spring.sboard.dto.SboardLikeDTO;
import org.spring.sboard.dto.SboardReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class SboardServiceImpl implements SboardService{
	
	@Autowired
	private SboardMapper mapper;
	
	@Override
	public String writeForm( Model model) {
		model.addAttribute("boardType",mapper.typeList());
		return "sboard/writeForm";
	}
	@Override
	public String list(Model model, SboardDTO dto) {
		if(dto.getBoardType()==0) {			
			model.addAttribute("list", mapper.allList(dto));
		}else {
			model.addAttribute("list", mapper.boardList(dto.getBoardType()));
		}
		model.addAttribute("typeList2", mapper.typeList2());
		model.addAttribute("count",mapper.boardCount());
		return "sboard/list";
	}
	@Override
	public String writePro(SboardDTO dto, MultipartFile [] upload, String path) {
		mapper.sboardInsert(dto); //DB insert
		int i = 0;
		for(MultipartFile mf : upload) {						// for(Ŭ���� �̸� :�ݺ��ؾ��� ���) �ݺ����� �̸����� ����
			String fileName = mf.getOriginalFilename();
			if(!fileName.equals("")) {
				String ext = fileName.substring(fileName.lastIndexOf("."));		//Ȯ���� �����´�
				fileName ="file_"+dto.getNum()+"_"+(++i)+ext;
				File copy = new File(path+"//"+fileName);		//File Ŭ������ �ش� ��ο� ������ ������ ������ �����.
				try {
					mf.transferTo(copy);				//���ε� ������ �Ű��ִ°� transferTo(copy)
				}catch(Exception e) {
					e.printStackTrace();
				}
				SboardFileDTO fileDTO = new SboardFileDTO();
				fileDTO.setSboardNum(dto.getNum());
				fileDTO.setFileName(fileName);
				mapper.fileNameInsert(fileDTO);
			}
		}
		dto.setFiles(i);
		if(dto.getRef()==0) {
			dto.setRef(dto.getNum());
		}else {
			//update
			mapper.stepUp(dto);
			dto.setLevels(dto.getLevels()+1);
			dto.setStep(dto.getStep()+1);
		}		
		mapper.fileRef(dto);		//����, �׷�(ref) ����
		return "sboard/writePro";
	}
	
	public String read(int num, Model model, String writer) {
		mapper.readCount(num); 								//��ȸ�� ����
		SboardDTO dto = mapper.readNum(num);
		if(dto.getFiles() > 0) {
			model.addAttribute("fileList",mapper.fileList(num));
		}
		model.addAttribute("dto",dto);							//num �� ����,, "dto" �� �信�� �� ��
		model.addAttribute("like",mapper.sboardNumLike(num, writer));
		model.addAttribute("replyList",mapper.replyList(num));
		return "sboard/read";
	}
	
	public String like(SboardLikeDTO likeDTO, int change) {
		if(change ==1) {
			mapper.likeInsert(likeDTO);
		}else {
			mapper.likeDelete(likeDTO);
		}
		return "success";
	}
	@Override
	public String searchList(String search, String searchValue, Model model) {
		model.addAttribute("list",mapper.searchList(search, searchValue));
		return "sboard/searchList";
	}
	public String replyInsert(SboardReplyDTO dto, Model model) {
		int result = mapper.replyInsert(dto);
		
		if(result == 1 && dto.getRef() == 0) {			
			dto.setRef(dto.getNum()); 
			mapper.replyRef(dto);
		}else {
			mapper.replyStepUp(dto);
			dto.setStep(dto.getStep()+1);
			dto.setLevels(dto.getLevels()+1);
			mapper.replyStep(dto);
		}
		model.addAttribute("replyDTO",dto);
		model.addAttribute("result", result);
		
		return "/sboard/reply";
	}
	
}
