package modelsDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import entity.patients;

public class PatientDAO {
	 // ================= READ (ALL) =================
    public List<patients> read() {

        List<patients> list = new LinkedList<>();

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "SELECT * FROM patients"
            );

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                list.add(new patients(
                    rs.getInt("patient_id"),
                    rs.getString("patient_name"),
                    rs.getString("gender"),
                    rs.getInt("age"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("blood_group")
                ));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= INSERT =================
    public int insert(patients st) {

        int i = 0;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO patients(patient_name, gender, age, phone, address, blood_group) "
              + "VALUES (?, ?, ?, ?, ?, ?)"
            );

            pst.setString(1, st.getName());
            pst.setString(2, st.getGender());
            pst.setInt(3, st.getAge());
            pst.setString(4, st.getPhone());
            pst.setString(5, st.getAddress());
            pst.setString(6, st.getBlood_group());

            i = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i;
    }
    
    //new
    public int insertAndReturnId(patients st) {

        int patientId = 0;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "INSERT INTO patients(patient_name, gender, age, phone, address, blood_group) VALUES(?,?,?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );

            pst.setString(1, st.getName());
            pst.setString(2, st.getGender());
            pst.setInt(3, st.getAge());
            pst.setString(4, st.getPhone());
            pst.setString(5, st.getAddress());
            pst.setString(6, st.getBlood_group());

            int result = pst.executeUpdate();

            if (result > 0) {

                ResultSet rs = pst.getGeneratedKeys();

                if (rs.next()) {
                    patientId = rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return patientId;
    }

    // ================= UPDATE =================
    public int update(patients st) {

        int i = 0;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "UPDATE patients SET patient_name=?, gender=?, age=?, phone=?, address=?, blood_group=? "
              + "WHERE patient_id=?"
            );

            pst.setString(1, st.getName());
            pst.setString(2, st.getGender());
            pst.setInt(3, st.getAge());
            pst.setString(4, st.getPhone());
            pst.setString(5, st.getAddress());
            pst.setString(6, st.getBlood_group());
            pst.setInt(7, st.getId());

            i = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i;
    }
    
    public patients getPatientById(int id) {

        patients p = null;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst =
            con.prepareStatement(
            "SELECT * FROM patients WHERE patient_id=?");

            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if(rs.next()) {

                p = new patients(
                    rs.getInt("patient_id"),
                    rs.getString("patient_name"),
                    rs.getString("gender"),
                    rs.getInt("age"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("blood_group")
                );
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return p;
    }

    // ================= DELETE =================
    public int delete(int id) {

        int i = 0;

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst = con.prepareStatement(
                "DELETE FROM patients WHERE patient_id = ?"
            );

            pst.setInt(1, id);

            i = pst.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return i;
    }
    
    //search
    public List<patients> searchByName(String keyword){

        List<patients> list = new LinkedList<>();

        try {

            Connection con = DBUtil.makeConnection();

            PreparedStatement pst =
            con.prepareStatement(
            "SELECT * FROM patients WHERE patient_name LIKE ?");

            pst.setString(1,"%"+keyword+"%");

            ResultSet rs = pst.executeQuery();

            while(rs.next()) {

                list.add(new patients(
                    rs.getInt("patient_id"),
                    rs.getString("patient_name"),
                    rs.getString("gender"),
                    rs.getInt("age"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getString("blood_group")
                ));
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //for counting
    public int getPatientCount() {
        int count = 0;

        try {
            Connection con = DBUtil.makeConnection();
            String sql = "SELECT COUNT(*) FROM patients";
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
