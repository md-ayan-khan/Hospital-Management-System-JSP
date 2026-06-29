package modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.TimeLine;

public class TimeLineDAO {

	private Connection con;

	public TimeLineDAO() {
		try {
			con = DBUtil.makeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// INSERT ACTIVITY
	public boolean addActivity(TimeLine t) {

		boolean status = false;

		try {

			String sql = "INSERT INTO activity_timeline " + "(patient_id,event_type,title,description,event_date) "
					+ "VALUES(?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, t.getPatientId());
			ps.setString(2, t.getEventType());
			ps.setString(3, t.getTitle());
			ps.setString(4, t.getDescription());
			ps.setString(5, t.getEventDate());

			int i = ps.executeUpdate();

			if (i > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// ALL ACTIVITIES
	public List<TimeLine> getAllActivities() {

		List<TimeLine> list = new ArrayList<>();

		try {

			String sql = "SELECT * FROM activity_timeline " + "ORDER BY event_date DESC";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				TimeLine t = new TimeLine();

				t.setTimelineId(rs.getInt("timeline_id"));
				t.setPatientId(rs.getInt("patient_id"));
				t.setEventType(rs.getString("event_type"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setReferenceId(rs.getInt("reference_id"));
				t.setDoctorId(rs.getInt("doctor_id"));
				t.setEventDate(rs.getString("event_date"));

				list.add(t);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// RECENT 5 ACTIVITIES
	public List<TimeLine> getRecentActivities() {

		List<TimeLine> list = new ArrayList<>();

		try {

			String sql = "SELECT * FROM activity_timeline " + "ORDER BY event_date DESC LIMIT 5";

			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				TimeLine t = new TimeLine();

				t.setTimelineId(rs.getInt("timeline_id"));
				t.setPatientId(rs.getInt("patient_id"));
				t.setEventType(rs.getString("event_type"));
				t.setTitle(rs.getString("title"));
				t.setDescription(rs.getString("description"));
				t.setReferenceId(rs.getInt("reference_id"));
				t.setDoctorId(rs.getInt("doctor_id"));
				t.setEventDate(rs.getString("event_date"));

				list.add(t);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// DELETE ACTIVITY
	public boolean deleteActivity(int timelineId) {

		boolean status = false;

		try {

			String sql = "DELETE FROM activity_timeline WHERE timeline_id=?";
			
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, timelineId);

			int i = ps.executeUpdate();

			if (i > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
}