/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nikos
 */
public class User {
    private String username;
    private String mail;
    private String name;
    private String surname;
    private int age;
    private String gender;
    private int height;
    private int weight;

    public User(String username, String mail, String name, String surname, int age, String gender, int height, int weight) {
        this.username = username;
        this.mail = mail;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
    }
    
    
}
