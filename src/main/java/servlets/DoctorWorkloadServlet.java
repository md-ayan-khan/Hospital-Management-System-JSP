//package servlets;
//
//import java.io.IOException;
//import java.util.List;
//
//import entity.WorkloadReport;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import modelsDAO.doctorDAO;
//
//@WebServlet("/doctor-workload")
//public class DoctorWorkloadServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//		try {
//
//			doctorDAO dao = new doctorDAO();
//
//			List<WorkloadReport> workloadList = dao.getDoctorWorkloadReport();
//
//			request.setAttribute("workloadList", workloadList);
//
//			// index.jsp par forward karo
//			request.getRequestDispatcher("index.jsp").forward(request, response);
//
//		} catch (Exception e) {
//
//			e.printStackTrace();
//
//			request.setAttribute("error", "Data load failed");
//
//			request.getRequestDispatcher("index.jsp").forward(request, response);
//		}
//	}
//}