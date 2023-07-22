/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dataAccessClasses;

import java.sql.*;

/**
 *
 * @author Giga P34
 */
public class Users {
    Connection db;
    static private Users users = null;
    private Users() {
        db = Database.getDBConnection();
    }

    static public Users getUsers() {
        if (users == null) {
            users = new Users();
        }
        return users;
    }
    private String getPassword(String username) {
        try {
            String qry = "SELECT * from users WHERE username = ?";
            PreparedStatement stmt = db.prepareStatement(qry);
            stmt.setString(1, username);
            stmt.execute();
            ResultSet rs = stmt.getResultSet();
            if (rs == null) {
                return null;
            }
            rs.next();
            String res = rs.getString("password");
            return res;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
    }
    public boolean validate(String username, String password) {
        try {
            String pss = getPassword(username);
            if (pss == null) {
                return false;
            }
            return pss.equals(password);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }

    public boolean signUp(String username, String email, String password) {
        if (username.isEmpty() || email.isEmpty() || password.isEmpty()) {
            return false;
        }
        if (getPassword(username) != null) {
            return false;
        }
        try {
            String qry = "INSERT INTO users (username,password,email) "
                    + "VALUES (?,?,?)";
            PreparedStatement stmt = db.prepareStatement(qry);
            stmt.setString(1, username);
            stmt.setString(2, password);
            stmt.setString(3, email);
            stmt.execute();
            return true;
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return false;
        }
    }
}
