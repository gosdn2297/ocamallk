package event;

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
		try { // 이미지 파일이름이 한글로 썻을수도있어서 깨질수있음
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "utf-8"); // 이미지 파일이름을 utf-8로 디코딩
			} else {
				imageFileName = null; // 아닐시(이미지파일이 없을시) null값으로 저장
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 로딩중 에러!!");
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLEncoder.encode(imageFileName, "utf-8");
			} else {
				imageFileName = null;
			}
		} catch (UnsupportedEncodingException e) {
			System.out.println("이미지 저장 중 에러!!");
		}
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
