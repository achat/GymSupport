/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package middleware;

import gym.User;

/**
 *
 * @author vasilis
 */
public interface IMiddleware {
    
    public User checkLogin(String user);
    public User saveUser(String username,String mail,String name,String surname,int age,String gender,int height,int weight,String pass);
    public User createUser();
    
}
