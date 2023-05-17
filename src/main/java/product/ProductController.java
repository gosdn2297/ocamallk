package product;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.MemberDAO;
import login.MemberVO;

@WebServlet("/product/*")
public class ProductController extends HttpServlet {
	ProductDAO productDAO;

	public void init(ServletConfig config) throws ServletException {
		productDAO = new ProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String nextPage = null;
		String action = request.getPathInfo(); // URL 요청명을 가져옵니다.
		System.out.println("요청 매핑이름 : " + action);
		if (action == null || action.equals("/listProducts.do")) {
			List<ProductVO> productList = productDAO.listproducts();
			request.setAttribute("prodcutList", productList); // 회원정보 바인딩
			nextPage = "/product/listProducts.jsp";
		} else if (action.equals("/addProduct.do")) { // 컨트롤러에서 nextPage 포워딩
			String category = request.getParameter("category");
			String brand = request.getParameter("brand");
			String goods = request.getParameter("goods");
			String price = request.getParameter("price");
			String imageFileName = request.getParameter("imagefilename");
			ProductVO productVO = new ProductVO(category,brand,goods,price,imageFileName);
			request.setAttribute("msg", "addProduct");
			List<ProductVO>  productList= productDAO.listproducts();
			request.setAttribute("productlist", productList); // 회원 정보 바인딩
			nextPage = "/product/listProducts.do";
		} else {
			List<ProductVO> productList = productDAO.listproducts();
			request.setAttribute("productList", productList); // 회원 정보 바인딩
			nextPage = "/product/listProducts.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
		dispatcher.forward(request, response); // 컨트롤러에서 화면 출력하는 listMembers.jsp 포워딩
	}

}