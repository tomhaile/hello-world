<%@ page language = "java" %>
<%@ page import = "java.util.*, java.sql.*, java.math.*" %>

<!------------------------------------------------------------------------------->
<!--                                                                           -->
<!--   Author :                Date:                                          -->
<!--                                                                           -->
<!--                                                                           -->
<!--   CHANGES:                                                                -->
<!--                                                                           -->
<!--      Date       Name          Comments                                    -->
<!--   --------     ------         --------                                    -->
<!--                                                                           -->
<!------------------------------------------------------------------------------->
<%
//**************************************************************************//
 //********** This code has to be on every JSP (First Code)  *********//
  //****  for the headings and such to work ***//

   request.setAttribute("title","");
   String parameterList = "&returnToPage=/web/TreeNetInq";
   request.setAttribute("parameterList", parameterList);
   request.setAttribute("newAddWindow", "location.href=newPage1");
   request.setAttribute("hitResult", "");
   request.setAttribute("extraOptions", "");

//**************************************************************************//
%>
<%!
//******************************************************************************
//   Define Variables
//******************************************************************************
   Connection conn = null;
   String x = "A";
   String sys = ("lawson.treetop.com"); 
   String userProfile = ("DAUSER");
   String password = ("WEB230502");
   String driver = "com.ibm.as400.access.AS400JDBCDriver";
%>
<%   

//******************************************************************************
//   Get connection information
//******************************************************************************

	if (conn == null)
	{	   
   		Driver drv = (Driver) Class.forName(driver).newInstance(); 
   		Properties prop = new Properties();
   		prop.put("user", userProfile);
   		prop.put("password", password);

   		conn = DriverManager.getConnection("jdbc:as400:" + sys, prop);
   	}
   		PreparedStatement ps = conn.prepareStatement("select * from dbprd.z100003 where ucorno = '841141'" );
   		ResultSet rs1 = ps.executeQuery();
   		
   		if (rs1.next())
   			out.println(rs1.getString("UCIVNO"));
   		else
   		 	out.println("000000000");
   		 	
   	
   	%>

<%@page import="com.treetop.businessobjects.DateTime"%>
<html>
   <head>

      <title>Place Title Here</title>

<!----------------------------------------------------------------------------->
<!-- Style Sheet Reference                                                  --->
<!----------------------------------------------------------------------------->

      <link rel="stylesheet" type="text/css" href="http://image.treetop.com/webapp/Stylesheet.css" />

<!---  Add another level to href for each file folder deep, such as ../../HTML --->

   </head>

   <body>

		

 

<!------------------------------------------------------------------------------->
<!--   Beginning of Page Detail                                                -->
<!------------------------------------------------------------------------------->
   <table class="table01001">
       <tr>
               <td class="td042CC001">
               &nbsp;
               </td>
       </tr>
       <tr>
               <td class="td042CC001">
               Information Goes Here - Modify as Needed for Each Page Type
               
<%
	// the value of x will be saved for the next jsp execution.
	if (x.equals("A"))
	{
		x = "B";
	} else {
		x = "A";
	}

	// run a simple sql statement...
	String co = "100";
	String cu = "30000";
	
	Statement stmt = conn.createStatement();
	Statement stmt2 = conn.createStatement();
	String sqlString = "SELECT * FROM M3DJDPRD.OCUSMA ";
	sqlString = sqlString + "WHERE OKCONO = " + co + " AND OKCUNO = '" + cu + "' ";
	ResultSet rs = null;
	ResultSet r  = null;
	
	try {
		rs   = stmt.executeQuery(sqlString);
    } catch (Exception e) {
    	String xx = "xx";
    }
    
    String sqlString2 = "SELECT COUNT(*) AS rowCount FROM M3DJDPRD.OCUSMA WHERE OKCUNO > '3' AND OKCUNO < '4' ";
    int total = 0;
     try {
     	r = stmt2.executeQuery(sqlString2);
     	r.next();
     	total = r.getInt("rowCount");
     	r.close();
     } catch (Exception e) {
     	String xx = "xx";
     }
          
    
    
	out.println("<BR>");
    out.println("cus#:       names");
    out.println("<BR>");
    if (rs.next())
    {
    	String outPut = rs.getString("OKCUNO") + "     " + rs.getString("OKALCU");
    	out.println(outPut);
    	out.println("<BR>");
    	out.println(total);
    }
    rs.close();
    stmt.close();

 
%>
               </td>
       </tr>
       <tr>
               <td class="td042CC001">
               
<%
   try
   {
     String inDate = "20100421";
     String aMonth = inDate.substring(4,6);
     Integer iMonth = new Integer(aMonth);
     int nMonth = iMonth.intValue() -1;
     String DATE_FORMAT = "yyyyMMdd";
     java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(DATE_FORMAT);
     java.util.Calendar c1 = Calendar.getInstance();
     Integer iYear = new Integer(inDate.substring(0,4));
     Integer iDays = new Integer(inDate.substring(6,8));
     c1.set(iYear.intValue(), nMonth, iDays.intValue());
     c1.add(Calendar.DATE, -182);
     String date_10 = sdf.format(c1.getTime());
     String y = date_10.substring(0,4);
     String m = date_10.substring(4,6);
     String d = date_10.substring(6,8);
     
     String ymd = y + m + d;
     String x = "stop here";
     
     com.treetop.businessobjects.DateTime dt = new DateTime();
     dt = com.treetop.utilities.UtilityDateTime.getSystemDate();
     x = "stop here";
     dt = com.treetop.utilities.UtilityDateTime.addDaysToDate(dt, -182);
     x = "stop here";
     
   } catch (Exception e)
   {
   	 out.println("Exception here:" + e + "<br>");
   }      
%>               &nbsp;
               </td>
       </tr>
</table>

		
   </body>
</html>