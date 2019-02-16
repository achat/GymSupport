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


/**
 * @deprecated As of release 2.0, replaced by @Middleware
 */
@Deprecated
public class CreateUserFromJson {
    
    public void createUserFromJson() throws UnsupportedEncodingException
    {
        try{
            InputStream is = getClass().getResourceAsStream("/datasource/Users.jsn");
            Reader r = new InputStreamReader(is, "UTF-8");
            Gson gson = new GsonBuilder().create();
            JsonStreamParser p = new JsonStreamParser(r);

            while (p.hasNext()) {
               JsonElement e = p.next();
               if (e.isJsonObject()) {
                   User u = gson.fromJson(e, User.class);
                   UserList.getInstance().addUser(u);
               }

            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
