<%-- 
    Document   : admin_jsp
    Created on : 14 Oct, 2022, 3:41:17 PM
    Author     : HP
--%>

<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
    </head>
    <body>
        <%
      try{
        String u=request.getParameter("name");
        String p=request.getParameter("password");
        MongoClient mongoc=new MongoClient("localhost",27017);
        MongoDatabase database=mongoc.getDatabase("CA2");
        MongoCollection<Document> c=database.getCollection("admin_info");
     
            FindIterable<Document> it=c.find();
            
            Iterator itr=it.iterator();
            while(itr.hasNext())
            {
                Document d=(Document)itr.next(); 
                if(d.getString("name").equals(u) && d.getString("password").equals(p))
                {
                    response.sendRedirect("admin_home.html"
                            + "");
                }
            }out.println("Invalid Credentials");
        }catch(Exception e){out.println(e);}
      %>
    </body>
</html>
