package middleware;

import gym.UserList;
import gym.User;
import GUI.CreateAccountUI;
import com.google.gson.Gson;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


/**
 * @deprecated As of release 2.0, replaced by @Middleware
 */
@Deprecated
public class SaveUserToJson {
    
    public User saveUserToJson(String username,String mail,String name,String surname,int age,String gender,int height,int weight,String pass)
    {
        User u = null;
        try{
            u = new User(username,mail,name,surname,age,gender,height,weight,pass);
            JOptionPane.showMessageDialog(null, "Account Created!", "Success", JOptionPane.INFORMATION_MESSAGE);
            Gson gson = new Gson();
            String json = gson.toJson(u);
            String filename= getClass().getResource("/datasource/Users.jsn").getPath();
            FileWriter fw = new FileWriter(filename,true); //the true will append the new data
            fw.write(json+"\n");//appends the string to the file
            fw.close();
            UserList.getInstance().addUser(u);
        }catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null, "Please enter your info correctly!", "Failure", JOptionPane.INFORMATION_MESSAGE);
        }catch (FileNotFoundException ex) {      
            Logger.getLogger(CreateAccountUI.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }catch (IOException ex) {
            Logger.getLogger(CreateAccountUI.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }
        
        return u;
    }
}
