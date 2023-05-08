package customer;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BoardService {
	qnaDAO qnaDAO; // 데이터베이스 요구

	public BoardService() {
		qnaDAO = new qnaDAO(); // 생성자에서 NoticeDAO 객체를 생성
	}

	// 오늘 추가한 코드
	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articleMap = new HashMap();
		List<ArticleVO> articleList = qnaDAO.selectAllArticles(pagingMap);
		int totArticles = qnaDAO.selectToArticles();
		articleMap.put("articleList", articleList);
		articleMap.put("totArticles", totArticles);
//		articleMap.put("totArticles", 100);
		return articleMap;
	}

	// 오늘 추가한 코드
	public List<ArticleVO> listArticles() {
		List<ArticleVO> articleList = qnaDAO.selectAllArticles();
		return articleList;
	}

	public int addArticle(ArticleVO articleVO) {
		return qnaDAO.insertNewArticle(articleVO);
	}

	public ArticleVO viewArticle(int articleNo) {
		ArticleVO articleVO = null;
		articleVO = qnaDAO.selectArticle(articleNo);
		return articleVO;
	}

	public void modArticle(ArticleVO articleVO) {
		qnaDAO.updateArticle(articleVO);
	}

	public List<Integer> removeArticle(int articleNo) {
		List<Integer> articleNoList = qnaDAO.selectRemovedArticles(articleNo);
		qnaDAO.deleteArticle(articleNo);
		return articleNoList;
	}

	public int addReply(ArticleVO articleVO) {
		return qnaDAO.insertNewArticle(articleVO);
	}
}
