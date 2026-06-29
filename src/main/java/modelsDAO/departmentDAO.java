package modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.departments;

public class departmentDAO {
	// ================= INSERT =================
	public int insert(departments d) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con
					.prepareStatement("INSERT INTO departments(department_name, location) VALUES (?, ?)");

			pst.setString(1, d.getDepartment_name());
			pst.setString(2, d.getLocation());

			i = pst.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return i;
	}

	// ================= UPDATE =================
	public int update(departments d) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con
					.prepareStatement("UPDATE departments SET department_name=?, location=? WHERE department_id=?");

			pst.setString(1, d.getDepartment_name());
			pst.setString(2, d.getLocation());
			pst.setInt(3, d.getDepartment_id());

			i = pst.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return i;
	}

	// ================= DELETE =================
	public int delete(int departmentId) {

		int i = 0;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("DELETE FROM departments WHERE department_id=?");

			pst.setInt(1, departmentId);

			i = pst.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return i;
	}

	// ================= READ ALL =================
	public List<departments> read() {

		List<departments> list = new ArrayList<>();

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("SELECT * FROM departments");

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				departments d = new departments();

				d.setDepartment_id(rs.getInt("department_id"));
				d.setDepartment_name(rs.getString("department_name"));
				d.setLocation(rs.getString("location"));

				list.add(d);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return list;
	}

	public departments getDepartmentById(int id) {

		departments d = null;

		try {

			Connection con = DBUtil.makeConnection();

			PreparedStatement pst = con.prepareStatement("SELECT * FROM departments WHERE department_id=?");

			pst.setInt(1, id);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {

				d = new departments();

				d.setDepartment_id(rs.getInt("department_id"));

				d.setDepartment_name(rs.getString("department_name"));

				d.setLocation(rs.getString("location"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return d;
	}

}
