<%-- 
    Document   : delete_contact_data
    Created on : 14 Oct, 2022, 1:31:08 PM
    Author     : HP
--%>

<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Contact Data</title>
    </head>
    <body>
        <%
      try{
        String n=request.getParameter("name");
        String e=request.getParameter("email");
        MongoClient mongoc=new MongoClient("localhost",27017);
	MongoDatabase database=mongoc.getDatabase("CA2");
        MongoCollection<Document> c=database.getCollection("contact_data");
     
            FindIterable<Document> it=c.find();
            
            Iterator itr=it.iterator();
            while(itr.hasNext())
            {
                Document d=(Document)itr.next(); 
                if(d.getString("name").equals(n))
                {
                    c.deleteOne(Filters.eq("name", n));
                }
                
            } out.println("Message deleted successfully...");
        }catch(Exception e){out.println(e);}
      %>
    </body>
</html>

