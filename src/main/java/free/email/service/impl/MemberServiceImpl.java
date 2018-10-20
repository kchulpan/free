package free.email.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import free.email.dao.MemberDao;
import free.email.service.MemberService;
import free.email.vo.EmailVo;
@Service("memberService")
public class MemberServiceImpl implements MemberService
{
	@Autowired
	MemberDao memberDao;

	@Override
	public String sendEmailAction(HashMap<String, Object> map) 
	{
		String freeln_phone=(String) map.get("freeln_phone");
		String freeln_mail= (String) map.get("freeln_mail");
		List<EmailVo> freeln_list = memberDao.sendEmailAction(map);
		String sendMail = null;
		if(freeln_list.size()!=0)
		{
			//구글일 경우
			// String host="smtp.naver.com";
			//네이버일 경우
			EmailVo emailVo = freeln_list.get(0);
			String freeln_pwd = emailVo.getFreeln_pwd();
			
			String host="smtp.naver.com";
			
			final String sender_id = "kchulpan";
			final String sender_pw = "jmkceo1115";
			
			int port = 465;
			
			//메일 내용
			String recipient = freeln_mail;//받는사람메일주소
			String subject = "비밀번호 발송 메일입니다"; //메일제목 입력
			String body = freeln_phone + "님의 비밀번호는: " + freeln_pwd + " 입니다"; //메일내용 입력
		
			Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성
			
			// SMTP 서버 정보 설정 
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", port); 
			props.put("mail.smtp.auth", "true"); 
			props.put("mail.smtp.ssl.enable", "true"); 
			props.put("mail.smtp.ssl.trust", host);
			
			//Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() 
			{ 
				String un=sender_id; 
				String pw=sender_pw; 
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() 
				{ 
					return new javax.mail.PasswordAuthentication(un, pw);
					} 
				});
				
				session.setDebug(true); //for debug
				
				
				Message mimeMessage = new MimeMessage(session); //MimeMessage 생성
				

				try {
					//발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 
					//이때는 이메일 풀 주소를 다 작성해주세요.
					mimeMessage.setFrom(new InternetAddress("kchulpan@naver.com")); 
					
					//수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음
					mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
					
					mimeMessage.setSubject(subject);//제목 셋팅
					mimeMessage.setText(body); //내용셋팅 
					Transport.send(mimeMessage); //javax.mail.Transport.send() 이용
					sendMail = "Y";
					
				} catch (MessagingException e) {
					
					e.printStackTrace();
				}
				

		}else {
			sendMail = "N";
		}
		return sendMail;

	}

}