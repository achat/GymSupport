
import com.google.gson.Gson;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class SaveUserToJson {
    public void saveUserToJson(String username,String mail,String name,String surname,int age,String gender,int height,int weight)
    {
        try{

        User u;
            u = new User(username,mail,name,surname,age,gender,height,weight);
                       JOptionPane.showMessageDialog(null, "Account Created!", "Success", JOptionPane.INFORMATION_MESSAGE);
                       Gson gson = new Gson();
                       String json = gson.toJson(u);
                       String filename= "Users.json";
    FileWriter fw = new FileWriter(filename,true); //the true will append the new data
    fw.write(json+"\n");//appends the string to the file
    fw.close();
}catch(NumberFormatException e){
                       JOptionPane.showMessageDialog(null, "Please enter your info correctly!", "Failure", JOptionPane.INFORMATION_MESSAGE);
}      catch (FileNotFoundException ex) {      
            Logger.getLogger(CreateAccountUI.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(CreateAccountUI.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
}
