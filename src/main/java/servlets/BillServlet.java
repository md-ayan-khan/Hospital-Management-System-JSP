package servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import entity.bills;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelsDAO.billsDAO;

@WebServlet("/bill")
public class BillServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	billsDAO dao = new billsDAO();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {

			List<bills> list = dao.read();

			request.setAttribute("bills", list);

			request.getRequestDispatcher("bill.jsp").forward(request, response);
		}

		else if ("delete".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			dao.delete(id);

			response.sendRedirect("bill");
		}

		else if ("edit".equals(action)) {

			int id = Integer.parseInt(request.getParameter("id"));

			bills b = dao.getBillById(id);

			request.setAttribute("bill", b);

			request.getRequestDispatcher("edit-bill.jsp").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		int patientId = Integer.parseInt(request.getParameter("patient_id"));

		int appointmentId = Integer.parseInt(request.getParameter("appointment_id"));

		double totalAmount = Double.parseDouble(request.getParameter("total_amount"));

		String paymentStatus = request.getParameter("payment_status");

		Date billDate = Date.valueOf(request.getParameter("bill_date"));

		if ("add".equals(action)) {

			bills b = new bills();

			b.setPatient_id(patientId);
			b.setAppointment_id(appointmentId);
			b.setTotal_amount(totalAmount);
			b.setPayment_status(paymentStatus);
			b.setBill_date(billDate);

			dao.insert(b);
		}

		else if ("update".equals(action)) {

			int billId = Integer.parseInt(request.getParameter("bill_id"));

			bills b = new bills();

			b.setBill_id(billId);
			b.setPatient_id(patientId);
			b.setAppointment_id(appointmentId);
			b.setTotal_amount(totalAmount);
			b.setPayment_status(paymentStatus);
			b.setBill_date(billDate);

			dao.update(b);
		}

		response.sendRedirect("bill");
	}
} 