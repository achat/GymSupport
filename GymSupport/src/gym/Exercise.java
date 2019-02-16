package gym;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nikos
 */
public class Exercise {
     private int id; 
     private String code;
    private String name;
    private String descr;
    private String comments;

    public Exercise(int id, String code, String name, String descr,String comments) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.descr = descr;
        this.comments=comments;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String getDescr() {
        return descr;
    }
    public String getComments() {
        return comments;
    }
}
