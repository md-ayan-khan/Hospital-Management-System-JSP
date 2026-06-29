package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import entity.appointments;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelsDAO.appointmentDAO;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	appointmentDAO dao = new appointmentDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		// SHOW ALL
		if (action == null) {

			List<appointments> list = dao.read();

			request.setAttribute("appointments", list);

			request.getRequestDispatcher("appointment.jsp").forward(request, response);
		}

		// DELETE
		else if ("delete".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			dao.delete(id);

			response.sendRedirect("appointment");
		}

		// EDIT
		else if ("edit".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			appointments ap = dao.getAppointmentById(id);

			request.setAttribute("appointment", ap);

			request.getRequestDispatcher("edit-appointment.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		try {

			int patientId = Integer.parseInt(request.getParameter("patient_id"));

			int doctorId = Integer.parseInt(request.getParameter("doctor_id"));

			Date appointmentDate = Date.valueOf(request.getParameter("appointment_date"));

			String appointmentTime = request.getParameter("appointment_time");

			String status = request.getParameter("status");

			String reason = request.getParameter("reason");

			// ADD
			if ("add".equals(action)) {

				appointments ap = new appointments();

				ap.setPatient_id(patientId);
				ap.setDoctor_id(doctorId);
				ap.setAppointment_date(appointmentDate);
				ap.setAppointment_time(appointmentTime);
				ap.setStatus(status);
				ap.setReason(reason);

				dao.insert(ap);
			}

			// UPDATE
			else if ("update".equals(action)) {

				int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));

				appointments ap = new appointments();

				ap.setAppointment_id(appointmentId);
				ap.setPatient_id(patientId);
				ap.setDoctor_id(doctorId);
				ap.setAppointment_date(appointmentDate);
				ap.setAppointment_time(appointmentTime);
				ap.setStatus(status);
				ap.setReason(reason);

				dao.update(ap);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		response.sendRedirect("appointment");
	}
}