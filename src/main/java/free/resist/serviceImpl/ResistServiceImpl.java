package free.resist.serviceImpl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.resist.dao.ResistDao;
import free.resist.service.ResistService;
@Service("resistService")
public class ResistServiceImpl implements ResistService {

	@Autowired
	ResistDao resistDao;
	
	
	@Override
	public void NewFreeLnRegist(HashMap<String, Object> map) 
	{
		resistDao.NewFreeLnRegist(map);
		
	}

}
