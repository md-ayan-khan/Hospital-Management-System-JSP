//package servlets;
//
//import java.io.IOException;
//import java.util.List;
//
//import entity.TimeLine;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import modelsDAO.TimeLineDAO;
//
//@WebServlet("/timeline")
//public class TimeLineServlet extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//
//	private TimeLineDAO dao;
//
//	@Override
//	public void init() throws ServletException {
//		dao = new TimeLineDAO();
//	}
//
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		List<TimeLine> activities = dao.getRecentActivities();
//
//		request.setAttribute("activities", activities);
//
//		request.getRequestDispatcher("index.jsp").forward(request, response);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		doGet(request, response);
//	}
//}