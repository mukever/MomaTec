package com.thinkgem.jeesite.modules.webservice.service;

import javax.jws.WebService;

@WebService
public class TestWebService {

	public String test(String param){
		System.out.println(param);
		return "test";
	}
}
