package org.spring.sboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring.sboard.dto.SboardDTO;
import org.spring.sboard.dto.SboardFileDTO;
import org.spring.sboard.dto.SboardLikeDTO;
import org.spring.sboard.dto.SboardReplyDTO;
import org.spring.sboard.dto.SboardTypeDTO;

public interface SboardMapper {
	//	resultType				//parameterType					//����Ÿ���� �ִ� ���� xml �� select ���� ��쿡�� �ִ�!! ������ ��ü�� void!
	public void sboardInsert(SboardDTO dto);
	public void fileRef(SboardDTO dto);
	public void fileNameInsert(SboardFileDTO dto);
	public List<SboardDTO> allList(SboardDTO dto);
	public List<SboardDTO> boardList(int boardType);
	public int boardCount();
	
	public void readCount(int num);
	public SboardDTO readNum(int num);
	public List<String> fileList(int sboardNum);
	public void stepUp(SboardDTO dto);
	public List<SboardTypeDTO> typeList();
	public void likeInsert(SboardLikeDTO likeDTO);
	public void likeDelete(SboardLikeDTO likeDTO);
	public int sboardNumLike(@Param("sboardNum") int sboardNum, @Param("writer") String writer);			//DTO �Ⱦ��� �Ķ���� �Ѱ��̻� ������ �տ� @Param
	public List<SboardTypeDTO> typeList2();
	public List<SboardTypeDTO> searchList(@Param("search") String search, @Param("searchValue") String searchValue);
	public int replyInsert(SboardReplyDTO dto);
	public void replyRef(SboardReplyDTO dto);
	public void replyStep(SboardReplyDTO dto);
	public void replyStepUp(SboardReplyDTO dto);
	public List<SboardReplyDTO> replyList(int boardNum);
	
}
