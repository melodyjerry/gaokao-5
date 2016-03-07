package shixun.gaokao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import shixun.gaokao.pojo.NationalLine;
import shixun.gaokao.service.NationalLineService;
import shixun.gaokao.service.impl.NationalLineServiceImpl;

public class NationalLineServlet extends HttpServlet {
	NationalLineService nationalLineService = new NationalLineServiceImpl();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String area = request.getParameter("area");
		String type = request.getParameter("type");
		String batch = request.getParameter("batch");
		
		List<NationalLine> list = nationalLineService.getNationalLines(area, type, batch);
		
		if(list != null) {
			JSONArray ja = JSONArray.fromObject(list);
			out.print(ja.toString());
		} else {
			out.print("");
		}
	}

}
