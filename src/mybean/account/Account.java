package mybean.account;

public class Account {
	String username;
	String password;
	int degree;
	
	public boolean isAdmin() {
		// ÊÇ·ñÎª²©Ö÷ÕËºÅ
		return this.degree == 2;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getDegree() {
		return degree;
	}
	public void setDegree(int degree) {
		this.degree = degree;
	}
}
