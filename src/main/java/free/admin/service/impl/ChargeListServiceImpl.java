package free.admin.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import free.admin.dao.ChargeListDao;
import free.admin.service.ChargeListService;
import free.admin.vo.ChargeListVo;

@Service("chargeListService")
public class ChargeListServiceImpl implements ChargeListService
{
	@Autowired
	ChargeListDao chargeListDao;

	@Override
	public List<ChargeListVo> chargeList(HashMap<String,Object> map) 
	{
		List<ChargeListVo> chargeList = chargeListDao.chargeList(map);
		return chargeList;
	}

	@Override
	public List<ChargeListVo> chargeDetail(HashMap<String, Object> map) 
	{
		List<ChargeListVo> chargeDetail = chargeListDao.chargeDetail(map);
		return chargeDetail;
	}

	@Override
	public void chargeUpdate(HashMap<String, Object> map) 
	{
		chargeListDao.chargeUpdate(map);
		
	}

	@Override
	public void ChargeNewInsert(HashMap<String, Object> map) 
	{
		chargeListDao.ChargeNewInsert(map);
	}

	@Override
	public void chargeDelete(HashMap<String, Object> map) {
		chargeListDao.chargeDelete(map);
		
	}

}
