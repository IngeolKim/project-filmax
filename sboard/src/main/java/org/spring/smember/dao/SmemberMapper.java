package org.spring.smember.dao;

import org.spring.smember.dto.SmemberDTO;

public interface SmemberMapper {
	public int login(SmemberDTO dto);
	public int inputMember(SmemberDTO dto);
}
