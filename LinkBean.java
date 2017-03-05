package Final;

public class LinkBean {
	private String title;
	private String url;
	private int point;
	private int id;
	public LinkBean(int id, String title, String url, int point) {
		super();
		this.title = title;
		this.url = url;
		this.point = point;
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getPoint() {
		return point;
	}
	public void setPoints(int point) {
		this.point = point;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

}
