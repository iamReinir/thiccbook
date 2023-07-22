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
public class Database {
    private final String url = "jdbc:mysql://localhost:3306";
    private final String user_name = "assign1";
    private final String password = "123456";
    private final String db_name = "thiccbooks";
    static private Connection db = null;
    static private Database database = null;
    private Database() {
        System.out.println("Connecting to the database...");
        Statement stmt = null;
        ResultSet resultset = null;
        try {
            db = DriverManager.getConnection(url, user_name, password);
            stmt = db.createStatement();
            stmt.execute("USE " + db_name);

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return;
        }
        System.out.println("Connecting succesfully");
    }

    static public Connection getDBConnection() {
        if (db == null) {
            database = new Database();
        }
        return db;
    }
}
