package tagHandler;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.jsp.*;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

public class SessionId extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException {
		// TODO Auto-generated method stub
		try {
		PageContext pageContext = (PageContext) getJspContext();
		String ssId = pageContext.getSession().getId();
		
		JspWriter out = pageContext.getOut();
		
		out.println("<span>Your <b>Session ID</b> is: " + ssId + "</span>");
		
		
	} catch (Exception e) {
		// TODO: handle exception
	
	}
	}
}
