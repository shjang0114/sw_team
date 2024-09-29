package egovframework.hbz.service.impl;

import java.io.IOException;
import java.text.SimpleDateFormat;
import org.json.simple.parser.ParseException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import org.springframework.http.HttpRequest;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.method.annotation.HttpEntityMethodProcessor;

import egovframework.hbz.dao.EgovHbzScrpDao;
import egovframework.hbz.service.EgovHbzScrapService;

@Service
public class EgovHbzScrapServiceImpl implements EgovHbzScrapService {

	@Autowired
	EgovHbzScrpDao egovHbzScrpDao;

	// 공공데이터포털 API KEY
	final String ENCODING_KEY = "9toq77DZvOo2Wo4a9jGNKUlG%2BogjcApjs3texQK9Xj0brXm1Qs2l3mt0pSzBkYyoaKhO6izphKkgGxT9w7SRHQ%3D%3D";
	final String DECODING_KEY = "9toq77DZvOo2Wo4a9jGNKUlG+ogjcApjs3texQK9Xj0brXm1Qs2l3mt0pSzBkYyoaKhO6izphKkgGxT9w7SRHQ==";

	final String KEY = "9toq77DZvOo2Wo4a9jGNKUlG%2BogjcApjs3texQK9Xj0brXm1Qs2l3mt0pSzBkYyoaKhO6izphKkgGxT9w7SRHQ%3D%3D";
	final String DEC_KEY = "9toq77DZvOo2Wo4a9jGNKUlG+ogjcApjs3texQK9Xj0brXm1Qs2l3mt0pSzBkYyoaKhO6izphKkgGxT9w7SRHQ==";

	// ChatGPT API KEY
	final String OPENAI_API_KEY = "ChatGPT API KEY";

	Logger logger = LoggerFactory.getLogger(EgovHbzScrapServiceImpl.class);

	final String base_url = "https://apis.data.go.kr/B551182/hospInfoServicev2";
	final String base_url2 = "https://apis.data.go.kr/B551182/MadmDtlInfoService2.6";
	
