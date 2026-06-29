package servlets;

import java.io.IOException;
import java.util.List;

import entity.doctors;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelsDAO.doctorDAO;

@WebServlet("/doctor")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	doctorDAO dao = new doctorDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {

			List<doctors> list = dao.read();

			request.setAttribute("doctors", list);

			request.getRequestDispatcher("doctor.jsp").forward(request, response);
		}

		else if (action.equals("delete")) {

			int id = Integer.parseInt(request.getParameter("id"));

			dao.delete(id);

			response.sendRedirect("doctor");
		}

		else if (action.equals("edit")) {

			int id = Integer.parseInt(request.getParameter("id"));

			doctors d = dao.getDoctorById(id);

			request.setAttribute("doctor", d);

			request.getRequestDispatcher("edit-doctor.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		String name = request.getParameter("doctor_name");
		String specialization = request.getParameter("specialization");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		int departmentId = Integer.parseInt(request.getParameter("department_id"));

		if (action.equals("add")) {

			doctors d = new doctors(name, specialization, phone, email, departmentId);

			dao.insert(d);
		}

		else if (action.equals("update")) {

			int id = Integer.parseInt(request.getParameter("doctor_id"));

			doctors d = new doctors(id, name, specialization, phone, email, departmentId);

			dao.update(d);
		}

		response.sendRedirect("doctor");
	}

}
