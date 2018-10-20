package free.email.vo;

public class EmailVo {

    private String freeln_phone;
    private String freeln_mail;
    private String freeln_pwd;
    
    
    public String getFreeln_phone() {
		return freeln_phone;
	}
	public void setFreeln_phone(String freeln_phone) {
		this.freeln_phone = freeln_phone;
	}

	public String getFreeln_mail() {
		return freeln_mail;
	}
	public void setFreeln_mail(String freeln_mail) {
		this.freeln_mail = freeln_mail;
	}
	public String getFreeln_pwd() {
		return freeln_pwd;
	}
	public void setFreeln_pwd(String freeln_pwd) {
		this.freeln_pwd = freeln_pwd;
	}
	@Override
	public String toString() {
		return "EmailVo [freeln_phone=" + freeln_phone + ", freeln_mail=" + freeln_mail + ", freeln_pwd=" + freeln_pwd
				+ "]";
	}


     

     
}
