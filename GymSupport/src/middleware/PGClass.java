package middleware;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vasilis
 */
public class PGClass {
    
    private static PGClass instance;
    
    private final String url = "jdbc:postgresql://localhost/gym_support";
    private final String user = "postgres";
    private final String password = "sys";
    
    private Connection conn;
    
    private PGClass() {
        conn = connect();
    }
    
    public static PGClass getInstance() {
        if (instance == null){
            instance = new PGClass();
        }
        return instance;
    }
    
    public Connection connect() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
 
        return conn;
    }
    
    public Connection getConnection() {
        return this.conn;
    }
    
    public ResultSet executeSelectQuery(String q) {
        ResultSet rs;
        try {
            Statement stmt = conn.createStatement();
            rs = stmt.executeQuery(q);
        } catch (Exception ex) {
            return null;
        }
        return rs;            
    }
    
    public int executeUpdateQuery(String q) {
        try {
            PreparedStatement pstmt = conn.prepareStatement(q);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected;
        } catch (Exception ex) {
            return -1;
        }
    }
}
