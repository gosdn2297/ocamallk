package product;

import java.sql.Date;

public class ProductVO {
	private String category;
	private String brand;
	private String goods;
	private String price;
	private String imageFileName;
	private Date regDate;
	
	
	public ProductVO() {
	
	}

	public ProductVO(String category, String brand, String goods, String price, String imageFileName, Date regDate) {
		super();
		this.category = category;
		this.brand = brand;
		this.goods = goods;
		this.price = price;
		this.imageFileName = imageFileName;
		this.regDate = regDate;
	}
	

	public ProductVO(String category, String brand, String goods, String price,String imageFileName) {
		super();
		this.category = category;
		this.brand = brand;
		this.goods = goods;
		this.price = price;
		this.imageFileName = imageFileName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getGoods() {
		return goods;
	}

	public void setGoods(String goods) {
		this.goods = goods;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
}
