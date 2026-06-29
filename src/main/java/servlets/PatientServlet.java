package servlets;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import entity.TimeLine;
import entity.patients;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelsDAO.PatientDAO;
import modelsDAO.TimeLineDAO;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PatientDAO dao = new PatientDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ------- DEFAULT: Show all patients -------
        if (action == null) {
            List<patients> list = dao.read();
            request.setAttribute("patients", list);
            request.getRequestDispatcher("patient.jsp").forward(request, response);
        }

        //------- SEARCH by name --------
        else if ("search".equals(action)) {
            String query = request.getParameter("q");

            List<patients> allList = dao.read();
            List<patients> filtered;

            if (query != null && !query.trim().isEmpty()) {
                String lowerQuery = query.trim().toLowerCase();
                // Server-side filter — name contains search term (case-insensitive)
                filtered = allList.stream()
                        .filter(p -> p.getName() != null &&
                                     p.getName().toLowerCase().contains(lowerQuery))
                        .collect(Collectors.toList());
                request.setAttribute("searchQuery", query.trim());
            } else {
                filtered = allList;
            }

            request.setAttribute("patients", filtered);
            request.getRequestDispatcher("patient.jsp").forward(request, response);
        }

        // ------- DELETE patient -------
        else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.delete(id);
            response.sendRedirect("patient");
        }

        // ------- EDIT: Show edit form -------
        else if ("edit".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            patients p = dao.getPatientById(id);
            request.setAttribute("patient", p);
            request.getRequestDispatcher("edit-patient.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        // ------- SEARCH via POST (optional) -------
        // Agar form POST se search karo to yeh handle karta hai
        if ("search".equals(action)) {
            String query = request.getParameter("q");
            response.sendRedirect("patient?action=search&q=" +
                    java.net.URLEncoder.encode(query != null ? query : "", "UTF-8"));
            return;
        }

        // Common fields (ADD aur UPDATE dono ke liye)
        String name    = request.getParameter("name");
        String gender  = request.getParameter("gender");
        int    age     = Integer.parseInt(request.getParameter("age"));
        String phone   = request.getParameter("phone");
        String address = request.getParameter("address");
        String blood   = request.getParameter("blood");

        // ------- ADD PATIENT -------
        if ("add".equals(action)) {
            patients p = new patients(name, gender, age, phone, address, blood);
            int patientId = dao.insertAndReturnId(p);

            if (patientId > 0) {
                TimeLine t = new TimeLine();
                t.setPatientId(patientId);
                t.setEventType("PATIENT");
                t.setTitle("New Patient Registered");
                t.setDescription(name + " registered successfully");
                t.setEventDate(java.time.LocalDateTime.now().toString());
                new TimeLineDAO().addActivity(t);
            }
        }

        // ------- UPDATE PATIENT -------
        else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            patients p = new patients(id, name, gender, age, phone, address, blood);
            int result = dao.update(p);

            if (result > 0) {
                TimeLine t = new TimeLine();
                t.setPatientId(id);
                t.setEventType("PATIENT");
                t.setTitle("Patient Updated");
                t.setDescription(name + " details updated");
                t.setEventDate(java.time.LocalDateTime.now().toString());
                new TimeLineDAO().addActivity(t);
            }
        }

        response.sendRedirect("dashboard");
    }
}
