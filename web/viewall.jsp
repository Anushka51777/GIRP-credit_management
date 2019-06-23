<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all users</title>
        <link href="css/styles.css" rel="stylesheet">
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <style>
            
           table {
             display: inline-block;
  border-collapse: collapse;
  width: 50%;
  margin-top: 10%;
  margin-left: 6%;
}

th, td {
  text-align: left;
  padding: 8px;
  font-family: arial;
  font-size: 20px;
  text-align: center;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
  font-weight: bold;
  font-family: Arial, Helvetica, sans-serif ;
  text-align: center;
  font-size: 30px;
  
}
        </style>
        
    </head>
    <body>
         <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@include file="databaseconnection.jsp" %>
       
         <div class="header">
              
            Credit Management</div>
        <table class="user" >   
        <%
     

        
        PreparedStatement ps;
        ResultSet rs= null;
        try
        {
            
          ps= conn.prepareStatement("select * from user");
           rs= ps.executeQuery();
          %>
          
               
               
             <tr>
					<th class="table-header-repeat line-left minwidth-1">User</th>
					<th class="table-header-repeat line-left minwidth-1">Email</th>
                                        <th class="table-header-repeat line-left minwidth-1">Credits</th>
                                        <th class="table-header-repeat line-left minwidth-1">Phone Number</th>
                                        <th class="table-header-repeat line-left minwidth-1">Address</th>
					</tr>
                                    <% while(rs.next()){ %>
				<tr>
					<td><%= rs.getString(1) %></td>
                                        <td><%= rs.getString(2)%></td>
                                        <td><%= rs.getString(3) %></td>
                                        <td><%= rs.getString(4)%></td>
                                        <td><%= rs.getString(5) %></td>
                                        
                                        
                                </tr>
                                        <% } %>
                                               


        </table>                                       <button class="button" onclick="window.location('newjsp.jsp')"><span>Transfer Credits</span></Button>                 
                   
        <%                
                 //out.println("Successfully registered");
              
            
        }catch(Exception e)
        {
            out.println(e);
        }
    
         
        
        %>
        
          
    </body>
</html>