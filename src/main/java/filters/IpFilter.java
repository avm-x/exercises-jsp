package filters;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;
import java.io.PrintWriter;

public class IpFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		String IpAddress = request.getRemoteAddr();
		
		chain.doFilter(request, response);
		
		PrintWriter out = response.getWriter();
		out.println("<span>IP Address: <b>" + IpAddress + "</b></span>");
	}
}
