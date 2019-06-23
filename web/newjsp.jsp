<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View all users</title>
        <link href="css/styles.css" rel="stylesheet">
    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
           
        <script>
           $(document).ready(function(){
                $("#credits").hide();
                 $("#creditst").hide();
               $("#bd").click(function(){
                   $("#credits").show();
                   $("#creditst").show();
               });
               
               
               
               
               
           });
            
            
            
            
            
            
        </script>
        <style>
            select{
                
                width: 50%;
                size: 60%;
            }
           form {
               display:inline-block;
            
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

.header2
{
    margin-top: 10%;
    display: inline-block;
   font-weight: bold;
  font-family: Arial, Helvetica, sans-serif ;
  text-align: center;
  font-size: 30px;
}
.userdetails{
    
        margin-left: 0%;
            position:absolute;
            
           font-weight: bold;
           font-size: 30px;
           text-align: center;
  }
  
  .button {
  position: relative;
  background-color: #4CAF50;
  border: none;
  font-size: 15px;
  color: #FFFFFF;
  padding: 8px;
  width: 200px;
  text-align: center;
  -webkit-transition-duration: 0.4s; /* Safari */
  transition-duration: 0.4s;
  text-decoration: none;
  overflow: hidden;
  cursor: pointer;
}

.button:after {
  content: "";
  background: #f1f1f1;
  display: block;
  position: absolute;
  padding-top: 300%;
  padding-left: 350%;
  margin-left: -20px !important;
  margin-top: -120%;
  opacity: 0;
  transition: all 0.8s
}

.button:active:after {
  padding: 0;
  margin: 0;
  opacity: 1;
  transition: 0s
}
input[type=text], select, textarea {
 width: 100%;
  padding: 2px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

        </style>
        
    </head>
    <body>
         <%@ page language="java" %>
        <%@ page import="java.sql.*" %>
        <%@include file="databaseconnection.jsp" %>
       
         <div class="header">
              
            Credit Management</div>
        <form action="newjsp.jsp">
        &nbsp;<div class='header2'>*Please select user</div>
        
        
         &nbsp; &nbsp; <select onchange="" name="nam" style="width: 152px;border: 1px solid; border-radius: 4px; padding: 5px 5px 6px 6px;margin-top:60px;">
                                                <option value="-1">---Select---</option>
                                                <%
                                                    try {
                                                       

                                                        PreparedStatement ps = conn.prepareStatement("Select * from user");
                                                        ResultSet rs = ps.executeQuery();
                                                        while (rs.next()) {
                                                %>
                                                <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
                                                <%
                                                        }
                                                    } catch (Exception ex) {

                                                    }
                                                %>
                                            </select>
                                            <input type="submit" class="button" value ="Select">
        </form>
                                            
                                            
                                                <%
                                                    try{
                                                   String user= request.getParameter("nam");
                                                  PreparedStatement  ps = conn.prepareStatement("select * from user where Name=?");
                                                    ps.setString(1, user);
                                                    ResultSet rs = ps.executeQuery();
                                                    while(rs.next()) {
                   
                
                      



                                                    %>
                                            <br>
                                            <form  action = "details.jsp"style="margin-top:50px;">
                                                
                                                <div class="userdetails">User details</div><br>
                                                <table>
                                                    
                                                   
                                                    <tr><td><label>Name:</label></td><td><input type="text" value="<%= rs.getString(1)%>" name ="user"   ></td></tr>
                                                     <tr><td><label>Email:</label></td><td><input type="text"value="<%= rs.getString(2)%>" name ="email" ></td></tr>
                                                      <tr><td><label> Avaliable credits:</label></td><td><input type="text" value="<%= rs.getString(3)%>" name ="credits" ></td></tr>
                                                       <tr><td><label>Contact no.:</label></td><td><input type="text" value="<%= rs.getString(4)%>" name ="ph" ></td></tr>
                                                        <tr><td><label>Address:</label></td><td><input type="text" value="<%= rs.getString(5)%>" name ="ad" ></td></tr>
                                                        <tr><td  style="text-align: center"colspan="2"><input type="button" class="button"  id ="bd" value="Verify"></td></tr>
                                                        <br>
                                                        <tr><td id="credits" colspan="2"> <input type="text" name ="credits" placeholder="Credits to tranfer" ></td></tr>
                                                        <tr><td id ="creditst" style="text-align: center"colspan="2"><input type="submit"class ="button"  value="Transfer"></td></tr>
                                                </table>
                                                
                                              </form>    
                                       <%    } } catch (Exception ex) {
                System.out.print(ex);
            }    
                                   %>             
                                                 
                                          
        

    </body>
</html>

