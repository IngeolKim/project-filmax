package site.filmax.admin.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
@Component
public class UserAdvice {
	@Around("execution(* site.filmax.admin.*..user_*(..))")
	public String userCheck(ProceedingJoinPoint jp) throws Throwable{
		
		  RequestAttributes ra = RequestContextHolder.currentRequestAttributes();
		  ServletRequestAttributes sr = (ServletRequestAttributes)ra;
		  HttpServletRequest request = sr.getRequest(); 
		  HttpSession session = request.getSession(); 
		  String uid = (String) session.getAttribute("uid");
		  if(uid == null) { 
			  return "member/aopCheck"; 
		  }
		return (String)jp.proceed();
	}
}
