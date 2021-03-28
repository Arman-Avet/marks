package marks;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertyManager {
	Properties properties = null;
	public static final String DB_URL = "db.url";
	public static final String DB_USER = "db.user";
	public static final String DB_PASSWORD = "db.password";
	
	public PropertyManager() {
		this.properties = new Properties();
		try (InputStream input = new FileInputStream(getWebInfPath() + "/config.properties")) {

			properties = new Properties();

            // load a properties file
			properties.load(input);

        } catch (IOException ex) {
            ex.printStackTrace();
        }
	}
	
	private String getWebInfPath() {
		final File myClass = new File(getClass().getProtectionDomain().getCodeSource().getLocation().getFile());
		return myClass.getAbsolutePath().replaceAll("%20", " ") + File.separator + ".." + File.separator;
	}
	
	
	public String getProperty(String name) {
		return this.properties.get(name).toString();
	}
}
