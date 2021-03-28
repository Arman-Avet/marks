package marks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;
import java.util.UUID;
import java.util.HashMap;


public class MarksBean {
	
	User currentUser = null;
	String dbUrl = null;
	String dbUser = null;
	String dbPassword = null;
	
	public MarksBean() {
		PropertyManager pm = new PropertyManager();
		this.dbUrl = "jdbc:mysql://"+pm.getProperty(PropertyManager.DB_URL);
		this.dbUser = pm.getProperty(PropertyManager.DB_USER);
		this.dbPassword = pm.getProperty(PropertyManager.DB_PASSWORD);
	}
	
	public User getCurrentUser() {
		return this.currentUser;
	}
	
	public boolean login(String username, String password) {
		currentUser = null;
		boolean ok = false;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
			dbUrl,dbUser,dbPassword);
			Statement stmt=con.createStatement();
			password = encrypt(password);
			String sql = "Select user_id, name from users where user_name='" + username +"' and pwd='"+password+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				this.currentUser = new User(name, id);
				ok = true;
			}
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return ok;
	}
	
	public boolean register(String username, String password, String name, String email) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					dbUrl,dbUser,dbPassword);
			Statement stmt=con.createStatement();
			String sql = "Select user_id from users where user_name='" + username+"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next()) {
				return false;
			}
			password = encrypt(password);
			sql = "INSERT INTO users (user_name, pwd, name, email)\r\n" + 
					"VALUES ('"+username+"', '"+password+"', '"+name+"', '"+email+"')";
			stmt.executeUpdate(sql);
			
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	  public static String encrypt(String x) throws Exception
	  {
	     java.security.MessageDigest d =null;
	     d = java.security.MessageDigest.getInstance("SHA-1");
	     d.reset();
	     d.update(x.getBytes());
	     byte[] b = d.digest();
	     StringBuffer sb = new StringBuffer(b.length * 2);
	     for (int i = 0; i < b.length; i++){
	       int v = b[i] & 0xff;
	       if (v < 16) {
	         sb.append('0');
	       }
	       sb.append(Integer.toHexString(v));
	     }
	     return sb.toString().toUpperCase();
	  }
	
	public void insertFunc(String subj, String semester, String value, String semestrial, String mark, String comment) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(
				dbUrl,dbUser,dbPassword);
		Statement stmt=con.createStatement();
		int semInt = 0;
		if(semestrial!=null) {
			semInt = 1;
		}
		comment.replace("'","");
		String sql = "INSERT INTO marks (user_id, disciplin_id, semester, multiplier, semestrial, mark, comment)\r\n" + 
				"VALUES ("+currentUser.getId()+",'"+subj+"' , "+semester+", "+value+", "+semInt+", "+mark+", '"+comment+"')";
		stmt.executeUpdate(sql);
		con.close();
	}
	public void removeFunc(String id) throws SQLException, ClassNotFoundException {
		if(id!= null) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					dbUrl,dbUser,dbPassword);
			Statement stmt=con.createStatement();
			String sql = "Delete from marks \r\n" + 
					"Where id = "+id;
			stmt.executeUpdate(sql);
			con.close();
		}
	}
	public void editFunc(String id, String subj, String semester, String ratio, String semestrial, String mark, String comment) throws SQLException, ClassNotFoundException {
		if(id!= null) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					dbUrl,dbUser,dbPassword);
			Statement stmt=con.createStatement();
			int semInt = 0;
			if(semestrial!=null) {
				semInt = 1;
			}
			comment.replace("'","");
			String sql = "UPDATE marks SET disciplin_id = '" + subj + "', semester = " + semester + ", multiplier = " + ratio + ", semestrial = " + semInt + ", "
					+ "mark = " + mark + ", comment = '" + comment + "' WHERE id ="+id;
			stmt.executeUpdate(sql);
			con.close();
		}
	}
	public ArrayList<ArrayList<String>> getMarksForUser(){
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		ArrayList<String> row = new ArrayList<String>();
		//row.add("");
		row.add("subject");
		row.add("semester");
		row.add("multiplier");
		row.add("semetrial");
		row.add("mark");
		row.add("comment");
		result.add(row);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					dbUrl,dbUser,dbPassword);
			//here sonoo is database name, root is username and password
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select id, disciplin_id, semester, multiplier, semestrial, mark, comment from marks where user_id = "+currentUser.getId()+" order by id");
			while(rs.next()) {
				row = new ArrayList<String>();
				row.add(rs.getString(1));
				row.add(rs.getString(2));
				row.add(rs.getString(3));
				row.add(rs.getString(4));
				row.add(rs.getString(5));
				row.add(rs.getString(6));
				row.add(rs.getString(7));
				result.add(row);
				
			}
			con.close();
		}
		
		catch(Exception e){ System.out.println(e);}
		return result;
	}
	private ArrayList<String> removeTheElement(ArrayList<String> row, int i) {
		// TODO Auto-generated method stub
		return null;
	}
	public Collection<Disciplin> getDisciplins(){
		Collection<Disciplin> result = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					dbUrl,dbUser,dbPassword);
			//here sonoo is database name, root is username and password
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select disciplin_id, semester, multiplier, semestrial, mark from marks where user_id = "+currentUser.getId()+" order by id");
			TreeMap<String, Disciplin> disciplinMap = new TreeMap<String, Disciplin>();
			while(rs.next()) {
				String disciplinName = rs.getString(1).toLowerCase();
				int semester = rs.getInt(2);
				float ratio = rs.getFloat(3);
				boolean isSemestrial = rs.getBoolean(4);
				float value = rs.getFloat(5);
				
				Disciplin ds = disciplinMap.get(disciplinName);
				if(ds == null) {
					ds = new Disciplin(disciplinName);
					disciplinMap.put(disciplinName, ds);
				}
				ds.addMark(value, ratio, semester, isSemestrial);
			}
			con.close();
			
			result = disciplinMap.values();
			
		}
		
		catch(Exception e){ System.out.println(e);}
		
		return result;
	}
	
}
	
