package controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Properties props;	
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		//���� ��û�� �ѹ��� �����
		//���������� �о Properties �÷��ǿ� ����
		
		//1. �������� �о����
		String configFile=config.getInitParameter("configFile");
		System.out.println("configFile="+configFile);
		//=> /config/CommandPro.properties
		
		String realConfigFile
		=config.getServletContext().getRealPath(configFile);
		System.out.println("���� ������ ���:"+ realConfigFile);
		
		FileInputStream fis=null;
		
		try {
			//2. Properties �÷��ǿ� �����ϱ�
			fis=new FileInputStream(realConfigFile);
			props = new Properties();
			props.load(fis);
			System.out.println("�÷��ǿ� �����!");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(fis!=null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		requestProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException {
		requestProcess(request, response);
	}

	private void requestProcess(HttpServletRequest request, 
			HttpServletResponse response) 
					throws ServletException, IOException{
		//��û�� ���� �� ���� ȣ���
		//��������(Properties�÷���)�� �����ؼ� ��� Ŭ����(��ɾ� ó�� Ŭ����)�� ���� ��
		//�ش� Ŭ������ �޼��� ȣ��
		//�޼���κ��� ���������� ���Ϲ޾Ƽ� ������
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		
		//1. ��û URI�κ��� ��ɾ� ����
		String uri=request.getRequestURI();
		System.out.println("uri="+uri);
		
		
		String contextPath=request.getContextPath();
		System.out.println("contextPath="+contextPath); 
		
		String cmd=uri;
		if(uri.indexOf(contextPath)!=-1) {
			cmd=uri.substring(contextPath.length());
		}
		System.out.println("��ɾ� cmd="+cmd);
		
		//2. ��ɾ �ش��ϴ� ��ɾ�ó�� Ŭ���� ���ϱ�
		String cmdVal=props.getProperty(cmd);
		System.out.println("��ɾ� ó�� Ŭ���� cmdVal=" + cmdVal);
		
		try {
			//���ڿ��� Ŭ������ ��ȯ		
			Class cmdClass=Class.forName(cmdVal);
			
			//Ŭ������ �ν��Ͻ���
			Controller controller= (Controller)cmdClass.newInstance();
			
			//3. �޼��� ȣ��
			String viewPage=controller.requestPro(request, response);
			System.out.println("viewPage="+viewPage);
			
			if(controller.isRedirect()) {
				//�ش� �������� redirect
				System.out.println("redirect!\n");
				
				response.sendRedirect(contextPath+viewPage);				
			}else {
				//4. �ش� ���������� ������
				System.out.println("forward!\n");
				
				RequestDispatcher dispatcher
					=request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}	
	}

	
}