	// 공공데이터포털 - 병원 기본 정보 (XML)
	@Override
	public List<Map<String, Object>> hospitalInfo(String address, String code) throws Exception {
		List<Map<String, Object>> hospitalList = new ArrayList<>();

		// 병원 정보 서비스 API 호출
		String url = base_url + "/getHospBasisList?";
		Document doc = Jsoup.connect(url)
				.data("ServiceKey", DEC_KEY)
				.data("emdongNm", address) // 주소
				.data("dgsbjtCd", code) // 진료과
				.timeout(60000)
				.get();

		// XML 파싱
		Elements items = doc.select("item"); // 'item' 태그를 가진 요소들을 선택

		for (Element item : items) {
			// 각 'item' 요소에서 필요한 데이터 추출
			String addr = item.select("addr").text(); // 주소
			String clCd = item.select("clCd").text(); // 종별 코드
			String clCdNm = item.select("clCdNm").text(); // 종별 코드명
			String cmdcGdrCnt = item.select("cmdcGdrCnt").text(); // 한방 일반의 인원수
			String cmdcIntnCnt = item.select("cmdcIntnCnt").text(); // 한방 인턴 인원수
			String cmdcResdntCnt = item.select("cmdcResdntCnt").text(); // 한방 레지던트 인원수
			String cmdcSdrCnt = item.select("cmdcSdrCnt").text(); // 한방 전문의 인원수
			String detyGdrCnt = item.select("detyGdrCnt").text(); // 치과 일반의 인원수
			String detyIntnCnt = item.select("detyIntnCnt").text(); // 치과 인턴 인원수
			String detyResdntCnt = item.select("detyResdntCnt").text(); // 치과 레지던트 인원수
			String detySdrCnt = item.select("detySdrCnt").text(); // 치과 전문의 인원수
			String drTotCnt = item.select("drTotCnt").text(); // 의사 총수
			String emdongNm = item.select("emdongNm").text(); // 읍면동명
			String estbDd = item.select("estbDd").text(); // 개설일자
			String mdeptGdrCnt = item.select("mdeptGdrCnt").text(); // 의과 일반의 인원수
			String mdeptIntnCnt = item.select("mdeptIntnCnt").text(); // 의과 인턴 인원수
			String mdeptResdntCnt = item.select("mdeptResdntCnt").text(); // 의과 레지던트 인원수
			String mdeptSdrCnt = item.select("mdeptSdrCnt").text(); // 의과 전문의 인원수
			String pnursCnt = item.select("pnursCnt").text(); // 조산사 인원수
			String postNo = item.select("postNo").text(); // 우편번호
			String sgguCd = item.select("sgguCd").text(); // 시군구 코드
			String sgguCdNm = item.select("sgguCdNm").text(); // 시군구명
			String sidoCd = item.select("sidoCd").text(); // 시군구 코드
			String sidoCdNm = item.select("sidoCdNm").text(); // 시도 명 (number)
			String telno = item.select("telno").text(); // 전화 번호
			String XPos = item.select("XPos").text(); // X 좌표
			String YPos = item.select("YPos").text(); // Y 좌표
			String yadmNm = item.select("yadmNm").text(); // 병원명
			String ykiho = item.select("ykiho").text(); // 요양코드

			// 필드 출력
			System.out.println("addr: " + addr);
			System.out.println("clCd: " + clCd);
			System.out.println("clCdNm: " + clCdNm);
			System.out.println("cmdcGdrCnt: " + cmdcGdrCnt);
			System.out.println("cmdcIntnCnt: " + cmdcIntnCnt);
			System.out.println("cmdcResdntCnt: " + cmdcResdntCnt);
			System.out.println("cmdcSdrCnt: " + cmdcSdrCnt);
			System.out.println("detyGdrCnt: " + detyGdrCnt);
			System.out.println("detyIntnCnt: " + detyIntnCnt);
			System.out.println("detyResdntCnt: " + detyResdntCnt);
			System.out.println("detySdrCnt: " + detySdrCnt);
			System.out.println("drTotCnt: " + drTotCnt);
			System.out.println("emdongNm: " + emdongNm);
			System.out.println("estbDd: " + estbDd);
			System.out.println("mdeptGdrCnt: " + mdeptGdrCnt);
			System.out.println("mdeptIntnCnt: " + mdeptIntnCnt);
			System.out.println("mdeptResdntCnt: " + mdeptResdntCnt);
			System.out.println("mdeptSdrCnt: " + mdeptSdrCnt);
			System.out.println("pnursCnt: " + pnursCnt);
			System.out.println("postNo: " + postNo);
			System.out.println("sgguCd: " + sgguCd);
			System.out.println("sgguCdNm: " + sgguCdNm);
			System.out.println("sidoCd: " + sidoCd);
			System.out.println("sidoCdNm: " + sidoCdNm);
			System.out.println("telno: " + telno);
			System.out.println("XPos: " + XPos);
			System.out.println("YPos: " + YPos);
			System.out.println("yadmNm: " + yadmNm);
			System.out.println("ykiho: " + ykiho);

			// Map에 병원 정보 저장 (테스트로 2개만 뽑자)
			Map<String, Object> hospitalInfo = new HashMap<>();
			hospitalInfo.put("addr", addr);
			hospitalInfo.put("telno", telno);
			hospitalInfo.put("yadmNm", yadmNm);
			hospitalInfo.put("XPos", XPos);
			hospitalInfo.put("YPos", YPos);
			hospitalInfo.put("ykiho", ykiho);

			// JSON 파싱 후 가져오기
			Map<String, Object> map2 = HospitalPage(ykiho);
			System.out.println(map2);

			// hospitalInfo에 JSON 값 추가
			hospitalInfo.putAll(map2);

			// hospitalList에 Map 추가
			hospitalList.add(hospitalInfo);

		}
		return hospitalList;
	}
	
