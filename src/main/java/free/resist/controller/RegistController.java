package free.resist.controller;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import free.resist.service.ResistService;


@Controller
public class RegistController {
	
	@Autowired
	ResistService resistservice;
	
	
	
	@RequestMapping("/IdDoubleCheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userid)
	{
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = resistservice.idcheck(userid);
        map.put("cnt", count);
 
        return map;
	}
	
	// 새 프리랜서 회원 가입 시작
	@RequestMapping("/NewFreeLnRegist")
	public String NewFreeLnRegist(@RequestParam HashMap<String,Object> map)
	{
		System.out.println(map);
		resistservice.NewFreeLnRegist(map);
		return "./LOGIN/login";
	}
	// 새 프리랜서 회원 가입 끝





}
