#  🌎 TreeMap

카카오 API와 Spring Security를 이용한 나만의 지도 저장소 만들기


[Treemap 이동](http://3.36.157.154/)

---
## ⏰ 제작 기간 & 참여 인원

- 2021년 7월 16일 ~ 8월 3일
- 팀 프로젝트 
- 인원 2명 (조경훈, 김다인)
---
## 🚩개발목적
- 자주 방문하는 장소 또는 기억에 남는 장소에 갔을 때 기록하기 위함입니다.
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
- MyBatis
- Spring Security
- Tomcat9
- AWS EC2
- AWS RDS
- MariaDB

---
## 🔊 담당 파트
### `김다인`
- 회원가입<br>(BCryptPasswordEncoder를 이용해 비밀번호 encoding후 DB 저장)
- 로그인<br>(Spring Security로 로그인, 로그아웃)
- remember-me<br>(Spring Security 아이디, 비밀번호 정보 자동으로 로그인에 나타날 수 있게 DB 저장)
- 비밀번호 찾기 위한 메일 전송<br>(Java SMTP를 사용해 사용자에게 메일 전송)
### `조경훈`
- 내 지도 리스트<br> (내 지도 상세보기,수정,삭제)
- Kakao Map API 사용 <br>(키워드로 검색, 지도 클릭으로 내 지도 등록)
- 내 정보<br> (닉네임 변경, 비밀번호 변경)

---

## 🕹 주요기능
- 회원가입<br>📌 [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/webapp/WEB-INF/views/member/signup.jsp#L1) 📱 [백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/java/com/spring/treemap/service/MemberServiceImpl.java#L43)
- 로그인<br>📌  [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/webapp/WEB-INF/views/member/customLogin.jsp#L1)  📱 [백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/java/com/spring/treemap/service/CustomUserDetailsService.java#L16)
- 이메일 전송<br>📌[코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/webapp/WEB-INF/views/member/findPw.jsp#L1) 📱 [이메일 전송 정보 코드](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/java/com/spring/treemap/service/EmailSender.java#L16) 📱 [이메일 전송 활용 코드](https://github.com/TreeMap-Project/TreeMap/blob/d9e31ee71beaee32b073bbc395c85e96c67ab538/treemap/src/main/java/com/spring/treemap/service/MemberServiceImpl.java#L54)
- 내 정보 수정<br>  📌  [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/member/myPage.jsp) 📱 [백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/4b797d26623f0628824028b26b4c48eb6afd3d78/treemap/src/main/java/com/spring/treemap/controller/CommonController.java#L102)
- 내 지도 리스트 <br>📌 [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/include/mapboard.jsp) 📱[백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/java/com/spring/treemap/controller/MapContoller.java)
- 검색,클릭 지도 등록<br>📌 [코드 확인](https://github.com/TreeMap-Project/TreeMap/blob/main/treemap/src/main/webapp/WEB-INF/views/include/mapboard.jsp) 📱[백엔드 코드](https://github.com/TreeMap-Project/TreeMap/blob/4b797d26623f0628824028b26b4c48eb6afd3d78/treemap/src/main/java/com/spring/treemap/controller/MapContoller.java#L125) 
---
## ♥ 개선필요 사항
- `로컬에서 비밀번호 찾기 시 난수설정해서 새로운 비밀번호 이메일 전송 가능`<br>
`AWS에 프로젝트 올렸을때 포트 오류로 메일이 보내지지 않음` 

