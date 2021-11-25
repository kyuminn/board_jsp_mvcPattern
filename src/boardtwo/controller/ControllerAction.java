package boardtwo.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import boardtwo.action.CommandAction;

public class ControllerAction extends HttpServlet{
	private static final long serialVersionUID =1L;
	
	// 명령어와 명령어 처리 클래스를 쌍으로 저장해두는 맵
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	
	/*명령어와 처리 클래스가 매핑되어 있는 CommandPro.properties을 읽어서 commandMap 에 저장하는 과정*/
	
	// 1. web.xml 에서 propertyConfig에 해당하는 init-param 값을 읽어온다.
	@Override
	public void init(ServletConfig config) throws ServletException {
		String property = config.getInitParameter("propertyConfig");
		
		//2. property의 정보를 저장할 Properties 객체 생성
		Properties pr = new Properties();
		// 3. Command.properties 파일으이 정보를 Properties 객체인 pr 에 저장
		FileInputStream fis = null;
		String path = config.getServletContext().getRealPath("/WEB-INF");
		try {
			fis = new FileInputStream(new File(path,property));
			pr.load(fis);
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if (fis!=null) fis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// Iterator 객체 사용
		Iterator<Object> keyIter = pr.keySet().iterator();
		while(keyIter.hasNext()) {
			String command = (String)keyIter.next();
			String className = pr.getProperty(command);
			try {
				
				Class<?> commandClass = Class.forName(className);
				// 해당 클래스의 객체 생성
				Object commandInstance = commandClass.newInstance();
				// 생성된 객체 commandMap 에 저장
				commandMap.put(command, commandInstance);
			}catch(ClassNotFoundException e) {
				throw new ServletException(e);
			}catch(InstantiationException e) {
				throw new ServletException(e);
			}catch(IllegalAccessException e) {
				throw new ServletException(e);
			}
		}
	}
	
	//Get 방식 서비스 메서드
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		requestPro(req,resp);
	}
	
	// 사용자의 요청에 따라 분석하여 해당 작업 처리
	private void requestPro(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String view = null;
		CommandAction com = null;
		try {
			String command = req.getRequestURI();
			if (command.indexOf(req.getContextPath())==0) {
				command = command.substring(req.getContextPath().length());
			}
			
			com =(CommandAction)commandMap.get(command);
			view = com.requestPro(req, resp);
		}catch(Throwable e) {
			throw new ServletException(e);
		}
		
		req.getRequestDispatcher(view).forward(req, resp);
	}
}
