# HOSPINET
사용자 위치기반 전문병원 탐색 및 AI 진단 서비스

## 목차
#### [▶ 팀프로젝트 개요](#팀프로젝트-개요)   
#### [▶ 팀프로젝트 상세](#팀프로젝트-상세)   
#### [▶ 팀프로젝트 결과](#팀프로젝트-결과)

## 팀프로젝트 개요
**[ 개발 기간 ]**   
- 2023.10.25 ~ 2023.11.30

**[ 개발 인원 ]**
- 총 5인 <팀원>

**[ 개발 동기 ]**

<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/aee81e4f-c29c-4459-90d8-1223d079239a" /></td>
      <td><img src="https://github.com/user-attachments/assets/2822e807-7a79-44c4-bf2a-bf649edb28c7" /></td>
      <td><img src="https://github.com/user-attachments/assets/715bfcbb-1393-4150-94f1-cb742c8e25cd" /></td>
    </tr>
    <tr align="center">
      <td>고령화 인구 비율</td>
      <td>정보화기기 사용자 비율</td>
      <td>고령자 정보화기기 불편도</td>
    </tr>
  </tbody>
</table>

- 우리나라는 OECD 국가들 가운데, 고령화 인구 비율이 급격히 증가하는 추세입니다.
- 정보화기기 이용자 또한 고령자 비율이 높거나 증가하는 가운데, 기능이 복잡하거나 불편한 UI로 사용에 어려움을 겪고 있습니다.
- 또한 주로 가던 병원이 문을 닫거나 진료과를 잘못 찾을 시, 다른 병원을 찾기까지 시간이 소요됩니다.
- **따라서 직관적인 UI로 UX를 충족시키고,**
- **공공데이터포털 데이터를 통해 정확도를 확보하고,**
- **Kakao 지도를 활용하여 병원의 위치 및 정보를 확인하고,**
- **ChatGPT 기반의 AI 자가 진단으로 더욱 효율적인 병원 탐색을 구현하였습니다.**

**[ 맡은 역할 ]**
- 프로젝트 기획, 병원 기본 정보 API, 병원 상세 정보 API, 시간대별 마커 전환

**[ 개발 언어 및 도구 ]**
- JAVA, JSP, HTML, CSS, JavaScript, Bootstrap, Apache Tomcat, 전자정부표준프레임워크, 공공데이터포털, OpenAI API, Kakao Map, Geolocation

## 팀프로젝트 상세
<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/2e2afd2f-eae1-49d0-98e3-fcb581594bf4" width="500" /></td>
    </tr>
    <tr align="center">
      <td>아키텍처 1</td>
    </tr>
  </tbody>
</table>

- 사용자는 신체 UI에서 해당하는 부위 및 증상을 선택 시, 진료과가 정해집니다.
- 진료과 및 현재 위치 정보를 파라미터 값으로 전달하여, 공공데이터포털에서 병원 기본 정보 API를 호출합니다.
- 병원 기본 정보 API에는 이름, 전화번호, 주소, 요양코드 등의 데이터가 저장되어 있습니다.
- 호출된 병원 기본 정보 API의 데이터 중 요양코드를 파라미터 값으로 전달하여, 병원 상세 정보 API를 추가로 호출합니다.
- 병원 상세 정보 API에는 시간대별 마커 전환 기능에 필요한 진료 시간 데이터가 저장되어 있습니다.
- 2개의 API를 알맞는 데이터 형식으로 파싱 및 전송하여 지도에 출력합니다.
- 사용자는 직관적으로 본인의 현재 위치 주변의 병원들을 마커로 확인할 수 있습니다.
- 또한 각 병원들의 주요 정보를 열람할 수 있습니다.

<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/8aee4601-32c7-4598-bc6a-b1722d22ec58" width="500" /></td>
    </tr>
    <tr align="center">
      <td>아키텍처 2</td>
    </tr>
  </tbody>
</table>

- OpenAI API를 활용하여 사용자의 자가 진단을 도와주는 AI 챗봇입니다.
- 버튼 또는 채팅으로 증상을 작성 시, 해당 정보를 파라미터 값으로 전달하여 OpenAI API를 호출합니다.
- OpenAI API를 통해 ChatGPT가 진단한 정보는 JSON 형태로 응답하고, 프롬프트 설정에 맞춰 필요한 값을 추출합니다.
- 추출된 값은 String 형태로 전송되고, 해당 정보를 화면에 출력합니다

## 팀프로젝트 결과
### ※ 메인 페이지
<table align="center">
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/a0b6b344-559d-4b72-bf97-42e77e411ab6" /></td>
      <td><img src="https://github.com/user-attachments/assets/d8e98f84-65e4-4320-8ecd-86a6deb77a64" width="1800" /></td>
      <td><img src="https://github.com/user-attachments/assets/0154edfd-663c-4068-8b40-93070f29f94c" /></td>
    </tr>
    <tr align="center">
      <td>신체 UI</td>
      <td>증상 UI</td>
      <td>지도 UI</td>
    </tr>
  </tbody>
</table>

<table align="center">
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/5f663345-4ef3-4408-b232-a27f7d887eed" width="300" /></td>
      <td><img src="https://github.com/user-attachments/assets/124fc33a-d2f1-470e-90de-84cf5419a9f9" width="300" /></td>
    </tr>
    <tr align="center">
      <td>성별 전환</td>
      <td>전후면 전환</td>
    </tr>
  </tbody>
</table>

