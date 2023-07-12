package com.lgy.shallweshare.party.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lgy.shallweshare.party.dao.PartyDao;
import com.lgy.shallweshare.party.dto.ApplicationDto;
import com.lgy.shallweshare.party.dto.Criteria;
import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.dto.Party_boardDto;

import lombok.extern.slf4j.Slf4j;

@Service("PartyService")
@Slf4j
public class PartyServiceImpl implements PartyService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		
		return dao.getMemberCount(p_id);
	}
	@Override
	public int getDisneyMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		
		return dao.getDisneyMemberCount(p_id);
	}
	@Override
	public int getNetflixMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		
		return dao.getNetflixMemberCount(p_id);
	}
	@Override
	public int getTivingMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		
		return dao.getTivingMemberCount(p_id);
	}
	@Override
	public int getWatchaMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.getWatchaMemberCount(p_id);
	}
	@Override
	public int getWavveMemberCount(int p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.getWavveMemberCount(p_id);
	}
	@Override
	public ArrayList<Party_boardDto> getParty_board(HashMap<String, String> param) {
		log.info("@# Service: getParty_board");
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public PartyDto getPartyInfo(HashMap<String, String> param) {
		log.info("@# Service: getPartyInfo");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		PartyDto party = dao.getPartyInfo(param);
		return party;
	}
	
	@Override
	public void application_process(HashMap<String, String> param) {
		log.info("@# Service: application_process");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		dao.application_process(param);
	}
	
	@Override
	public ArrayList<ApplicationDto> getParticipantList(HashMap<String, String> param) {
		log.info("@# Service: getParticipantList");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<ApplicationDto> list = dao.getParticipantList(param);
		return list;
	}
	
	@Override
	public void createParty(HashMap<String, String> param) {
		
		log.info("@# Service: createParty");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		dao.createParty(param);
	}

	//리스트 출력
	@Override
	public ArrayList<PartyDto> getParty_list() {
		log.info("@# Service: getParty_list");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_list();
		return list;
	}

	@Override
	public ArrayList<PartyDto> getParty_listNetflix() {
		log.info("@# Service: getParty_listNetfliex");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_listNetfliex();
		return list;
	}
	
	
	//페이징
	@Override
	public ArrayList<PartyDto> getParty_list(Criteria cri) {
		log.info("@# Service: getParty_list(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.listWithPaging(cri);
	}
	@Override
	public ArrayList<PartyDto> getParty_listNetflix(Criteria cri) {
		log.info("@# Service: getParty_listNetfliex(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.netflixPaging(cri);
	}

	@Override
	public int getTotalCount() {
		log.info("@# getTotalCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getTotalCount end");
		return dao.getTotalCount();
	}
	@Override
	public int getNetflixCount() {
		log.info("@# getNetfliexCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getNetfliexCount end");
		return dao.getNetflixCount();
	}
	

	
	@Override
	public PartyDto content_view(HashMap<String, String> param) {
		log.info("@# PartyServiceImpl.contentView() start");
		
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		PartyDto dto=dao.content_view(param);
		
		log.info("@# PartyServiceImpl.contentView() end");
		
		return dto;
	}

	@Override
	public void party_delete(HashMap<String, String> param) {
		log.info("@# partyService.party_delete() start");
		
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		dao.party_delete(param);
		
		log.info("@# partyService.party_delete() end");
	}
	
	@Override
	public void party_modify(HashMap<String, String> param) {
		log.info("@# partyService.party_modify() start");
		
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		log.info("@# partyService.party_modify() dao=="+dao);
		dao.party_modify(param);
		
		log.info("@# partyService.party_modify() end");
	}
	
	
	@Override
	public ArrayList<PartyDto> getParty_listWavve() {
		log.info("@# Service: getParty_listWavve");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_listWavve();
		return list;
	}
	@Override
	public ArrayList<PartyDto> getParty_listWavve(Criteria cri) {
		log.info("@# Service: getParty_listWavve(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.wavvePaging(cri);
	}
	@Override
	public int getWavveCount() {
		log.info("@# getWavveCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getWavveCount end");
		return dao.getWavveCount();
	}

	
	@Override
	public ArrayList<PartyDto> getParty_listTving() {
		log.info("@# Service: getParty_listTving");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_listTving();
		return list;
	}
	@Override
	public ArrayList<PartyDto> getParty_listTving(Criteria cri) {
		log.info("@# Service: getParty_listTving(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.tvingPaging(cri);
	}
	@Override
	public int getTivingCount() {
		log.info("@# getTivingCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getTivingCount end");
		return dao.getTivingCount();
	}

	
	@Override
	public ArrayList<PartyDto> getParty_listDisney() {
		log.info("@# Service: getParty_listDisney");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_listDisney();
		return list;
	}
	@Override
	public ArrayList<PartyDto> getParty_listDisney(Criteria cri) {
		log.info("@# Service: getParty_listDisney(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.disneyPaging(cri);
	}
	@Override
	public int getDisneyCount() {
		log.info("@# getDisneyCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getDisneyCount end");
		return dao.getDisneyCount();
	}

	
	@Override
	public ArrayList<PartyDto> getParty_listWatcha() {
		log.info("@# Service: getParty_listWatcha");
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		ArrayList<PartyDto> list = dao.getParty_listWatcha();
		return list;
	}
	@Override
	public ArrayList<PartyDto> getParty_listWatcha(Criteria cri) {
		log.info("@# Service: getParty_listWatcha(Criteria cri)");
		log.info("@# cri"+cri);
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		return dao.watchaPaging(cri);
	}
	@Override
	public int getWatchaCount() {
		log.info("@# getWatchaCount");
		PartyDao dao=sqlSession.getMapper(PartyDao.class);
		log.info("@# getWatchaCount end");
		return dao.getWatchaCount();
	}

	@Override
	public PartyDto getPartyInfo(String p_id) {
		PartyDao dao = sqlSession.getMapper(PartyDao.class);
		PartyDto party = dao.getPartyInfo(p_id);
		return party;
	}
}
