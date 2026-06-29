package modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.appointments;

public class appointmentDAO {
	  // ================= INSERT =================
    public int insert(appointments a) {

        int i = 0;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO appointments (patient_id, doctor_id, appointment_date, appointment_time, status, reason) "
              + "VALUES (?, ?, ?, ?, ?, ?)"
            );

            pst.setInt(1, a.getPatient_id());
            pst.setInt(2, a.getDoctor_id());

            // Date convert (java.util.Date -> java.sql.Date)
            pst.setDate(3, new java.sql.Date(a.getAppointment_date().getTime()));

            pst.setString(4, a.getAppointment_time());
            pst.setString(5, a.getStatus());
            pst.setString(6, a.getReason());

            i = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i;
    }
    
    // ================= UPDATE =================
    public int update(appointments a) {
    	
    	int i = 0;
    	
    	try {
    		
    		Connection con = DBUtil.makeConnection();
    		
    		PreparedStatement pst = con.prepareStatement(
    				"UPDATE appointments SET patient_id=?, doctor_id=?, appointment_date=?, appointment_time=?, status=?, reason=? "
    						+ "WHERE appointment_id=?"
    				);
    		
    		pst.setInt(1, a.getPatient_id());
    		pst.setInt(2, a.getDoctor_id());
    		pst.setDate(3, new java.sql.Date(a.getAppointment_date().getTime()));
    		pst.setString(4, a.getAppointment_time());
    		pst.setString(5, a.getStatus());
    		pst.setString(6, a.getReason());
    		pst.setInt(7, a.getAppointment_id());
    		
    		i = pst.executeUpdate();
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return i;
    }
    
    // ================= DELETE =================
    public int delete(int id) {
    	
    	int i = 0;
    	
    	try {
    		
    		Connection con = DBUtil.makeConnection();
    		
    		PreparedStatement pst = con.prepareStatement(
    				"DELETE FROM appointments WHERE appointment_id=?"
    				);
    		
    		pst.setInt(1, id);
    		
    		i = pst.executeUpdate();
    		
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    	
    	return i;
    }

    // ================= READ ALL =================
    public List<appointments> read() {

        List<appointments> list = new ArrayList<>();

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM appointments"
            );

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                appointments a = new appointments();

                a.setAppointment_id(rs.getInt("appointment_id"));
                a.setPatient_id(rs.getInt("patient_id"));
                a.setDoctor_id(rs.getInt("doctor_id"));
                a.setAppointment_date(rs.getDate("appointment_date"));
                a.setAppointment_time(rs.getString("appointment_time"));
                a.setStatus(rs.getString("status"));
                a.setReason(rs.getString("reason"));

                list.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    
    //getbyid
    public appointments getAppointmentById(int id) {

        appointments a = null;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst =
                    con.prepareStatement(
                    "SELECT * FROM appointments WHERE appointment_id=?");

            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if(rs.next()) {

                a = new appointments();

                a.setAppointment_id(rs.getInt("appointment_id"));
                a.setPatient_id(rs.getInt("patient_id"));
                a.setDoctor_id(rs.getInt("doctor_id"));
                a.setAppointment_date(rs.getDate("appointment_date"));
                a.setAppointment_time(rs.getString("appointment_time"));
                a.setStatus(rs.getString("status"));
                a.setReason(rs.getString("reason"));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return a;
    }
    
    
 // Patient Visit History Method
    public void patientVisitHistory() {
        try {
            Connection con = DBUtil.makeConnection();

            String query = "SELECT p.patient_id,p.patient_name,d.doctor_name, a.appointment_date,a.appointment_time, a.status, a.reason FROM appointments a JOIN patients p ON a.patient_id = p.patient_id JOIN doctors d ON a.doctor_id = d.doctor_id";

            PreparedStatement pst = con.prepareStatement(query);

            ResultSet rs = pst.executeQuery();

            System.out.println("\n===== Patient Visit History =====\n");

            while (rs.next()) {

                System.out.println(
                    "Patient ID : " + rs.getInt("patient_id") + " | Patient Name : " + rs.getString("patient_name") +
                    " | Doctor Name : " + rs.getString("doctor_name") +
                    " | Appointment Date : " + rs.getDate("appointment_date") +
                    " | Appointment Time : " + rs.getString("appointment_time") +
                    " | Status : " + rs.getString("status") +
                    " | Reason : " + rs.getString("reason")
                );
            }

            System.out.println();

            rs.close();
            pst.close();
            con.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    //for counting
    public int getAppointmentCount() {
        int count = 0;

        try {
            Connection con = DBUtil.makeConnection();
            String sql = "SELECT COUNT(*) FROM appointments";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

}
