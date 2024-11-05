package egovframework.hbz.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public interface EgovHbzScrapService {

	// 병원 기본 정보 호출
	public List<Map<String, Object>> hospitalInfo(String address, String code) throws Exception;
	
	// 병원 상세 정보 호출
	public Map<String, Object> HospitalPage(String ykiho) throws Exception;

	// OpenAI API 호출
	public String getResponseFromGPT3(String userMessage) throws Exception;
	
	public Map<String, Object> getVilageFcst(String area, String time) throws Exception;

	public void getUltraSrtNcst() throws Exception;

	public List<Map<String, Object>> scrapView(int pageNo, Model model) throws Exception;
}
