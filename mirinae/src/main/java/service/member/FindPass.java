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
import javax.servlet.http.HttpSession;

import ch18.service.MyAuthentication;
import dao.MemberDao;
import model.Member;
import service.main.CommandProcess;

public class FindPass implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result;
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		String m_id = request.getParameter("m_id");
		String m_email = request.getParameter("m_email");

		MemberDao md = MemberDao.getInstance();
		Member member = md.find_Pass(m_id, m_email);
		
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
        
        Authenticator auth = new MyAuthentication();
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
		
		if(member == null) result = -1; // 데이터 없음
		else {
			HttpSession session = request.getSession();
			session.setAttribute("m_email", member.getM_email());
			
			String setfrom = "mun_jiseon@naver.com"; // naver 
			String tomail = m_email; //받는사람
			String title = "[Mirinae] 비밀번호변경 인증 이메일 입니다"; 
			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
					+ "Mirinae(미리내) 비밀번호찾기(변경) 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
			
			 try {
		            msg.setSentDate(new Date());
		            InternetAddress from = new InternetAddress();
		            
		            from = new InternetAddress(myEmail);
		            msg.setFrom(from);
		 
		            InternetAddress to = new InternetAddress(to2);
		            msg.setRecipient(Message.RecipientType.TO, to);
		 
		            msg.setSubject(subject, "UTF-8");
		            msg.setText(msg2, "UTF-8");
		            msg.setHeader("content-Type", "text/html");
		 
		            javax.mail.Transport.send(msg);
		            request.setAttribute("msg", "성공!!!!");
		            
		        } catch (AddressException addr_e){
		            addr_e.printStackTrace();
		        } catch (MessagingException msg_e){
		            msg_e.printStackTrace();
		        }
				return "mailto.jsp";
			}

		}

		class MyAuthentication extends Authenticator {
		 
		    PasswordAuthentication account;
		 
		    public MyAuthentication(){
		        String id = "zi2eon";//@@
		        String pw = "wl53619tjs00!";//@@
		        account = new PasswordAuthentication(id, pw);
		    }
		 
		    public PasswordAuthentication getPasswordAuthentication(){
		        return account;
		    }
		}result = 1;
		
		request.setAttribute("result", result);
		request.setAttribute("member", member);
		
		return "/member/findPassAuth";
	}
}
