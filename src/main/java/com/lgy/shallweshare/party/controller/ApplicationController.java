package com.lgy.shallweshare.party.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lgy.shallweshare.party.dto.PartyDto;
import com.lgy.shallweshare.party.service.PartyService;
import com.lgy.shallweshare.users.dto.UsersDto;
import com.lgy.shallweshare.users.service.UsersService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ApplicationController {

	@Autowired
	private PartyService pService;
	@Autowired
	private UsersService userService;

//	=============== 신청 페이지 ===============
	@RequestMapping("shop/application")
	public String application(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: application");
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		log.info("@# Controller: application ==>" + party);
		return "shop/application";
	}

//	=============== 신청 진행 ===============
	@RequestMapping("shop/application_process")
	public String application_process(@RequestParam HashMap<String, String> param) {

		log.info("@# Controller: application_process");
		log.info(""+param);
		pService.application_process(param);
		
		if(param.get("a_payment").equals("무통장입금")) {
			return "redirect:application_complete_bank?p_id="+param.get("p_id");
		}else {
			return "redirect:application_complete_kakao?p_id="+param.get("p_id");
		}
	}

//	=============== 신청 완료 페이지(무통장 입금) ===============
	@RequestMapping("shop/application_complete_bank")
	public String application_complete(@RequestParam HashMap<String, String> param, Model model) {
		log.info("@# Controller: application_complete_bank");

		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		// 파티장 정보 가져오기
		UsersDto master = userService.getUserInfo(party.getU_id());
		model.addAttribute("master", master);
		return "shop/application_complete_bank";
	}

//	=============== 신청 완료 페이지(카카오) ===============
	@RequestMapping("shop/application_complete_kakao")
	public String application_complete_kakao(@RequestParam HashMap<String, String> param, Model model) {
		// 파티 정보 가져오기
		PartyDto party = pService.getPartyInfo(param);
		model.addAttribute("party", party);

		log.info("@# Controller: application_complete_kakao");
		return "shop/application_complete_kakao";
	}

}
