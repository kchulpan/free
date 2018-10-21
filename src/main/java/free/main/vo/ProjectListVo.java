package free.main.vo;

public class ProjectListVo {
	private String proj_id; 
	private String proj_nm; 
	private String proj_str_date; 
	private String proj_end_date; 
	private String client_id;
    private int	   involve_num;
    private String need_tech;
    private String field_1;
    private String field_2;
    private String note;
    private String remark;
    private String use_yn;
    private String update_id;
    private String update_date;
    private String project_amount;
    private String client_nm; 
    private String client_addr_1; 
    private String client_addr_2;
    private String client_file; 
    private String client_file_nm;
    
    //getter setter
	public String getProj_id() {
		return proj_id;
	}
	public void setProj_id(String proj_id) {
		this.proj_id = proj_id;
	}
	public String getProj_nm() {
		return proj_nm;
	}
	public void setProj_nm(String proj_nm) {
		this.proj_nm = proj_nm;
	}
	public String getProj_str_date() {
		return proj_str_date;
	}
	public void setProj_str_date(String proj_str_date) {
		this.proj_str_date = proj_str_date;
	}
	public String getProj_end_date() {
		return proj_end_date;
	}
	public void setProj_end_date(String proj_end_date) {
		this.proj_end_date = proj_end_date;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public int getInvolve_num() {
		return involve_num;
	}
	public void setInvolve_num(int involve_num) {
		this.involve_num = involve_num;
	}
	public String getNeed_tech() {
		return need_tech;
	}
	public void setNeed_tech(String need_tech) {
		this.need_tech = need_tech;
	}
	public String getField_1() {
		return field_1;
	}
	public void setField_1(String field_1) {
		this.field_1 = field_1;
	}
	public String getField_2() {
		return field_2;
	}
	public void setField_2(String field_2) {
		this.field_2 = field_2;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getUpdate_id() {
		return update_id;
	}
	public void setUpdate_id(String update_id) {
		this.update_id = update_id;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getClient_nm() {
		return client_nm;
	}
	public void setClient_nm(String client_nm) {
		this.client_nm = client_nm;
	}
	public String getClient_addr_1() {
		return client_addr_1;
	}
	public void setClient_addr_1(String client_addr_1) {
		this.client_addr_1 = client_addr_1;
	}
	public String getClient_addr_2() {
		return client_addr_2;
	}
	public void setClient_addr_2(String client_addr_2) {
		this.client_addr_2 = client_addr_2;
	}
	public String getClient_file() {
		return client_file;
	}
	public void setClient_file(String client_file) {
		this.client_file = client_file;
	}
	public String getClient_file_nm() {
		return client_file_nm;
	}
	public void setClient_file_nm(String client_file_nm) {
		this.client_file_nm = client_file_nm;
	}
	public String getProject_amount() {
		return project_amount;
	}
	public void setProject_amount(String project_amount) {
		this.project_amount = project_amount;
	}
	
	//constructor
	public ProjectListVo() {}
	public ProjectListVo(String proj_id, String proj_nm, String proj_str_date, String proj_end_date, String client_id,
			int involve_num, String need_tech, String field_1, String field_2, String note, String remark,
			String use_yn, String update_id, String update_date, String project_amount, String client_nm,
			String client_addr_1, String client_addr_2, String client_file, String client_file_nm) {
		super();
		this.proj_id = proj_id;
		this.proj_nm = proj_nm;
		this.proj_str_date = proj_str_date;
		this.proj_end_date = proj_end_date;
		this.client_id = client_id;
		this.involve_num = involve_num;
		this.need_tech = need_tech;
		this.field_1 = field_1;
		this.field_2 = field_2;
		this.note = note;
		this.remark = remark;
		this.use_yn = use_yn;
		this.update_id = update_id;
		this.update_date = update_date;
		this.project_amount = project_amount;
		this.client_nm = client_nm;
		this.client_addr_1 = client_addr_1;
		this.client_addr_2 = client_addr_2;
		this.client_file = client_file;
		this.client_file_nm = client_file_nm;
	}
	
	//toString
	@Override
	public String toString() {
		return "ProjectListVo [proj_id=" + proj_id + ", proj_nm=" + proj_nm + ", proj_str_date=" + proj_str_date
				+ ", proj_end_date=" + proj_end_date + ", client_id=" + client_id + ", involve_num=" + involve_num
				+ ", need_tech=" + need_tech + ", field_1=" + field_1 + ", field_2=" + field_2 + ", note=" + note
				+ ", remark=" + remark + ", use_yn=" + use_yn + ", update_id=" + update_id + ", update_date="
				+ update_date + ", project_amount=" + project_amount + ", client_nm=" + client_nm + ", client_addr_1="
				+ client_addr_1 + ", client_addr_2=" + client_addr_2 + ", client_file=" + client_file
				+ ", client_file_nm=" + client_file_nm + "]";
	} 
	
}
