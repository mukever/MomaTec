package com.thinkgem.jeesite.modules.webservice.client;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import com.thinkgem.jeesite.modules.webservice.service.TestWebService;  


public class TestWebServiceClient {
	
	/**
	 * webservice客户端测试
	 * @param args
	 * @throws Exception 
	 */
    public static void main(String[] args) throws Exception {  
        // 创建WebService客户端代理工厂  
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();  
        // 注册WebService接口  
        factory.setServiceClass(TestWebService.class);  
        // 设置WebService地址  
        factory.setAddress("http://localhost:8080/jeeadminlte/webservice/TestWebService");  
        TestWebService testWebService = (TestWebService) factory.create();  
        System.out.println("invoke webservice...");
        System.out.println("message context is:" + testWebService.test("我来测试webservice接口"));
        
        
        JaxWsDynamicClientFactory clientFactory = JaxWsDynamicClientFactory.newInstance();

        Client client = clientFactory.createClient("http://localhost:8080/jeeadminlte/webservice/TestWebService?wsdl");

        Object[] result = client.invoke("test","我是来测试的");

        System.out.println(result[0]);
    } 
}
