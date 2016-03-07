package shixun.gaokao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import shixun.gaokao.pojo.Result2Pojo;
import shixun.gaokao.service.SelectProByScoreService;
import shixun.gaokao.service.impl.SelectProByScoreServiceImpl;

public class SelectProByScoreServlet extends HttpServlet {
	SelectProByScoreService selectProByScoreService = new SelectProByScoreServiceImpl();
	
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
		String pro = request.getParameter("pro");
		
		System.out.println(myScore + area + type + year + batch + pro);
		
		List<Result2Pojo> list = selectProByScoreService.selectProByScore(myScore, year, area, type, batch, pro);
		
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
