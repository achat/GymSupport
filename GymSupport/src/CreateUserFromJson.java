
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonStreamParser;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;

public class CreateUserFromJson {
    public void createUserFromJson() throws UnsupportedEncodingException
    {
        try{
        InputStream is = new FileInputStream("Users.json");
Reader r = new InputStreamReader(is, "UTF-8");
       Gson gson = new GsonBuilder().create();
       JsonStreamParser p = new JsonStreamParser(r);

       while (p.hasNext()) {
          JsonElement e = p.next();
          if (e.isJsonObject()) {
              User u = gson.fromJson(e, User.class);
          }
        
       }
}catch (FileNotFoundException e){}
    }
}
