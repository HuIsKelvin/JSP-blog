package mybean.article;

import java.util.Vector;

public class ArticleList {
	Vector<Article> articleList;

	public ArticleList() {
		super();
		articleList = new Vector<Article>();
	}
	public ArticleList(Vector<Article> articleList) {
		super();
		this.articleList = articleList;
	}
	public int getArticleNum() {
		if(this.articleList != null) {
			return this.articleList.size();
		}
		return 0;
	}
	public boolean add(Article article) {
		if(article == null) return false;
		if(this.articleList == null) {
			this.articleList = new Vector<Article>();
		}
		this.articleList.add(article);
		return true;
	}
	public Vector<Article> getArticleList() {
		return articleList;
	}
}
