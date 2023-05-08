package notice;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	// 생성자
	public NoticeDAO() {
		try {
			// JNDI(Java Naming and Directory Interface => 자바API)에 접근하기 위해 기본
			// 경로(java:/comp/env)를 지정
			// 자바 애플리케이션을 외부 디렉토리 서비스에 연결
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			// 톰켓 context.xml에 설정한 name값인 jdbc/oracle을 이용해 톰켓에 미리 연결한 DataSource를 받아 옵니다
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("오라클 연결 오류");
			e.printStackTrace(); //
		}
	}

	// 오늘 추가한 코드
	// 글 목록 페이징 메서드
	public List selectAllArticles(Map<String, Integer> paginMap) {
		List<ArticleVO> articleList = new ArrayList<ArticleVO>();
		int section = paginMap.get("section");
		int pageNum = paginMap.get("pageNum");
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * FROM(SELECT ROWNUM AS recNum, articleNo,"
					+ " title, name, writeDate, views from (SELECT articleNo,"
					+ "  title, name, writeDate, views from noticetbl ORDER BY articleNo DESC))"
					+ " WHERE recNum BETWEEN (?-1)*100+(?-1)*10+1 AND (?-1)*100+?*10";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, section);
			pstmt.setInt(2, pageNum);
			pstmt.setInt(3, section);
			pstmt.setInt(4, pageNum);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int articleNo = rs.getInt("articleNo");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Date writeDate = rs.getDate("writeDate");
				int views = rs.getInt("views");
				ArticleVO articleVO = new ArticleVO();
				articleVO.setArticleNo(articleNo);
				articleVO.setTitle(title);
				articleVO.setName(name);
				articleVO.setWriteDate(writeDate);
				articleVO.setViews(views);
				articleList.add(articleVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 페이징 조회 중 에러!!");
			e.printStackTrace();
		}
		return articleList;
	}

	// 오늘 추가한 코드
	// 글 목록
	public List<ArticleVO> selectAllArticles() {
		List<ArticleVO> articleList = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			// 답변형이므로 계층형DB다 따라서
			String query = "SELECT articleNo, title, name, writeDate views FROM "
					+ "noticetbl order by articleNo desc";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int articleNo = rs.getInt("articleNo");
				String title = rs.getString("title");
				String name = rs.getString("name");
				Date writeDate = rs.getDate("writeDate");
				int views = rs.getInt("name");
				ArticleVO articleVO = new ArticleVO();
				articleVO.setArticleNo(articleNo);
				articleVO.setTitle(title);
				articleVO.setName(name);
				articleVO.setWriteDate(writeDate);
				articleVO.setViews(views);
				articleList.add(articleVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 처리중 에러!!");
			e.printStackTrace();
		}
		return articleList;
	}

	// 전체 글 목록 수
	public int selectToArticles() {
		int totCount = 0;
		try {
			conn = dataFactory.getConnection();
			String query = "Select count(articleNo) from noticetbl";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				totCount = rs.getInt(1);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 목록 수 처리 중 에러!!");
			e.printStackTrace();
		}
		return totCount;
	}

//   글 번호 생성 메서드
	private int getNewArticleNo() {
		int aNo = 0;
		try {
			conn = dataFactory.getConnection();
//         max함수를 사용해서 가장 큰 번호를 조회(+1해서 최근 글에 부여)
			String query = "select max(articleNo) from noticetbl";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				aNo = rs.getInt(1) + 1; // 괄호 안에 숫자는 컬럼 인덱스
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 번호 생성 중 에러!!");
			e.printStackTrace();
		}
		return aNo;
	}

//   새 글 추가 메서드
	public int insertNewArticle(ArticleVO articleVO) {
		int articleNo = getNewArticleNo();
		try {
			conn = dataFactory.getConnection();
			String title = articleVO.getTitle();
			String content = articleVO.getContent();
			String imageFileName = articleVO.getImageFileName();
			String name = articleVO.getName();
			int views = articleVO.getViews();
			String query = "insert into noticetbl (articleNo, title, content, imageFileName,"
					+ " name, views) values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.setString(4, imageFileName);
			pstmt.setString(5, name);
			pstmt.setInt(6, views);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("새 글 추가 중 에러!!");
			e.printStackTrace();
		}
		return articleNo;
	}

//   선택한 글 상세 내용 메서드
	public ArticleVO selectArticle(int articleNo) {
		ArticleVO article = new ArticleVO();
		try {
			conn = dataFactory.getConnection();
			String query = "select articleNo, title, content, name, "
					+ "writeDate, views, imageFileName from noticetbl where articleNo = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			int _articleNo = rs.getInt("articleNo");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String name = rs.getString("name");
			Date writeDate = rs.getDate("writeDate");
			int views = rs.getInt("views");
			String imageFileName = URLEncoder.encode(rs.getString("imageFileName"), "utf-8");
			if (imageFileName.equals("null")) {
				imageFileName = null;
			}
			article.setArticleNo(_articleNo);
			article.setTitle(title);
			article.setContent(content);
			article.setName(name);
			article.setWriteDate(writeDate);
			article.setViews(views);
			article.setImageFileName(imageFileName);
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 상세 구현 중 에러!!");
			e.printStackTrace();
		}
		return article;
	}

	// 글 수정하기 메소드
	public void updateArticle(ArticleVO article) {
		int articleNo = article.getArticleNo();
		String title = article.getTitle();
		String content = article.getContent();
		try {
			conn = dataFactory.getConnection();
			String query = "update noticetbl set title=?, content=?";
//			if (imageFileName != null && imageFileName.length() != 0) {
//				query += ", imageFileName=?";
//			}
			query += " where articleNo=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
//			if (imageFileName != null && imageFileName.length() != 0) {
//				pstmt.setString(3, imageFileName);
//				pstmt.setInt(4, articleNo);
//			} else {
//				pstmt.setInt(3, articleNo);
//			}
			pstmt.setInt(3, articleNo);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 수정중 오류");
			e.printStackTrace();
		}
	}

	// 삭제할 글 번호 목록 가져오기
	public List<Integer> selectRemovedArticles(int articleNo) {
		List<Integer> articleNoList = new ArrayList<Integer>();
		try {
			conn = dataFactory.getConnection();
			String query = "select articleNo from noticetbl where articleNo";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				articleNo = rs.getInt("articleNo");
				articleNoList.add(articleNo);
			}
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("삭제할 글 번호 목록 가져오기 중 에러");
			e.printStackTrace();
		}
		return articleNoList;
	}

	// 글 삭제 메서드
	public void deleteArticle(int articleNo) {
		try {
			conn = dataFactory.getConnection();
			String query = "delete from noticetbl where articleNo=?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, articleNo);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println("글 삭제 중 에러");
			e.printStackTrace();
		}
	}
}