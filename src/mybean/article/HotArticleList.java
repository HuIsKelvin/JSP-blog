package mybean.article;

import java.util.Vector;

public class HotArticleList {
	private Vector<Article> hotArticleList;
	
	public HotArticleList() {
		this.hotArticleList = new Vector<Article>();
	}

	public Vector<Article> getHotArticleList() {
		return hotArticleList;
	}

	public void setHotArticleList(Vector<Article> hotArticleList) {
		this.hotArticleList = hotArticleList;
	}
	
	public int getArticleNum() {
		if(this.hotArticleList != null) {
			return this.hotArticleList.size();
		}
		return 0;
	}
	
	public boolean add(Article newArticle) {
		if (newArticle == null) {
			return false;
		}
		if(this.hotArticleList == null) {
			this.hotArticleList = new Vector<Article>();
		}
		this.hotArticleList.add(newArticle);
		return true;
	}
}