- 실제 사람의 신체를 표현한 UI를 통해 직관성을 강화했습니다.
- 각 부위를 선택 시, 증상 선택 화면으로 전환됩니다.
- 해당 부위에 대한 증상 목록을 확인할 수 있으며, 해당하는 증상을 선택할 수 있습니다.
- 증상 선택 후 완료 시, 자동으로 지도 화면으로 이동합니다.
- 현재 사용자의 위치를 파란색 마커로 확인할 수 있습니다.
- 사용자의 위치를 기준으로, 증상을 진단할 수 있는 병원들의 위치 및 정보를 확인할 수 있습니다.
- 성별 및 전후면 전환으로 추가 부위 및 증상을 선택할 수 있습니다. 

### ※ AI 챗봇
<table align="center">
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/5b1c75da-0033-4c77-9e54-77e42b214468" /></td>
      <td><img src="https://github.com/user-attachments/assets/5b36997e-4380-4ca8-bda0-7124a282d2da" /></td>
      <td><img src="https://github.com/user-attachments/assets/bc9b7be5-8c6c-47f3-9255-4832fd15f56c" /></td>
      <td><img src="https://github.com/user-attachments/assets/63994e4f-cc87-4a26-96ce-bcdb295b70e0" /></td>
    </tr>
    <tr align="center">
      <td>챗봇 UI</td>
      <td>증상 채팅</td>
      <td>증상 버튼</td>
      <td>증상 답변</td>
    </tr>
  </tbody>
</table>

- 우측 상단 챗봇 버튼을 통해 활성화 및 비활성화할 수 있습니다.
- 정확한 진료과만 선별될 수 있도록 프롬프트를 지정하였습니다.
- 사용자는 버튼 또는 채팅을 통해 자신의 증상 정보를 전달합니다.
- 증상에 대해 ChatGPT가 진단한 정보는 JSON 형태로 전송되어 필요한 정보만을 추출한 후 String 형태로 전송됩니다.
- 전송된 해당 정보는 화면에 출력되도록 구현하였습니다.
- 숨기기/보이기 버튼을 통해 증상 버튼을 활성화 및 비활성화할 수 있습니다.
- +/- 버튼을 통해 글자 크기를 조절할 수 있습니다.

### ※ 병원 정보 API
<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/70e7c85a-4191-49c3-bf5d-85f3b7d1418d" width="500" /></td>
    </tr>
    <tr align="center">
      <td>병원 기본 정보 API</td>
    </tr>
  </tbody>
</table>

- 병원 기본 정보 API를 활용하여 전문 병원의 위치를 보여줍니다.
- 사용자의 위치 정보와 진료과를 파라미터 값으로 XML 형태의 병원 기본 정보 API를 호출하였습니다.
- 해당 데이터를 JSOUP 라이브러리로 파싱하여 각 병원의 이름, 주소, 전화번호, 그리고 요양코드를 추출하였습니다.
- 추출한 정보들은 카카오 지도에서 병원 마커를 클릭하면 확인할 수 있도록 구현하였습니다.

<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/0b8222c3-e3f7-46a2-8c0e-9ecdbc32ad4c" width="500" /></td>
    </tr>
    <tr align="center">
      <td>병원 상세 정보 API</td>
    </tr>
  </tbody>
</table>

- 병원 상세 정보 API를 활용하여 해당 병원의 상세 정보를 보여줍니다.
- 이전에 기본 정보 API에서 추출한 요양코드를 파라미터 값으로 하여, JSON 형태의 병원 상세 정보 API를 호출하였습니다.
- 해당 데이터를 JSOUP 및 JSON-SIMPLE 라이브러리로 파싱하여 각 병원의 주요 정보와 진료 시간을 추출하였습니다.
- 추출한 진료 시간은 각 병원 마커에 마우스를 올려두면 확인할 수 있도록 구현하였습니다.

### ※ 병원 마커 전환
<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/4172338a-63a4-45cc-a8c7-0e7ef64b8735" /></td>
      <td><img src="https://github.com/user-attachments/assets/b3bb91d9-bf4b-4f74-b79e-518ab0ba4db6" /></td>
    </tr>
    <tr align="center">
      <td>병원이 진료 중인 경우 [ 초록 ]</td>
      <td>병원이 진료 종료한 경우 [ 빨강 ]</td>
    </tr>
  </tbody>
</table>

- 탐색한 시간대별로 운영 중인 전문 병원들을 직관적으로 확인할 수 있습니다.
- 이전 병원 상세 정보 API에서 추출한 진료 시간 데이터를 활용하였습니다.
- 각 병원마다 진료 중인 경우에는 초록색 마커로 표시가 되게 구현하였습니다.
- 진료를 할 수 없는 시간대인 경우에는 빨간색 마커로 표시가 되게 구현하였습니다.

### ※ 건강 퀴즈
<table>
  <tbody>
    <tr align="center">
      <td><img src="https://github.com/user-attachments/assets/25032a82-2e7e-4f45-8c12-0e6c488d8dd3" /></td>
      <td><img src="https://github.com/user-attachments/assets/9e015efc-f949-4e73-9bb0-23ed8f21adcb" /></td>
    </tr>
    <tr align="center">
      <td>건강 퀴즈 [ 문제 ]</td>
      <td>건강 퀴즈 [ 정답 ]</td>
    </tr>
  </tbody>
</table>

- 우측 상단 건강 퀴즈 버튼을 통해 건강과 관련된 OX 퀴즈를 풀 수 있습니다.
- 퀴즈들은 무작위로 출제되며, 퀴즈를 푼 후에 답을 확인할 수 있습니다.
