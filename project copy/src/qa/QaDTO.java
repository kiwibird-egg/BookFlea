package qa;

public class QaDTO {

	int postID;	
	String postSbj;
	String postWriter;
	String postDate;
	String postContent;
	int postAvailable;
	
	
	//====================================
	public int getPostID() {
		return postID;
	}
	public void setPostID(int postID) {
		this.postID = postID;
	}
	//====================================
	public String getPostSbj() {
		return postSbj;
	}
	public void setPostSbj(String postSbj) {
		this.postSbj = postSbj;
	}
	//====================================
	public String getPostWriter() {
		return postWriter;
	}
	public void setPostWriter(String postWriter) {
		this.postWriter = postWriter;
	}
	//====================================
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	//====================================
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	//====================================
	public int getPostAvailable() {
		return postAvailable;
	}
	public void setPostAvailable(int postAvailable) {
		this.postAvailable = postAvailable;
	}
}
