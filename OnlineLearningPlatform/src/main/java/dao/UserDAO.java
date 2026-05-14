package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import util.DBConnection;

public class UserDAO {

	public boolean registerUser(User user) {

	    boolean status = false;

	    try {

	        Connection con = DBConnection.getConnection();


	        // Check if email already exists
	        String checkQuery =
	                "SELECT * FROM users WHERE email=?";

	        PreparedStatement checkPs =
	                con.prepareStatement(checkQuery);

	        checkPs.setString(1, user.getEmail());

	        ResultSet rs = checkPs.executeQuery();


	        // If email already exists
	        if(rs.next()) {

	            return false;
	        }


	        // Insert new user
	        String query =
	                "INSERT INTO users(fullname,email,password) VALUES(?,?,?)";

	        PreparedStatement ps =
	                con.prepareStatement(query);

	        ps.setString(1, user.getFullname());
	        ps.setString(2, user.getEmail());
	        ps.setString(3, user.getPassword());

	        int rows = ps.executeUpdate();

	        if(rows > 0) {

	            status = true;
	        }

	    } catch(Exception e) {

	        e.printStackTrace();
	    }

	    return status;
	}

    
    // Login User
    public boolean loginUser(String email, String password) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "SELECT * FROM users WHERE email=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                status = true;
            }

        } catch(Exception e){

            e.printStackTrace();
        }

        return status;
    }
    
    public String getFullNameByEmail(String email) {

        String fullname = null;

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT fullname FROM users WHERE email=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if(rs.next()) {

                fullname = rs.getString("fullname");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return fullname;
    }
    
    public void saveLoginHistory(String email) {

        try {

            Connection con = DBConnection.getConnection();

            String query =
                "INSERT INTO login_history(user_email) VALUES(?)";

            PreparedStatement ps =
                con.prepareStatement(query);

            ps.setString(1, email);

            ps.executeUpdate();

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}