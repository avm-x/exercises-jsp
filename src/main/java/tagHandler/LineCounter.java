package tagHandler;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.BodyTagSupport;

public class LineCounter extends BodyTagSupport {

	@Override
	public int doEndTag() throws JspException {
		// TODO Auto-generated method stub
		
		String bodyString = bodyContent.getString();
		JspWriter out = pageContext.getOut();
		
		String[] lines = bodyString.split("\n");
		
		try {			
			for(int i = 0; i < lines.length; i++) {
				if(lines[i].length() > 0) {
					out.println(lines[i] + " -> " + lines[i].length() + "<br>");
				}
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return EVAL_PAGE;
	}
}
