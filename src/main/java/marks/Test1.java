package marks;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Test1 {
	public static void main(String[] args) {
		System.out.println("sss");
	}
	public void insertFunc(String subj, String semester, String value, String semestrial, String mark, String comment) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/tt","root","1111");
		Statement stmt=con.createStatement();
		String sql = "INSERT INTO marks (user_id, disciplin_id, semester, multiplier, semestriel, mark, comment, mark_order)\r\n" + 
				"VALUES (1,'"+subj+"' , "+semester+", "+value+", "+semestrial+", "+mark+", '"+comment+"', 10)";
		stmt.executeUpdate(sql);
		con.close();
	}
	public ArrayList<ArrayList<String>> getAll(){
		ArrayList<ArrayList<String>> result = new ArrayList<ArrayList<String>>();
		ArrayList<String> row = new ArrayList<String>();
		//row.add("");
		row.add("subject");
		row.add("semester");
		row.add("value");
		row.add("semetrial");
		row.add("mark");
		row.add("comment");
		row.add("order");
		result.add(row);
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/tt","root","1111");
			//here sonoo is database name, root is username and password
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select * from marks where user_id = 1 order by mark_order");
			while(rs.next()) {
				row = new ArrayList<String>();
				//row.add(rs.getString(1));
				row.add(rs.getString(2));
				row.add(rs.getString(3));
				row.add(rs.getString(4));
				row.add(rs.getString(5));
				row.add(rs.getString(6));
				row.add(rs.getString(7));
				row.add(rs.getString(8));
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
	
}
