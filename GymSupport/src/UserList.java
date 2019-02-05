
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
    private static ArrayList<User> userList=new ArrayList<User>();

    public static ArrayList<User> getUserList() {
        return userList;
    }
    
    
    public static void addUser(User u)
    {
        userList.add(u);
    }
     public static User find(String username, String password)
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
}
