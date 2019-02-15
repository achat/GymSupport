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
    private String pass;
    private int fullSubscription;

    public User(String username, String mail, String name, String surname, int age, String gender, int height, int weight,String pass) {
        this.username = username;
        this.mail = mail;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.pass=pass;
    }
    
    public User(String username, String mail, String name, String surname, int age, String gender, int height, int weight,String pass, int fullSubscription) {
        this.username = username;
        this.mail = mail;
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.gender = gender;
        this.height = height;
        this.weight = weight;
        this.pass=pass;
        this.fullSubscription = fullSubscription;
    }

    public String getUsername() {
        return username;
    }
 public String getPass() {
        return pass;
    }
    public String getMail() {
        return mail;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public int getHeight() {
        return height;
    }

    public int getWeight() {
        return weight;
    }

    public int getFullSubscription() {
        return fullSubscription;
    }

    public void setFullSubscription(int fullSubscription) {
        this.fullSubscription = fullSubscription;
    }
    
}
