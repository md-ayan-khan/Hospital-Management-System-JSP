package modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.TimeLine;
import entity.WorkloadReport;
import entity.doctors;

public class doctorDAO {
	// ================= INSERT =================
	public int insert(doctors d) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO doctors(doctor_name, specialization, phone, email, department_id) VALUES (?, ?, ?, ?, ?)");

			pst.setString(1, d.getDoctor_name());
			pst.setString(2, d.getSpecialization());
			pst.setString(3, d.getPhone());
			pst.setString(4, d.getEmail());
			pst.setInt(5, d.getDepartment_id());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	// ================= UPDATE =================
	public int update(doctors d) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement(
					"UPDATE doctors SET doctor_name=?, specialization=?, phone=?, email=?, department_id=? WHERE doctor_id=?");

			pst.setString(1, d.getDoctor_name());
			pst.setString(2, d.getSpecialization());
			pst.setString(3, d.getPhone());
			pst.setString(4, d.getEmail());
			pst.setInt(5, d.getDepartment_id());
			pst.setInt(6, d.getDoctor_id());

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public doctors getDoctorById(int id) {

		doctors d = null;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("SELECT * FROM doctors WHERE doctor_id=?");

			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				d = new doctors();

				d.setDoctor_id(rs.getInt("doctor_id"));
				d.setDoctor_name(rs.getString("doctor_name"));
				d.setSpecialization(rs.getString("specialization"));
				d.setPhone(rs.getString("phone"));
				d.setEmail(rs.getString("email"));
				d.setDepartment_id(rs.getInt("department_id"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

	// ================= DELETE =================
	public int delete(int id) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("DELETE FROM doctors WHERE doctor_id=?");

			pst.setInt(1, id);

			i = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	// ================= READ ALL =================
	public List<doctors> read() {

		List<doctors> list = new ArrayList<>();

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("SELECT * FROM doctors");

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				doctors d = new doctors();

				d.setDoctor_id(rs.getInt("doctor_id"));
				d.setDoctor_name(rs.getString("doctor_name"));
				d.setSpecialization(rs.getString("specialization"));
				d.setPhone(rs.getString("phone"));
				d.setEmail(rs.getString("email"));
				d.setDepartment_id(rs.getInt("department_id"));

				list.add(d);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	// doctor workload report ,for dynamic page
	public List<WorkloadReport> getDoctorWorkloadReport() {

		List<WorkloadReport> list = new ArrayList<>();

		try {

			Connection con = DBUtil.makeConnection();

			String sql = "SELECT " + "dep.department_name, " + "COUNT(DISTINCT d.doctor_id) AS total_doctors, "
					+ "COUNT(a.appointment_id) AS total_patients " + "FROM departments dep "
					+ "LEFT JOIN doctors d ON dep.department_id = d.department_id "
					+ "LEFT JOIN appointments a ON d.doctor_id = a.doctor_id "
					+ "GROUP BY dep.department_id, dep.department_name";

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				WorkloadReport w = new WorkloadReport();

				w.setDepartmentName(rs.getString("department_name"));
				w.setTotalDoctors(rs.getInt("total_doctors"));
				w.setTotalPatients(rs.getInt("total_patients"));

				list.add(w);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	  //for countin
	public int getDoctorCount() {
	    int count = 0;

	    try {
	        Connection con = DBUtil.makeConnection();
	        String sql = "SELECT COUNT(*) FROM doctors";
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
