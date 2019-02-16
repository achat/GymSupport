package middleware;


import gym.User;
import gym.UserList;
import gym.Trainer;
import GUI.CreateAccountUI;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonStreamParser;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class MiddlewarePostgreSQL implements IMiddleware {
    
    private static MiddlewarePostgreSQL instance;
    
    private Map<String, String> expertise = new HashMap<>();
    private Map<String, Trainer> trainers = new HashMap<>();
    private Map<String, String> workout = new HashMap<>();
    private Map<String, String> exercise = new HashMap<>();
    
    private MiddlewarePostgreSQL() {
        
    }
    
    public static MiddlewarePostgreSQL getInstance() {
        if (instance == null) {
            instance = new MiddlewarePostgreSQL();
        }
        return instance;
    }
    
    
    @Override
    public User saveUser(String username,String mail,String name,String surname,int age,String gender,int height,int weight,String pass)
    {
        User u = null;
        try{
            u = new User(username,mail,name,surname,age,gender,height,weight,pass);
            JOptionPane.showMessageDialog(null, "Account Created!", "Success", JOptionPane.INFORMATION_MESSAGE);
            PGClass.getInstance().executeUpdateQuery("INSERT INTO gym_user (username, password, email, fname, surname, gender, age, weight, height)"
                    + " values('" + username + "', '" + pass + "', '" + mail + "', '" + name + "', '" + surname + "', '" + gender + "', " + age + ", " + weight + ", " + height + ")");
            UserList.getInstance().addUser(u);
        }catch(NumberFormatException e){
            JOptionPane.showMessageDialog(null, "Please enter your info correctly!", "Failure", JOptionPane.INFORMATION_MESSAGE);
        }catch (Exception ex) {      
            Logger.getLogger(CreateAccountUI.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
        }
        
        return u;
    }
    
    @Override
    public User checkLogin(String user) {
        try {
            ResultSet rs = PGClass.getInstance().executeSelectQuery("Select * from gym_user where username = '" + user + "'");
            if (rs.next()) {
                User u = new User(
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("fname"),
                        rs.getString("surname"),
                        rs.getInt("age"),
                        rs.getString("gender"),
                        rs.getInt("height"),
                        rs.getInt("weight"),
                        rs.getString("password"),
                        rs.getInt("full_subscription")
                );
                return u;
            }
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            return null;
        }
        return null;
    }
    
    public void setupLists() {
        ResultSet rs;
        try {
        rs = PGClass.getInstance().executeSelectQuery("Select expertise_code, workout_type from expertise");
        while (rs.next()){
            expertise.put(rs.getString("expertise_code"), rs.getString("workout_type"));
        }
        
        rs = PGClass.getInstance().executeSelectQuery("Select trainer_code, tname, gender, profile from trainers");
        while (rs.next()){
            Trainer tr = new Trainer(rs.getString("trainer_code"), rs.getString("tname"), rs.getString("gender"), rs.getString("profile"));
            trainers.put(rs.getString("trainer_code"), tr);
        }
        
        rs = PGClass.getInstance().executeSelectQuery("Select workout_code, wname from workout");
        while (rs.next()){
            workout.put(rs.getString("workout_code"), rs.getString("wname"));
        }
        
        rs = PGClass.getInstance().executeSelectQuery("Select exercise_code, ename from exercise");
        while (rs.next()){
            exercise.put(rs.getString("exercise_code"), rs.getString("ename"));
        }
        
        System.out.println("DB Lists loaded successfully!");
        
        } catch(Exception ex) {
            System.out.println(ex.getMessage());
            System.out.println("DB Failure!");
        }
    }

    public Map<String, String> getExpertise() {
        return expertise;
    }

    public Map<String, Trainer> getTrainers() {
        return trainers;
    }
    
    public Map<String, String> getWorkout() {
        return workout;
    }

    public Map<String, String> getExercise() {
        return exercise;
    }

    @Override
    public User createUser() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    
}
