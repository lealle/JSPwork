package ajaxReply;

public class Reply {
	 int no;
	 int ref;
	 String content;
	 String name;
	 String redate;
	 
	 
	 
	public Reply() {
	}
	public Reply(int no, int ref, String content, String name, String redate) {
		super();
		this.no = no;
		this.ref = ref;
		this.content = content;
		this.name = name;
		this.redate = redate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
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
	public String getRedate() {
		return redate;
	}
	public void setRedate(String redate) {
		this.redate = redate;
	}
	@Override
	public String toString() {
		return "Reply [no=" + no + ", ref=" + ref + ", content=" + content + ", name=" + name + ", redate=" + redate
				+ "]";
	}
 
}
