package servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import modelsDAO.TimeLineDAO;
import modelsDAO.doctorDAO;
import modelsDAO.PatientDAO;
import modelsDAO.appointmentDAO;
import modelsDAO.billsDAO;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private TimeLineDAO timelineDao;
	private doctorDAO doctorDao;
	private PatientDAO patientDao;
	private appointmentDAO appointmentDao;
	private billsDAO billsDao;

	@Override
	public void init() {

		timelineDao = new TimeLineDAO();
		doctorDao = new doctorDAO();
		patientDao = new PatientDAO();
		appointmentDao = new appointmentDAO();
		billsDao = new billsDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Recent Activities
		request.setAttribute("activities", timelineDao.getRecentActivities());

		// Doctor Workload
		request.setAttribute("workloadList", doctorDao.getDoctorWorkloadReport());

		// Dashboard Counts
		request.setAttribute("patientCount", patientDao.getPatientCount());

		request.setAttribute("doctorCount", doctorDao.getDoctorCount());

		request.setAttribute("appointmentCount", appointmentDao.getAppointmentCount());

		request.setAttribute("billCount", billsDao.getBillCount());

		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
}