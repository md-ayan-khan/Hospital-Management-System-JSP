package servlets;

import java.io.IOException;
import java.util.List;

import entity.departments;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelsDAO.departmentDAO;

@WebServlet("/department")
public class DepartmentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	departmentDAO dao = new departmentDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {

			List<departments> list = dao.read();

			request.setAttribute("departments", list);

			request.getRequestDispatcher("department.jsp").forward(request, response);
		}

		else if ("delete".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			dao.delete(id);

			response.sendRedirect("department");
		}

		else if ("edit".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			departments d = dao.getDepartmentById(id);

			request.setAttribute("department", d);

			request.getRequestDispatcher("edit-department.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		String name = request.getParameter("department_name");

		String location = request.getParameter("location");

		if ("add".equals(action)) {

			departments d = new departments(name, location);

			dao.insert(d);
		}

		else if ("update".equals(action)) {

			int id = Integer.parseInt(request.getParameter("department_id"));

			departments d = new departments(id, name, location);

			dao.update(d);
		}

		response.sendRedirect("department");
	}
}