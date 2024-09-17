package tagHandler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.jsp.JspException;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.tagext.BodyTagSupport;

public class FormatDatesInTable extends BodyTagSupport {
	String dateSeparator = ",";
	String insiderSeparator = "-";
	
	
	public void setDateSeparator(String toSet) {
		this.dateSeparator = toSet;
	}
	
	public String getDateSeparator() {
		return this.dateSeparator;
	}
	
	public void setInsiderSeparator(String toSet) {
		this.insiderSeparator = toSet;
	}
	
	public String getInsiderSeparator() {
		return this.insiderSeparator;
	}
	
	@Override
	public int doEndTag() throws JspException{
		// TODO Auto-generated method stub
		super.doEndTag();
		
		JspWriter out = pageContext.getOut(); 
		String bodyText = bodyContent.getString();
		
		String tableStr = "<table>";
		tableStr = tableStr + "<tr> <th>COUNTER</th> <th>DAY</th> <th>MONTH</th> <th>YEAR</th> </tr>";
		String[] datesArr = bodyText.split(this.dateSeparator);
		
		for(int i = 0; i < datesArr.length; i++) {
			String[] dateSplitted = datesArr[i].split(this.insiderSeparator);
			tableStr = tableStr + "<tr>";
			tableStr = tableStr + "<td>" + i + "</td>";
			tableStr = tableStr + "<td>" + dateSplitted[0] + "</td>";
			tableStr = tableStr + "<td>" + dateSplitted[1] + "</td>";
			tableStr = tableStr + "<td>" + dateSplitted[2] + "</td>";
			tableStr = tableStr + "</tr>";
		}
		
		tableStr = tableStr + "</table>";

		try {
			out.println(tableStr);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return EVAL_PAGE;        
	}
}
