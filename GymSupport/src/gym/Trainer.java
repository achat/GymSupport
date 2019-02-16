package gym;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author vasilis
 */
public class Trainer {
    
    private String code; 
    private String name;
    private String gender;
    private String profile;
    
    public Trainer(String code, String name, String gender, String profile) {
        this.code = code;
        this.name = name;
        this.gender = gender;
        this.profile = profile;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getProfile() {
        return profile;
    }  
    
}
