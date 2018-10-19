/*package free.client.serviceImol;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.client.dao.FreeLnDao;
import free.client.service.FreeLnService;

@Service("freeLnService")
public class FreeLnServiceImpl implements FreeLnService {
	
	@Autowired
	private FreeLnDao freeLnDao;
	
	
	//아이디 중복검사
	@Override
	public void check_id(String freeLn_id, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		out.println(freeLnDao.check_id(freeLn_id));
	}
	
	//이메일 중복검사

	
	
}
*/