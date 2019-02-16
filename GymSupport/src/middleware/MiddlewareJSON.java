/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package middleware;

import GUI.CreateAccountUI;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonStreamParser;
import gym.User;
import gym.UserList;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author vasilis
 */
public class MiddlewareJSON implements IMiddleware {
    
    private static MiddlewareJSON instance;
    
    private MiddlewareJSON() {
        
    }
    
    public static MiddlewareJSON getInstance() {
        if (instance == null) {
            instance = new MiddlewareJSON();
        }
        return instance;
    }

    @Override
    public User checkLogin(String user) {
        User u = UserList.getInstance().checkUser(user);
        if (u != null) {
            return u;
        }
        return null;
    }

    @Override
    public User saveUser(String username,String mail,String name,String surname,int age,String gender,int height,int weight,String pass)
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
    
    @Override
    public User createUser() {
        try{
            InputStream is = getClass().getResourceAsStream("/datasource/Users.jsn");
            Reader r = new InputStreamReader(is, "UTF-8");
            Gson gson = new GsonBuilder().create();
            JsonStreamParser p = new JsonStreamParser(r);

            while (p.hasNext()) {
               JsonElement e = p.next();
               if (e.isJsonObject()) {
                   User u = gson.fromJson(e, User.class);
                   UserList.getInstance().addUser(u);
                   return u;
               }

            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
        return null;
    }
    
}
