package shixun.gaokao.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import shixun.gaokao.pojo.Profession;
import shixun.gaokao.service.ProRankingService;
import shixun.gaokao.service.impl.ProRankingServiceImpl;

//该类用于从数据库获取一个学科专业排行榜列表，将其转化成Json数据返回给客户端
public class ProRankingServlet extends HttpServlet {
	ProRankingService proRankingService = new ProRankingServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		List<Profession> list = proRankingService.getProRanking();

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
