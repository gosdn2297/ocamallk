package customer;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

public class ArticleVO {
	private int articleNo; // 글번호
	private String title; // 제목
	private String content; // 내용
	private String name ; // 작성자
	private Date writeDate; // 작성일
	private int views; // 조회수
	private String imageFileName; // 이미지파일이름

	public ArticleVO() {
		System.out.println("ArticleVO()");
	}
	
	public ArticleVO(int articleNo, String title, String name, Date writeDate, int views) {
		super();
		this.articleNo = articleNo;
		this.title = title;
		this.name = name;
		this.writeDate = writeDate;
		this.views = views;
	}

	public ArticleVO(int articleNo, String title, String content, String name, Date writeDate, int Views ,String imgageFileName) {
		super();
		this.articleNo = articleNo;
		this.title = title;
		this.content = content;
		this.name = name;
		this.writeDate = writeDate;
		this.views = Views;
		this.imageFileName=imgageFileName;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}


}
