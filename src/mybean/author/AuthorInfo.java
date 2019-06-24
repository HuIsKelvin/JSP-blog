package mybean.author;

public class AuthorInfo {
	private int id;
	private String name;
	private String motto;
	private String email;
	private String emailSub;
	private String github;
	
	public AuthorInfo() {
		this(0, "", "", "", "", "");
	}
	public AuthorInfo(int id, String name, String motto, String email, String emailSub, String github) {
		super();
		this.id = id;
		this.name = name;
		this.motto = motto;
		this.email = email;
		this.emailSub = emailSub;
		this.github = github;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMotto() {
		return motto;
	}
	public void setMotto(String motto) {
		this.motto = motto;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailSub() {
		return emailSub;
	}
	public void setEmailSub(String emailSub) {
		this.emailSub = emailSub;
	}
	public String getGithub() {
		return github;
	}
	public void setGithub(String github) {
		this.github = github;
	}
	
}
