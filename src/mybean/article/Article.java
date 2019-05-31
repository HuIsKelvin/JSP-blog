package mybean.article;

/*
 * blog 的 article 类
 * 
 * aid - 博客id
 * title - 博客标题
 * date - 博客发布日期
 * author - 博客作者
 * category - 博客类别
 * content - 博客内容
 */

public class Article {
	private int aid;
	private String title;
	private String date;
	private String author;
	private String category;
	private String content;
	
	public Article() {
		this.aid = 0;
		this.title = "";
		this.date = "";
		this.author = "Kelvin";
		this.category = "";
		this.content = "";
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
