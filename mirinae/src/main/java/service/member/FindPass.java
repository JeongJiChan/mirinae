package service.member;

import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class FindPass implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result;
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
 
        String m_email = request.getParameter("m_email");
        String m_id = request.getParameter("m_id");
        MemberDao md = MemberDao.getInstance();
        Member member = md.find_Pass(m_id, m_email);
        
        if(member == null) result = -1; // 데이터 없음
        else {
        	String subject = "[MIRINAE] 비밀번호 찾기 인증 이메일";
        	String msg2 = "안녕하세요 회원님!<br>";
            msg2 += "비밀번호 찾기(변경) 인증번호는<br>";
            msg2 += "<b><font color=red>"+num+"</font></b>"+" 입니다.<br>";
            msg2 += "<i>숫자를 정확하게 입력해주세요</i>";
            String myEmail = "zi2eon@naver.com";
            
            Authenticator auth = new MyAuthentication();
            Session session = Session.getDefaultInstance(p, auth);
            MimeMessage msg = new MimeMessage(session);
            
            try {
            	msg.setSentDate(new Date());
                InternetAddress from = new InternetAddress();
                
                from = new InternetAddress(myEmail);
                msg.setFrom(from);
     
                InternetAddress to = new InternetAddress(m_email);
                msg.setRecipient(Message.RecipientType.TO, to);
     
                msg.setSubject(subject, "UTF-8");
                msg.setContent(msg2, "text/html; charset=UTF-8");
                msg.setHeader("content-Type", "text/html");
     
                javax.mail.Transport.send(msg);
                request.setAttribute("msg", "성공!");
            } catch (NullPointerException e) {
            	e.printStackTrace();
            } catch (AddressException addr_e){
                addr_e.printStackTrace();
            } catch (MessagingException msg_e){
                msg_e.printStackTrace();
            }
            result = 1;
        } 
       
        request.setAttribute("result", result);
        request.setAttribute("member", member);
        request.setAttribute("num", num);

        return "/member/findPassAuth";
		}
	}

class MyAuthentication extends Authenticator {
 
    PasswordAuthentication account;
 
    public MyAuthentication(){
        String id = "zi2eon";//@@
        String pw = "jiseon9708@";//@@
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}