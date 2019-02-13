import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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
    
    private PGClass() {
        
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
}
