#  🌎 TreeMap

나만의 지도 만들기

[Treemap 이동](http://3.36.157.154/)

## ⏰ 제작 기간 & 참여 인원

- 2021년 7월 16일 ~ 8월 3일
- 팀 프로젝트 
- 인원 2명 (조경훈, 김다인)
---

## 🛠 사용기술

`Frontend`
- HTML,CSS
- JavaScript ES6
- Jquery 
- Ajax
- Kakao Map API

`Backend`
- Java11
- Spring
- Maven
- Mybatis
- Spring Security
- Tomcat9
- AWS EC2
- AWS RDS
- MariaDB

---
## 🚩개발목적
- 자주 방문하는 장소 또는 기억에 남는 장소에 갔을 때 기록하기 위함입니다.
---
## 🔊 담당 파트
### `김다인`
- 로그인
- 회원가입
### `조경훈`
- 내 지도 리스트 (내 지도 상세보기,수정,삭제)
- Kakao Map API 사용 (키워드로 검색, 지도 클릭으로 내 지도 등록)
- 내 정보 (닉네임 변경, 비밀번호 변경)

---

## 🕹 주요기능

- 로그인  📌  [코드 확인](https://github.com/Doodream/staybrella_front/blob/839b7e171e3ea62cd1f16cf277ae475a2e1bf421/src/pages/account/login/index.js#L45) 📱 [백엔드 코드](https://github.com/Doodream/staybrella_backend/blob/ab688db2290eb8743e7cb26ae0bc6b5cb709b188/models/User.js#L42)
- 내 정보 수정  📌  [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/member/myPage.jsp) 📱 [백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/java/com/spring/treemap/controller/CommonController.java) 102번째 줄부터
- 검색,클릭 지도 등록📌 [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/include/mapboard.jsp) 📱[백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/java/com/spring/treemap/controller/MapContoller.java) 125번 ~ 134번 줄
- 내 지도 리스트 📌 [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/include/mapboard.jsp) 📱[백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/java/com/spring/treemap/controller/MapContoller.java) 125번 ~ 134번 줄 제외한 나머지

---
## ♥ 개선필요 사항
- `로컬에서 비밀번호 찾기 시 난수설정해서 새로운 비밀번호 이메일 전송 가능
AWS에 프로젝트 올렸을때 포트 오류로 메일이 보내지지 않음` 


