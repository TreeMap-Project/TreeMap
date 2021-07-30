package com.spring.treemap.service;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.treemap.domain.MemberVO;
import com.spring.treemap.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	public int checkEmail(String userEmail) {
		int cnt = mapper.emailCnt(userEmail);
		System.out.println(cnt);
		return cnt;
	}

	public boolean getSignUp(MemberVO member) {
		member.setUserPW(bcryptPasswordEncoder.encode(member.getUserPW()));
		return mapper.insertUser(member) == 1 && mapper.insertAuth(member) == 1;
	}

	public int deleteUser(MemberVO member) {
		return mapper.deleteUser(member);
	}

	public String findEmail(MemberVO member) {

		return null;
	}

	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; // 네이버 이용시 smtp.naver.com //구글 smtp.gmail.com
		String hostSMTPid = "whrudgns13@naver.com";
		String hostSMTPpwd = "7529gkak12@";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "whrudgns13@naver.com";
		String fromName = "트리맵";
		String subject = "";
		String msg = "";

		if (div.equals("findpw")) {
			subject = "트리맵 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getUserName() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserPW() + "</p></div>";
		}
		System.out.println(vo);
		// 받는 사람 E-Mail 주소
		String mail = vo.getUserEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); // 네이버 이용시 587 구글시 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}

	}


	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = mapper.read(vo.getUserEmail());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (mapper.emailCnt(vo.getUserEmail()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if (!vo.getUserEmail().equals(ck.getUserEmail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserPW(pw);
			// 비밀번호 변경
			mapper.updatePw(vo);
			String a = "whrudgns13@naver.com";
			// 비밀번호 변경 메일 발송
			//EmailSender es = new EmailSender();
			if(a.contains("naver.com")){
				//es.naverMailSend(vo);
			}else {
				//es.gmailSend(vo);
			}
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}

	}
	
	/*public static void main(String[] args) {
		MemberServiceImpl ms =  new MemberServiceImpl();
		ms.gmailSend();
	}*/

}