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
	private int id;
	private String title;
	private String date;
	private String author;
	private String description;
	private String category;
	private String content;
	
	public Article() {
		this.id = 0;
		this.title = "";
		this.date = "";
		this.author = "";
		this.category = "";
		this.content = "";
	}
	public Article(int id, String title) {
		this.id = id;
		this.title = title;
		this.date = "";
		this.author = "Kelvin";
		this.category = "";
		this.content = "";
	}
	public int getId() {
		return this.id;
	}
	public void setId(int aid) {
		this.id = aid;
	}
	public String getTitle() {
		return this.title;
	}
	public void setTitle(String title) {
		this.title = (title == null ? "" : title);
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = (date == null ? "" : date);
	}
	public String getAuthor() {
		return this.author;
	}
	public void setAuthor(String author) {
		this.author = (author == null ? "" : author);
	}
	public String getCategory() {
		return this.category;
	}
	public void setCategory(String category) {
		this.category = (category == null ? "" : category);
	}
	public String getContent() {
		return this.content;
	}
	public void setContent(String content) {
		this.content = (content == null ? "" : content);
	}
	public String getDescription() {
		return this.description;
	}
	public void setDescription(String description) {
		this.description = (description == null ? "" : description);
	}
}
