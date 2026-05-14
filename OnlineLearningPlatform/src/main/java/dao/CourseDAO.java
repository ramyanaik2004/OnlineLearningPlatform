package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Course;
import util.DBConnection;

public class CourseDAO {

    // Get All Courses
    public List<Course> getAllCourses(){

        List<Course> courseList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String query = "SELECT * FROM courses";

            PreparedStatement ps = con.prepareStatement(query);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Course course = new Course();

                course.setId(rs.getInt("id"));
                course.setTitle(rs.getString("title"));
                course.setDescription(rs.getString("description"));
                course.setDuration(rs.getString("duration"));
                course.setVideoLink(rs.getString("videoLink"));
                courseList.add(course);
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return courseList;
    }


    // Get Course By ID
    public Course getCourseById(int id){

        Course course = null;

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "SELECT * FROM courses WHERE id=?";

            PreparedStatement ps =
                con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                course = new Course();

                course.setId(rs.getInt("id"));
                course.setTitle(rs.getString("title"));
                course.setDescription(rs.getString("description"));
                course.setDuration(rs.getString("duration"));
                course.setVideoLink(rs.getString("videoLink"));
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return course;
    }
}