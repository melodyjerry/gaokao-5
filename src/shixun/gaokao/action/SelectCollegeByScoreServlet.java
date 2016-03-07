package shixun.gaokao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import shixun.gaokao.pojo.Result1Pojo;
import shixun.gaokao.service.SelectCollegeByScoreService;
import shixun.gaokao.service.impl.SelectCollegeByScoreServiceImpl;

public class SelectCollegeByScoreServlet extends HttpServlet {
	SelectCollegeByScoreService selectCollegeByScoreService = new SelectCollegeByScoreServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		int myScore = 0;
		if(! request.getParameter("myScore").equals("")) {
			myScore = Integer.parseInt(request.getParameter("myScore"));			
		}
		
		String area = request.getParameter("area");
		String type = request.getParameter("type");
		int year = Integer.parseInt(request.getParameter("year"));
		String batch = request.getParameter("batch");
		
		List<Result1Pojo> list = selectCollegeByScoreService.selectCollegeByScore(myScore, year, area, type, batch);
		
		if (list != null) {
			JSONArray ja = JSONArray.fromObject(list);
			out.print(ja.toString());
		} else {
			out.print("");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