	// 공공데이터포털 - 병원 상세 정보 (JSON)
	public Map<String, Object> HospitalPage(String ykiho) throws Exception {
		
		// 의료기관별 상세 정보 서비스 API 호출
		String url = base_url2 + "/getDtlInfo2.6?";
		Document doc = Jsoup.connect(url)
				.data("serviceKey", DEC_KEY)
				.data("ykiho", ykiho) // 요양 코드
				.data("_type", "json") // 데이터 타입
				.timeout(600000)
				.ignoreContentType(true)
				.get();

		// JSON 파싱
		String data = doc.text();

		JSONParser parser = new JSONParser();
		JSONObject object = (JSONObject) parser.parse(data);
		
		JSONObject response = (JSONObject) object.get("response");
		JSONObject body = (JSONObject) response.get("body");
		
		Object items_object = body.get("items");
		
		String trmtMonStart = null;
		String trmtMonEnd = null;
		String trmtTueStart = null;
		String trmtTueEnd = null;
		String trmtWedStart = null;
		String trmtWedEnd = null;
		String trmtThuStart = null;
		String trmtThuEnd = null;
		String trmtFriStart = null;
		String trmtFriEnd = null;
		String trmtSatStart = null;
		String trmtSatEnd = null;
		String trmtSunStart = null;
		String trmtSunEnd = null;
		
		if (items_object != null && items_object instanceof JSONObject) {
			
			JSONObject items = (JSONObject) body.get("items");
			JSONObject item = (JSONObject) items.get("item");

			// 각 'item' 요소에서 필요한 데이터 추출
			trmtMonStart = String.valueOf(item.get("trmtMonStart")); // 월요일 진료 시작
			trmtMonEnd = String.valueOf(item.get("trmtMonEnd")); // 월요일 진료 종료
			trmtTueStart = String.valueOf(item.get("trmtTueStart")); // 화요일 진료 시작
			trmtTueEnd = String.valueOf(item.get("trmtTueEnd")); // 화요일 진료 종료
			trmtWedStart = String.valueOf(item.get("trmtWedStart")); // 수요일 진료 시작
			trmtWedEnd = String.valueOf(item.get("trmtWedEnd")); // 수요일 진료 종료
			trmtThuStart = String.valueOf(item.get("trmtThuStart")); // 목요일 진료 시작
			trmtThuEnd = String.valueOf(item.get("trmtThuEnd")); // 목요일 진료 종료
			trmtFriStart = String.valueOf(item.get("trmtFriStart")); // 금요일 진료 시작
			trmtFriEnd = String.valueOf(item.get("trmtFriEnd")); // 금요일 진료 종료
			trmtSatStart = String.valueOf(item.get("trmtSatStart")); // 토요일 진료 시작
			trmtSatEnd = String.valueOf(item.get("trmtSatEnd")); // 토요일 진료 종료
			trmtSunStart = String.valueOf(item.get("trmtSunStart")); // 일요일 진료 시작
			trmtSunEnd = String.valueOf(item.get("trmtSunEnd")); // 일요일 진료 종료

			if (trmtSatStart == "null") {
				trmtSatStart = "0000";
			}
			if (trmtSatEnd == "null") {
				trmtSatEnd = "0000";
			}
			if (trmtSunStart == "null") {
				trmtSunStart = "0000";
			}
			if (trmtSunEnd == "null") {
				trmtSunEnd = "0000";
			}
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("trmtMonStart", trmtMonStart);
		map.put("trmtMonEnd", trmtMonEnd);
		map.put("trmtTueStart", trmtTueStart);
		map.put("trmtTueEnd", trmtTueEnd);
		map.put("trmtWedStart", trmtWedStart);
		map.put("trmtWedEnd", trmtWedEnd);
		map.put("trmtThuStart", trmtThuStart);
		map.put("trmtThuEnd", trmtThuEnd);
		map.put("trmtFriStart", trmtFriStart);
		map.put("trmtFriEnd", trmtFriEnd);
		map.put("trmtSatStart", trmtSatStart);
		map.put("trmtSatEnd", trmtSatEnd);
		map.put("trmtSunStart", trmtSunStart);
		map.put("trmtSunEnd", trmtSunEnd);

		System.out.println(map);

		return map;
	}

	public String callOpenAIAPI(String prompt) {
		// Apache HttpClient를 사용하여 POST 요청을 생성 및 실행합니다.
		CloseableHttpClient httpClient = HttpClients.createDefault();
		try {
			HttpPost request = new HttpPost("https://api.openai.com/v1/chat/completions");
			StringEntity params = new StringEntity(
					"{\"model\": \"gpt-3.5-turbo-16k\", \"messages\": [{\"role\": \"user\", \"content\": \"[의학에 관련된 것만 대답하고 어디가 아프다고 할 때 병원 과만 말하고 다른 말은 하지 않기. 존댓말로 최소한의 문장으로 말하기. 예를 들어, 머리가 아프다면 신경과 또는 내과를 방문하라고 조언하고, 방문 전에 취해야 할 조치들을 간단히 안내하기] "
							+ prompt + "\"}]}",
					"UTF-8");

			request.addHeader("Content-Type", "application/json");
			request.addHeader("Authorization", "Bearer " + OPENAI_API_KEY);
			request.setEntity(params);

			org.apache.http.HttpResponse response = httpClient.execute(request);
			String responseString = EntityUtils.toString(response.getEntity());

			// 로그에 응답 출력
			logger.info("OpenAI API Response: " + responseString);

			return responseString;
		} catch (IOException e) {
			logger.error("Error when calling OpenAI API", e);
			return null;
		} finally {
			try {
				httpClient.close();
			} catch (IOException e) {
				logger.error("Error when closing the HttpClient", e);
			}
		}
	}

	public String getResponseFromGPT3(String userMessage) {
		try {
			// OpenAI API를 호출하는 메서드 호출
			String response = callOpenAIAPI(userMessage);
			// 응답에서 필요한 텍스트 추출 (예: JSON 파싱)
			// 예시 구현은 단순화를 위한 것이며, 실제 응답 구조에 따라 다를 수 있습니다.
			return extractTextFromJSONResponse(response);
		} catch (Exception e) {
			logger.error("OpenAI API 호출 중 오류 발생", e);
			return "질문을 처리할 수 없습니다.";
		}
	}

	public String extractTextFromJSONResponse(String jsonResponse) throws ParseException {
		JSONParser parser = new JSONParser();
		JSONObject responseObject = (JSONObject) parser.parse(jsonResponse);
		JSONArray choices = (JSONArray) responseObject.get("choices");
		if (choices != null && !choices.isEmpty()) {
			JSONObject firstChoice = (JSONObject) choices.get(0);
			JSONObject message = (JSONObject) firstChoice.get("message");
			return (String) message.get("content");
		}
		return "답변을 받지 못했습니다.";
	}

	// 웹툰 스크래핑
	public void webtoonScrap(Model model) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		String url = "https://comic.naver.com/webtoon/detail?titleId=783053&no=75";

		Document doc = Jsoup.connect(url).get();

		System.out.println(doc.html());

		Elements ele = doc.select("div.wt_viewer");

		map.put("html", ele.html());

		model.addAttribute("map", map);
	}

