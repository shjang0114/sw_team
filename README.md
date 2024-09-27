# HOSPINET
사용자 위치기반 전문병원 탐색 및 AI 진단 서비스

## 목차
#### ▶ 팀프로젝트 개요   
#### ▶ 팀프로젝트 상세   
#### ▶ 팀프로젝트 결과

## 팀프로젝트 개요
**[ 개발 기간 ]**   
- 2023.10.25 ~ 2023.11.30

**[ 개발 인원 ]**
- 총 5인 <팀원>

**[ 개발 동기 ]**
- 우리나라는 OECD 국가들 중 고령화 비율이 급격히 증가하는 추세입니다.
- 그로 인해 정보화기기 이용자 또한 고령화 비율이 증가하는 와중에 기능이 복잡하거나 불편한 UI로 사용에 어려움을 겪고 있습니다.
- 또한 주로 가던 병원이 문을 닫거나 진료과를 잘못 찾을 시 다른 병원을 찾기까지 시간이 소요됩니다.   
- **따라서 직관적인 UI로 UX를 충족시키고**
- **공공데이터포털 데이터를 통해 데이터의 정확도를 확보하고**
- **Kakao 지도 API를 활용하여 병원의 위치를 확인하고**
- **ChatGPT API를 활용한 AI 자가진단을 통해 보다 효율적인 병원 탐색을 구현하였습니다.**

**[ 개발 언어 및 도구 ]**
- JAVA, JSP, HTML, CSS, JavaScript, Apache Tomcat, eGovFrame, ChatGPT, Kakao Map, Geolocation, 공공데이터포털

## 팀프로젝트 상세
![01](https://github.com/user-attachments/assets/2e2afd2f-eae1-49d0-98e3-fcb581594bf4)
- 사용자는 신체 부위를 선택하고 부위에 맞는 질문을 선택 시 진료과가 정해집니다. 그리고 사용자의 현재 위치 정보를 받아 병원 기본 정보 API를 호출합니다.
- 병원의 기본 정보 API 중 요양코드를 파라미터 값으로 넘겨 병원 상세 정보 API를 한번 더 호출합니다.
- 병원 상세 정보 API에는 진료 시간에 따른 병원 마킹 기능에 필요한 진료 시간 데이터가 저장되어 있습니다.
- 2개의 API는 프론트단에 맞는 데이터 형식으로 알맞게 파싱되어 전송되고 지도에 출력됩니다.
- 사용자는 직관적으로 자신의 현재 위치 주변의 병원들을 확인할 수 있으며 마킹 표시로 현재 진료가 가능한 병원 등의 주요 정보를 열람할 수 있습니다.
  
![02](https://github.com/user-attachments/assets/8aee4601-32c7-4598-bc6a-b1722d22ec58)
- ChatGPT를 활용한 챗봇 기능입니다. 챗봇은 사용자의 자가 진단을 도와줍니다.
- 사용자는 증상 버튼을 누르거나 채팅으로 작성 시 해당 값을 파라미터 값으로 넘겨 ChatGPT API를 호출할 수 있습니다.
- ChatGPT가 진단한 정보는 JSON 형태로 응답하고 프롬프트 설정에 맞춰 필요한 값을 추출 후 String 형태로 전송됩니다. 그리고 해당 정보를 화면에 출력합니다

## 팀프로젝트 결과
### 메인 페이지
<img src="https://github.com/user-attachments/assets/a0b6b344-559d-4b72-bf97-42e77e411ab6"  width="33%" />
<img src="https://github.com/user-attachments/assets/d8e98f84-65e4-4320-8ecd-86a6deb77a64"  width="30%" />
<img src="https://github.com/user-attachments/assets/0154edfd-663c-4068-8b40-93070f29f94c"  width="33%" />
<br/>
<img src="https://github.com/user-attachments/assets/5f663345-4ef3-4408-b232-a27f7d887eed"  width="45%" />
<img src="https://github.com/user-attachments/assets/124fc33a-d2f1-470e-90de-84cf5419a9f9"  width="45%" />

- 메인 페이지 설명

### AI 챗봇
<img src="https://github.com/user-attachments/assets/5b1c75da-0033-4c77-9e54-77e42b214468"  width="45%" />
<br/>
<img src="https://github.com/user-attachments/assets/5b36997e-4380-4ca8-bda0-7124a282d2da"  height="300" />
<img src="https://github.com/user-attachments/assets/bc9b7be5-8c6c-47f3-9255-4832fd15f56c"  height="300" />
<img src="https://github.com/user-attachments/assets/63994e4f-cc87-4a26-96ce-bcdb295b70e0"  height="300" />

- AI 챗봇 설명

### 병원 정보 확인
<img src="https://github.com/user-attachments/assets/70e7c85a-4191-49c3-bf5d-85f3b7d1418d"  width="45%" />
<img src="https://github.com/user-attachments/assets/0b8222c3-e3f7-46a2-8c0e-9ecdbc32ad4c"  width="45%" />

- 병원 정보 설명

### 병원 마커 전환
<img src="https://github.com/user-attachments/assets/b3bb91d9-bf4b-4f74-b79e-518ab0ba4db6"  width="45%" />
<img src="https://github.com/user-attachments/assets/4172338a-63a4-45cc-a8c7-0e7ef64b8735"  width="45%" />

- 병원 마커 전환 설명
