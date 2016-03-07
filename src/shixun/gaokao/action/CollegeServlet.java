package shixun.gaokao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import shixun.gaokao.pojo.College;
import shixun.gaokao.service.CollegeService;
import shixun.gaokao.service.impl.CollegeServiceImpl;

public class CollegeServlet extends HttpServlet {

	CollegeService collegeService = new CollegeServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String requestType = request.getParameter("requestType");
		
		if(requestType.equals("1")) {
			String collegeName = request.getParameter("collegeName");
			int pageNo1 = Integer.parseInt(request.getParameter("pageNo1"));
			
			List<College> list = collegeService.getCollegeByName(collegeName, pageNo1);
			
			if(list != null) {
				JSONArray ja = JSONArray.fromObject(list);
				out.print(ja.toString());
			} else {
				out.print("");
			}
		} else if(requestType.equals("2")) {
			String area = request.getParameter("area");
			String type = request.getParameter("type");
			String level = request.getParameter("level");
			int pageNo2 = Integer.parseInt(request.getParameter("pageNo2"));
			String _985, _211;
			
			if(request.getParameter("_985").equals("false")) {
				_985 = "否";
			} else {
				_985 = "是";
			}
			
			if(request.getParameter("_211").equals("false")) {
				_211 = "否";
			} else {
				_211 = "是";
			}
			
			List<College> list = collegeService.getCollegeByConditions(area, type, level, _985, _211, pageNo2);
			
			if(list != null) {
				JSONArray ja = JSONArray.fromObject(list);
				out.print(ja.toString());
			} else {
				out.print("");
			}
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
