
import java.sql.ResultSet;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vasilis
 */
public class Middleware {
    
    private static Middleware instance;
    
    private Middleware() {
        
    }
    
    public static Middleware getInstance() {
        if (instance == null) {
            instance = new Middleware();
        }
        return instance;
    }
    
    public User checkLoginJSON(String user) {
        User u = UserList.getInstance().checkUser(user);
        if (u != null) {
            return u;
        }
        return null;
    }
    
    public User checkLoginDB(String user, String pass) {
        try {
            ResultSet rs = PGClass.getInstance().executeSelectQuery("Select * from gym_user where username = '" + user + "'");
            if (rs.next()) {
                User u = new User(
                        rs.getNString("username"),
                        rs.getNString("mail"),
                        rs.getNString("name"),
                        rs.getNString("surname"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getInt("height"),
                        rs.getInt("weight"),
                        rs.getNString("password")
                );
                if (u.getPass().equals(pass)) {
                    return u;
                }
            }
        } catch (Exception ex) {
            return null;
        }
        return null;
    }
    
    
    
}
