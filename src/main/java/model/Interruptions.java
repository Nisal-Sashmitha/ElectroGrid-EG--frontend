package model;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import utill.SQLDatabase;



public class Interruptions {
	private String interruptionID;
	private String date;
	private String startTime;
	private String endTime;
	private String areaID;
	
	
	public String newInterruption( String date, String startTime, String endTime, String areaID) {
		String output = "";
		String query = "INSERT INTO `electronicgriddb`.`interruption` (`date`, `startTIme`, `endTime`, `areaID`) VALUES (?, ?, ?, ?); ";
		
		
		try {
			//get database connection
			SQLDatabase db = new SQLDatabase();
			Connection con = db.getConnection();
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setString(1, date);
			preparedStmt.setString(2, startTime);
			preparedStmt.setString(3, endTime);
			preparedStmt.setString(4, areaID);
			
			preparedStmt.execute();
			
			con.close();
			
			String InterruptionsList = this.InterruptionsOfTheArea(areaID,date);
			output =  InterruptionsList;
			
			
		}catch(Exception e) {
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the interruption details.\"}"; 
			System.err.println(e.getMessage());
		}
		
		return output;
	}
	
	
	
	public String editInterruptions(String interruptionID, String date, String startTime, String endTime,String areaID) {
		String output = "";
		 try
		 {
			 //get database connection
			 SQLDatabase db = new SQLDatabase();
			 Connection con = db.getConnection();
			 if (con == null)
			 {return "Error while connecting to the database for updating."; }
			 
			 // create a prepared statement
			 String query = "UPDATE `electronicgriddb`.`interruption` SET `date` = ?, `startTIme` = ?, `endTime` = ?, `areaID` = ? WHERE (`interruptionID` = ?);";
			 PreparedStatement preparedStmt = con.prepareStatement(query);
			 // binding values
			 System.out.println(startTime);
			 preparedStmt.setString(1, date);
			 preparedStmt.setString(2, startTime);
			 preparedStmt.setString(3, endTime);
			 preparedStmt.setString(4, areaID);
			 preparedStmt.setString(5, interruptionID);
        	// execute the statement
			 preparedStmt.execute();
			 con.close();
			 String InterruptionsList = this.InterruptionsOfTheArea(areaID,date);
			output =  InterruptionsList;
		 }
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\":\"Error while updating the interrupitons.\"}";
			 System.err.println(e.getMessage());
		 }
		 return output; 

	}
	
	public String deleteInterruption(String interruptionID) {
		
		String output = "";
		try
		 {
			
			//get database connection
			 SQLDatabase db = new SQLDatabase();
			 Connection con = db.getConnection();
			 if (con == null)
			 {return "Error while connecting to the database for deleting."; }
			 
			 String query = "select * from `interruption` where `interruptionID`='"+interruptionID+"'";
				
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				 // execute the statement
				
				
				// iterate through the rows in the result set
				
				while (rs.next())
				{	
					interruptionID = Integer.toString(rs.getInt("interruptionID"));
					date = rs.getString("date");
					startTime = rs.getString("startTime");
					endTime = rs.getString("endTime");
					areaID = rs.getString("areaID");
				
					
					
					
				}
				
			 
			 // create a prepared statement
			 String query2 = "delete from `interruption` where `interruptionID`=?";
			 
			
			 PreparedStatement preparedStmt = con.prepareStatement(query2);
			 // binding values
			 preparedStmt.setString(1, interruptionID);
			 // execute the statement
			 preparedStmt.execute();
			 con.close();
			 String InterruptionsList = this.InterruptionsOfTheArea(areaID,date);
			output =  InterruptionsList;
		 }
		 catch (Exception e)
		 {
			 output = "{\"status\":\"error\", \"data\":\"Error while deleting the interruption.\"}";
			 System.err.println(e.getMessage());
		 }
		 return output; 
		
	}
	
	public String InterruptionsOfTheArea (String InareaID,String InDate)
	 {
		String output = "";
		try
		{
			
			//get database connection
			SQLDatabase db = new SQLDatabase();
			Connection con = db.getConnection();
			if (con == null)
			{return "Error while connecting to the database for reading."; }
			// Prepare the html table to be displayed
			output = "<table width='100%' border='1' style='margin-top:50px'/>"+
					"<tr>"+
					"<th>Interruption ID</th>"+
					"<th>Date</th>" +
					"<th>Start Time</th>" +
					"<th>End Time</th>" +
					"<th>Area ID</th>"+
					"<th>Update</th>"+
					"<th>Delete</th>"+
					"</tr>";

			String query = "select * from `interruption` where `areaID`='"+InareaID+"' and `date`='"+InDate+"'";
			
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			 // execute the statement
			
			
			// iterate through the rows in the result set
			
			while (rs.next())
			{	
				interruptionID = Integer.toString(rs.getInt("interruptionID"));
				date = rs.getString("date");
				startTime = rs.getString("startTime");
				endTime = rs.getString("endTime");
				areaID = rs.getString("areaID");
			
				
				 
				
				
				// Add into the html table
				output += "<tr><td>" + interruptionID + "</td>";
				output += "<td>" + date + "</td>";
				output += "<td>" + startTime + "</td>";
				output += "<td>" + endTime + "</td>";
				output += "<td>" + areaID + "</td>";
				
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary' data-intID='" + interruptionID + "'></td>"
	            		+ "<td><input name = 'btnRemove' type='button' value = 'Remove' "
	            		+ "class = 'btnRemove btn btn-danger' data-intID='" + interruptionID + "'>"
	            		+"</td></tr>";
			}
			con.close();
			// Complete the html table
			output += "</table>";
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while reading the interruptions details.\"}"; ;
			System.err.println(e.getMessage());
		}	
		return "{\"status\":\"success\", \"data\": \"" + 
		output + "\"}";
	 }
	
	public String viewNotifications(String InaccountNo) {
		String output = "";
		try
		{
			SQLDatabase db = new SQLDatabase();
			Connection con = db.getConnection();
			if (con == null)
			{return "Error while connecting to the database for reading."; }
			// Prepare the html table to be displayed
			
			LocalDate dateObj = LocalDate.now();
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	        String todayDate = dateObj.format(formatter);
	        

			String query = "select `areaID` from `account` where `AccNo`='"+InaccountNo+"'";
			
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next())
			{	
				
				areaID = rs.getString("areaID");
				
				query = "select * from `interruption` where `areaID`='"+areaID+"' and `date`>='"+todayDate+"'";
				System.out.println(areaID);
				output = "{ data:[";
				
				stmt = con.createStatement();
				ResultSet innerrs = stmt.executeQuery(query);
				boolean innercurrent = innerrs.next();
				while (innercurrent)
				{	
					interruptionID = Integer.toString(innerrs.getInt("interruptionID"));
					date = innerrs.getString("date");
					startTime = innerrs.getString("startTime");
					endTime = innerrs.getString("endTime");
					areaID = innerrs.getString("areaID");
					// Add into the html table
				    
					output += "{\"InterruptionID\":\""+interruptionID+"\",";
					output += "\"date\":\""+date+"\",";
					output += "\"startTime\":\""+startTime+"\",";
					output += "\"endTime\":\""+endTime+"\",";
					output += "\"areaID\":\""+areaID+"\"}";
					
					innercurrent = innerrs.next();
					if (!innercurrent) {
						continue;
					}
					output += ",";
				}
				
				// Complete the html table
				output += "]}";
				
				
			    
				
			}
			
			
			con.close();
			
		}
		catch (Exception e)
		{
			output = "Error while reading the items.";
			System.err.println(e.getMessage());
		}	
		
		//if no data found with the inputs
		if(output=="") {
			output = "{ data:[]}";
		}
		return output;
		
	}
	
	
}
