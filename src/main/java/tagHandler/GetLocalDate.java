package tagHandler;

import java.io.IOException;
import java.time.LocalDate;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;

public class GetLocalDate extends SimpleTagSupport {
	@Override
	public void doTag() throws JspException, IOException {
		// TODO Auto-generated method stub
		super.doTag();
		
		LocalDate localDate = LocalDate.now();
		JspWriter out = getJspContext().getOut();
		
		out.println("<span>Your <b>LocalDate</b> is: " + localDate + "</span>");
	
	}
}
