package free.main.vo;

public class ProjectSignUpVo {
	private String project_id; 
	private String freeln_id;
	private int    result_val;
	
	//getter setter
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getFreeln_id() {
		return freeln_id;
	}
	public void setFreeln_id(String freeln_id) {
		this.freeln_id = freeln_id;
	}
	
	
	public int getResult_val() {
		return result_val;
	}
	public void setResult_val(int result_val) {
		this.result_val = result_val;
	}
	//constructor
	public ProjectSignUpVo() {}
	public ProjectSignUpVo(String project_id, String freeln_id, int result_val) {
		super();
		this.project_id = project_id;
		this.freeln_id = freeln_id;
		this.result_val = result_val;
	}
	
	//toString
	@Override
	public String toString() {
		return "ProjectSignUpVo [project_id=" + project_id + ", freeln_id=" + freeln_id + ", result_val=" + result_val
				+ "]";
	}
	
	

	

}
