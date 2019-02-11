import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nikos
 */
public class UserList {
    
    private static UserList instance;
    
    private ArrayList<User> userList=new ArrayList<User>();

    public ArrayList<User> getUserList() {
        return userList;
    }
    
    private UserList() {
        
    }
    
    public static UserList getInstance() {
        if (instance == null) {
            instance = new UserList();
        }
        return instance;
    }
    
    
    public void addUser(User u)
    {
        userList.add(u);
    }
    
    
    public User find(String username, String password)
    {
        for(User u: userList)
        {
            if (u.getUsername().equals(username) && (u.getPass().equals(password)))
                    {
                       return u;
                    }
        }
        return null;
    }
    
    
    public int checkLoginUser(String username) 
    {
        for(User u: userList)
        {
            if (u.getUsername().equals(username))
                    {
                       return 1;
                    }
        }
        return 0;
    }
}
