package free.resist.controller;


import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import free.resist.service.ResistService;


@Controller
public class RegistController {
	
	@Autowired
	ResistService resistservice;
	
	
	
	
	
	
	@RequestMapping("/NewFreeLnRegist")
	public String NewFreeLnRegist(@RequestParam HashMap<String,Object> map)
	{
		System.out.println(map);
		resistservice.NewFreeLnRegist(map);
		return "./LOGIN/login";
	}





}
