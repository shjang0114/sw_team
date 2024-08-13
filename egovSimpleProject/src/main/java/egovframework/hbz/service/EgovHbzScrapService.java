package egovframework.hbz.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public interface EgovHbzScrapService {
	
	public void newsRank(Model model) throws Exception;
	
	public void webtoonScrap(Model model) throws Exception;
	
	public Map<String, Object> getVilageFcst(String area, String time) throws Exception;
	
	public void getUltraSrtNcst() throws Exception;
	
	public List<Map<String, Object>> scrapView(int pageNo, Model model) throws Exception;

	public List<Map<String, Object>> hospitalInfo(String address, String code) throws Exception;

	public Map<String, Object> HospitalPage(String ykiho) throws Exception;
	
	public String getResponseFromGPT3(String userMessage) throws Exception;
}

