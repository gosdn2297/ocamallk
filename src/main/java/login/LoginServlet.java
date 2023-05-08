package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request,response);
	}
	
	private void doHandle (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out =response.getWriter();
		String email=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		MemberVO memberVO = new MemberVO();
		memberVO.setEmail(email);
		memberVO.setPwd(pwd);
		MemberDAO dao = new MemberDAO();
		boolean isLoginSuccess= dao.isRightUser(memberVO);
		if(isLoginSuccess) {
			HttpSession session=request.getSession();
			session.setAttribute("log_id", email);
			response.sendRedirect("index/index.jsp");
			} else {
		        out.println("<script>");
		        out.println("alert('아이디 또는 비밀번호를 잘못 입력했습니다.');");
		        out.println("history.back();");
		        out.println("</script>");
		    }
	}
}
