package product;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.MemberVO;

	public class ProductDAO {
		private Connection conn;
		private PreparedStatement pstmt;
		private DataSource dataFactory;
	
	public ProductDAO() {
	    try {
	    	//JNDI(Java Naming and Directory Interface)에 적븐하기 위해 기본 경로(javaL/comp/env)를 지정
	    	//(자바 애플리케이션을 외부 디렉터리 서비스에 연결
	       Context ctx = new InitialContext();
	       Context envContext = (Context)ctx.lookup("java:/comp/env");
	       dataFactory = (DataSource)envContext.lookup("jdbc/oracle");
	       
	    } catch (Exception e) {
	       System.out.println("오라클 연결 오류");
	       e.printStackTrace();
	    }
    }
	//상품 조회
	public List<ProductVO> listproducts(){
		List<ProductVO> productList = new ArrayList();
		try {
	        conn = dataFactory.getConnection();
	        String query = "select * from goodstbl order by brand desc";
	        pstmt = conn.prepareStatement(query);
	        ResultSet rs = pstmt.executeQuery();
	        while(rs.next()) {
	        	String category = rs.getString("category");
	        	String brand = rs.getString("brand");
	        	String goods = rs.getString("goods");
	        	String price = rs.getString("price");
	        	String imageFileName = rs.getString("imageFileName");
	        	Date regDate = rs.getDate("regDate");
	        	ProductVO productVO = new ProductVO(category, brand, goods, price, imageFileName, regDate);
	        	productList.add(productVO);
	        }
	        rs.close();
	        pstmt.close();
	        conn.close();
	     	} catch (Exception e) {
	        System.out.println("DB 조회 중 에러!");
	        e.printStackTrace();
	     	}
	     	return productList;
	}

//  상품 등록
	  public void addProduct(ProductVO productVO) {
	     try {
	        conn = dataFactory.getConnection();
	        String category = productVO.getCategory();
	        String brand = productVO.getBrand();
	        String goods = productVO.getGoods();
	        String price = productVO.getPrice();
	        String imageFileName=productVO.getImageFileName();
	        String query = "insert into goodstbl (category, brand, goods, price,imageFileName) values(?,?,?,?,?)";
	        pstmt = conn.prepareStatement(query);
	        pstmt.setString(1, category);
	        pstmt.setString(2, brand);
	        pstmt.setString(3, goods);
	        pstmt.setString(4, price);
	        pstmt.setString(5, imageFileName);
	        pstmt.executeUpdate();
	        pstmt.close();
	        conn.close();
	     } catch (Exception e) {
	        System.out.println("DB 등록 중 에러!!");
	        e.printStackTrace();
	     }
	  }
}