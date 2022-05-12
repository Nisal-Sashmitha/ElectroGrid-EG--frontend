package com;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Interruptions;

/**
 * Servlet implementation class InterruptionAPI
 */
@WebServlet("/InterruptionAPI")
public class InterruptionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Interruptions interruptionObj = new Interruptions();
    
    public InterruptionAPI() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");

	     System.out.println("get method called");
		String output = interruptionObj.InterruptionsOfTheArea(
				request.getParameter("InterruptinAreafind"),
				request.getParameter("InterruptionDatefind") 	
			);
		
				
			response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = interruptionObj.newInterruption(
				request.getParameter("InterruptionDate"), 
				request.getParameter("InterruptionStartTime"), 
				request.getParameter("InterruptionEndTime"), 
				request.getParameter("InterruptinArea")
				
			);
		
				
			response.getWriter().write(output);
		
	}
	private static Map getMap(HttpServletRequest request) {
		
		Map<String, String> map = new HashMap<String, String>(); 
		try { 
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8"); 
			String queryString = scanner.hasNext() ? 
			scanner.useDelimiter("\\A").next() : ""; 
			scanner.close(); 
			String[] params = queryString.split("&"); 
			for (String param : params)  {
				String[] p = param.split("=");
				System.out.println(p[1].toString());
				map.put(p[0], p[1]); 
			} 
		} catch (Exception e)  { 
		}
		return map;
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub hidItemIDSave
		
		Map paras = getMap(request);
		 String output = interruptionObj.editInterruptions(paras.get("hidItemIDSave").toString(),
				 paras.get("InterruptionDate").toString(), 
				 paras.get("InterruptionStartTime").toString().replaceAll("%3A", ":"), 
				 paras.get("InterruptionEndTime").toString().replaceAll("%3A", ":"), 
				 paras.get("InterruptinArea").toString());
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Map paras = getMap(request);
		 String output = interruptionObj.deleteInterruption(paras.get("itemID").toString());
		response.getWriter().write(output);
	}

}
