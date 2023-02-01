package org.spring.sboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.spring.sboard.dto.SboardDTO;
import org.spring.sboard.dto.SboardFileDTO;
import org.spring.sboard.dto.SboardLikeDTO;
import org.spring.sboard.dto.SboardReplyDTO;
import org.spring.sboard.dto.SboardTypeDTO;

public interface SboardMapper {
	//	resultType				//parameterType					//리턴타입이 있는 경우는 xml 의 select 문일 경우에만 있다!! 나머진 대체로 void!
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
	public int sboardNumLike(@Param("sboardNum") int sboardNum, @Param("writer") String writer);			//DTO 안쓰고 파라미터 한개이상 보낼때 앞에 @Param
	public List<SboardTypeDTO> typeList2();
	public List<SboardTypeDTO> searchList(@Param("search") String search, @Param("searchValue") String searchValue);
	public int replyInsert(SboardReplyDTO dto);
	public void replyRef(SboardReplyDTO dto);
	public void replyStep(SboardReplyDTO dto);
	public void replyStepUp(SboardReplyDTO dto);
	public List<SboardReplyDTO> replyList(int boardNum);
	
}
