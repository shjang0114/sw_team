package egovframework.hbz.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.hbz.service.impl.EgovHbzScrapServiceImpl;

@Controller
public class EgovHbzScrapController {

	Logger logger = LoggerFactory.getLogger(EgovHbzScrapController.class);

	@Autowired
	EgovHbzScrapServiceImpl egovHbzScrapServiceImpl;

	// 공공데이터포털 - 병원 기본 정보
	@RequestMapping(value = "/hbz/Hospital.do", method = RequestMethod.GET)
	public String hostpitalInfo(@RequestParam("address") String address, @RequestParam("code") String code, Model model)
			throws Exception {
		List<Map<String, Object>> hospitalList = egovHbzScrapServiceImpl.hospitalInfo(address, code);
		System.out.println("Received address: " + address);
		System.out.println("Received code: " + code);
		model.addAttribute("hospitalList", hospitalList);
		return "/main/EgovMainView";
	}

	// 공공데이터포털 - 병원 상세 정보
	@RequestMapping(value = "/hbz/HospitalInfo.do", method = RequestMethod.GET)
	public String HospitalPage(@RequestParam("ykiho") String ykiho, Model model) throws Exception {
		System.out.println("Received ykiho: " + ykiho);
		Map<String, Object> map = egovHbzScrapServiceImpl.HospitalPage(ykiho);

		model.addAttribute("map", map);

		return "/main/EgovMainView";
	}

	// AI 챗봇
	@RequestMapping(value = "/hbz/getGPT3Response.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> getGPT3Response(@RequestParam(value = "question", required = false) String question)
			throws Exception {
		logger.info("질문 처리 시작: " + question);

		// ChatGPT API를 호출하여 답변 받기
		String answer = egovHbzScrapServiceImpl.getResponseFromGPT3(question);

		// 질문 및 답변을 JSON 객체로 반환
		Map<String, String> response = new HashMap<>();
		response.put("question", question);
		response.put("answer", answer);
		return response;
	}
}