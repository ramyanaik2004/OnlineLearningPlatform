package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class EnrollmentDAO {

    public void enrollCourse(
            String email,
            int courseId,
            String courseName
    ) {

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "INSERT INTO enrollments(user_email, course_id, course_name) VALUES(?,?,?)";

            PreparedStatement ps =
                con.prepareStatement(query);

            ps.setString(1, email);
            ps.setInt(2, courseId);
            ps.setString(3, courseName);

            ps.executeUpdate();

        } catch(Exception e){

            e.printStackTrace();
        }
    }
    
    public int getEnrollmentCount(int courseId){

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "SELECT COUNT(*) FROM enrollments WHERE course_id=?";

            PreparedStatement ps =
                con.prepareStatement(query);

            ps.setInt(1, courseId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                count = rs.getInt(1);
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return count;
    }
}