	// 공공데이터포털 - 기상청 [단기예보조회]
	public Map<String, Object> getVilageFcst(String in_area, String in_time) throws Exception {

		System.out.println("###getVilageFcst service start...");

		System.out.println("in_area : " + in_area);
		System.out.println("in_time : " + in_time);

		Map<String, Object> areaMap = areaXy(in_area);

		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst";

		// 지금 날짜를 기준으로 포맷
		Map<String, Object> dateMap = dateFormatter();

//      String nx          = "60";
		String nx = (String) areaMap.get("nx");
		String ny = (String) areaMap.get("ny");
//      String ny          = "127";
		String base_date = (String) dateMap.get("base_date");
		String base_time = "0500";

		System.out.println("###nx : " + nx);
		System.out.println("###ny : " + ny);

		Document doc = Jsoup.connect(url).data("ServiceKey", DECODING_KEY) // 인증키
				.data("pageNo", "1") // 페이지 번호
				.data("numOfRows", "1000") // 한 페이지 결과 수
				.data("dataType", "JSON") // 요청자료형식(XML, JSON)
				.data("base_date", base_date) // 발표일자
				.data("base_time", base_time) // 발표시각
				.data("nx", (String) areaMap.get("nx")) // 예보지점 X 좌표
				.data("ny", (String) areaMap.get("ny")) // 예보지점 Y 좌표
				.timeout(10000) // 시간초과
				.ignoreContentType(true) // 콘텐츠 타입 무시
				.get();

		String jsonStr = doc.text();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStr);
		JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
		JSONObject json_Body = (JSONObject) jsonResponse.get("body");
		JSONObject json_items = (JSONObject) json_Body.get("items");
		JSONArray json_item = (JSONArray) json_items.get("item");

		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < json_item.size(); i++) {
			JSONObject json_item_get = (JSONObject) json_item.get(i);

			String fcstValue = (String) json_item_get.get("fcstValue");// 값
			String category = (String) json_item_get.get("category");// 자료구분코드
			String fcstDate = (String) json_item_get.get("fcstDate");// 예보일자
			String fcstTime = (String) json_item_get.get("fcstTime");// 예보시간

			System.out.println(json_item.get(i));

			if (base_date.equals(fcstDate)) {
				if (fcstTime.equals(in_time)) {
					if (category.equals("POP"))
						map.put("POP", fcstValue); // 강수확률 단위:%
					else if (category.equals("PTY"))
						map.put("PTY", fcstValue); // 강수형태 단위:코드값
					else if (category.equals("PCP"))
						map.put("PCP", fcstValue); // 1시간 강수량 단위:범주 (1mm)
					else if (category.equals("REH"))
						map.put("REH", fcstValue); // 습도 단위:%
					else if (category.equals("SNO"))
						map.put("SNO", fcstValue); // 1시간 신적설 단위:범주(1cm)
					else if (category.equals("SKY"))
						map.put("SKY", fcstValue); // 하늘상태 단위:코드값
					else if (category.equals("TMP"))
						map.put("TMP", fcstValue); // 1시간 기온 단위:℃
					else if (category.equals("TMN"))
						map.put("TMN", fcstValue); // 일 최저기온 단위:℃
					else if (category.equals("TMX"))
						map.put("TMX", fcstValue); // 일 최고기온 단위:℃
					else if (category.equals("UUU"))
						map.put("UUU", fcstValue); // 풍속(동서성분) 단위:m/s
					else if (category.equals("VVV"))
						map.put("VVV", fcstValue); // 풍속(남북성분) 단위:m/s
					else if (category.equals("WAV"))
						map.put("WAV", fcstValue); // 파고 단위:M
					else if (category.equals("VEC"))
						map.put("VEC", fcstValue); // 풍향 단위:deg
					else if (category.equals("WSD"))
						map.put("WSD", fcstValue); // 풍속 단위:m/s
				}
			}
		}

		System.out.println("###map : " + map);

		System.out.println("tmp : " + (String) map.get("TMP"));
		System.out.println("tmn : " + (String) map.get("TMN"));
		System.out.println("tmx : " + (String) map.get("TMX"));

		// x축 y축으로 지역 추출
		String area = xyArea(nx, ny);

		map.put("AREA", area);
		map.put("BASE_TIME", base_time);
		map.put("BASE_DATE", base_date);
		map.put("NY", ny);
		map.put("NX", nx);
		map.put("TIME", in_time);

		return map;
	}

	// 공공데이터포털 - 기상청 [초단기실황] 데이터 스크래핑, 매 30분마다 업데이트
	@Override
	public void getUltraSrtNcst() throws Exception {

		System.out.println("### dataPotalScrap Start");

		String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst";

		// 지금 날짜를 기준으로 포맷
		Map<String, Object> dateMap = dateFormatter();

		String nx = "60";
		String ny = "127";
		String base_date = (String) dateMap.get("base_date");
//      String base_time    = (String)dateMap.get("base_time");
		String base_time = "0600";

		System.out.println("### base_date ### " + base_date);
		System.out.println("### base_time ### " + base_time);

		Document doc = Jsoup.connect(url).data("ServiceKey", DECODING_KEY) // 인증키
				.data("pageNo", "1") // 페이지 번호
				.data("numOfRows", "1000") // 한 페이지 결과 수
				.data("dataType", "JSON") // 요청자료형식(XML, JSON)
				.data("base_date", base_date) // 발표일자
				.data("base_time", base_time) // 발표시각
				.data("nx", nx) // 예보지점 X 좌표
				.data("ny", ny) // 예보지점 Y 좌표
				.timeout(10000) // 시간초과
				.ignoreContentType(true) // 콘텐츠 타입 무시
				.get();

		System.out.println("### doc ###      " + doc.text());

		String jsonStr = doc.text();

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonStr);
		JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
		System.out.println("### jsonResponse ###   " + jsonResponse.toString());
		System.out.println("");

		JSONObject json_Body = (JSONObject) jsonResponse.get("body");

		System.out.println("### json_Body ###   " + json_Body.toString());
		System.out.println("");

		JSONObject json_items = (JSONObject) json_Body.get("items");

		System.out.println("### json_items ###   " + json_items.toString());
		System.out.println("");

		JSONArray json_item = (JSONArray) json_items.get("item");

		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < json_item.size(); i++) {

			System.out.println("### json_item ###   " + json_item.get(i).toString());
			System.out.println("");

			JSONObject json_item_get = (JSONObject) json_item.get(i);

			// 값
			String obsrValue = (String) json_item_get.get("obsrValue");
			System.out.println("### obsrValue ###    " + obsrValue);

			// 자료구분코드
			String category = (String) json_item_get.get("category");
			System.out.println("### category ###    " + category);
			System.out.println("");

			if (category.equals("PTY"))
				map.put("PTY", obsrValue); // 강수형태
			else if (category.equals("REH"))
				map.put("REH", obsrValue); // 습도
			else if (category.equals("RN1"))
				map.put("RN1", obsrValue); // 1시간 강수량
			else if (category.equals("T1H"))
				map.put("T1H", obsrValue); // 기온
			else if (category.equals("UUU"))
				map.put("UUU", obsrValue); // 동서바람성분
			else if (category.equals("VEC"))
				map.put("VEC", obsrValue); // 풍향
			else if (category.equals("VVV"))
				map.put("VVV", obsrValue); // 남북바람성분
			else if (category.equals("WSD"))
				map.put("WSD", obsrValue); // 풍속
		}

		// x축 y축으로 지역 추출
		String area = xyArea(nx, ny);

		map.put("AREA", area);
		map.put("BASE_TIME", base_time);
		map.put("BASE_DATE", base_date);
		map.put("NY", ny);
		map.put("NX", nx);

		egovHbzScrpDao.insertAction(map);
	}

	// DB조회 후 스크래핑 페이지로 전환
	@Override
	public List<Map<String, Object>> scrapView(int pageNo, Model model) throws Exception {

		System.out.println("###scrapView Start");

		// 페이지 수
		int pageSize = 0;
		// 페이지당 보여질 게시물의 수
		int recordSize = 5;
		// 페이지번호가 0이거나 0보다 작으면 1로 초기화
		if (pageNo == 0 && pageNo < 0)
			pageNo = 1;
		// 게시글 수 카운팅
		int cnt = egovHbzScrpDao.getCnt();

		System.out.println("###cnt : " + cnt);

		// 페이지크기 = 총게시물카운트 / 보여질 게시물 수
		pageSize = cnt / recordSize;

		// 나머지가 있으면 1 추가
		if (cnt % recordSize >= 1)
			pageSize++;

		int offset = pageEncoding(pageNo, recordSize);

		Map<String, Object> map = new HashMap<>();

		map.put("offset", offset);
		map.put("recordSize", recordSize);

		List<Map<String, Object>> list = egovHbzScrpDao.selectAction(map);

		System.out.println("###list = " + list);

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		// 페이지크기를 모델에 담는다
		model.addAttribute("pageSize", pageSize);

		return list;
	}

	// 게시물 출력될 번호
	public int pageEncoding(int pageNo, int recordSize) {
		return (pageNo - 1) * recordSize;
	}

	// 날짜 포맷 YYMMDD
	public Map<String, Object> dateFormatter() {

		Map<String, Object> dateMap = new HashMap<>();

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMdd");

		String base_date = simpleDateFormat.format(nowDate);

		simpleDateFormat = new SimpleDateFormat("HHmm");

		String base_time = simpleDateFormat.format(nowDate);

		dateMap.put("base_date", base_date);
		dateMap.put("base_time", base_time);

		return dateMap;
	}

	// x축 y축으로 지역 추출
	public String xyArea(String nx, String ny) {

		if (nx.equals("60") && ny.equals("127")) {
			return "서울특별시 중구";
		} else if (nx.equals("97") && ny.equals("74")) {
			return "부산광역시 중구";
		} else if (nx.equals("89") && ny.equals("90")) {
			return "대구광역시 중구";
		} else if (nx.equals("54") && ny.equals("125")) {
			return "인천광역시 중구";
		} else if (nx.equals("59") && ny.equals("74")) {
			return "광주광역시 동구";
		} else if (nx.equals("68") && ny.equals("100")) {
			return "대전광역시 동구";
		} else {
			return null;
		}
	}

	// 지역으로 x,y축 추출
	public Map<String, Object> areaXy(String in_area) {

		Map<String, Object> map = new HashMap<String, Object>();

		if (in_area.equals("su")) {
			map.put("nx", "60");
			map.put("ny", "127");
		} else if (in_area.equals("bs")) {
			map.put("nx", "97");
			map.put("ny", "74");
		} else if (in_area.equals("dg")) {
			map.put("nx", "89");
			map.put("ny", "90");
		} else if (in_area.equals("ic")) {
			map.put("nx", "54");
			map.put("ny", "125");
		} else if (in_area.equals("gj")) {
			map.put("nx", "59");
			map.put("ny", "74");
		} else if (in_area.equals("dj")) {
			map.put("nx", "68");
			map.put("ny", "100");
		}

		return map;
	}

	public Map<String, Object> putfor(JSONArray json_item, String base_date, String fcstTime) {

		Map<String, Object> map = new HashMap<String, Object>();

		for (int i = 0; i < json_item.size(); i++) {

			JSONObject json_item_get = (JSONObject) json_item.get(i);

			// 값
			String fcstValue = (String) json_item_get.get("fcstValue");

			// 자료구분코드
			String category = (String) json_item_get.get("category");

			// 예보일자
			String fcstDate = (String) json_item_get.get("fcstDate");

			if (base_date.equals(fcstDate)) {
				if (fcstTime.equals((String) json_item_get.get("fcstTime"))) {
					map = putMap(category, fcstValue, map);
				}
			}
		}

		return map;
	}

	// 단기예보 if문
	public Map<String, Object> putMap(String category, String fcstValue, Map<String, Object> map) {

		if (category.equals("POP"))
			map.put("POP", fcstValue); // 강수확률 단위:%
		else if (category.equals("PTY"))
			map.put("PTY", fcstValue); // 강수형태 단위:코드값
		else if (category.equals("PCP"))
			map.put("PCP", fcstValue); // 1시간 강수량 단위:범주 (1mm)
		else if (category.equals("REH"))
			map.put("REH", fcstValue); // 습도 단위:%
		else if (category.equals("SNO"))
			map.put("SNO", fcstValue); // 1시간 신적설 단위:범주(1cm)
		else if (category.equals("SKY"))
			map.put("SKY", fcstValue); // 하늘상태 단위:코드값
		else if (category.equals("TMP"))
			map.put("TMP", fcstValue); // 1시간 기온 단위:℃
		else if (category.equals("TMN"))
			map.put("TMN", fcstValue); // 일 최저기온 단위:℃
		else if (category.equals("TMX"))
			map.put("TMX", fcstValue); // 일 최고기온 단위:℃
		else if (category.equals("UUU"))
			map.put("UUU", fcstValue); // 풍속(동서성분) 단위:m/s
		else if (category.equals("VVV"))
			map.put("VVV", fcstValue); // 풍속(남북성분) 단위:m/s
		else if (category.equals("WAV"))
			map.put("WAV", fcstValue); // 파고 단위:M
		else if (category.equals("VEC"))
			map.put("VEC", fcstValue); // 풍향 단위:deg
		else if (category.equals("WSD"))
			map.put("WSD", fcstValue); // 풍속 단위:m/s

		return map;
	}
}