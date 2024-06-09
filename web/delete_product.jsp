<%-- 
    Document   : delete_product
    Created on : 14 Oct, 2022, 4:32:00 PM
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
        <title>Delete Product</title>
    </head>
    <body>
        <%
     try{
        String n=request.getParameter("Img_Name");
        MongoClient mongoc=new MongoClient("localhost",27017);
        MongoDatabase database=mongoc.getDatabase("CA2");
        MongoCollection<Document> c=database.getCollection("image_info");
        c.deleteOne(Filters.eq("Img_Name", n));
        
              out.println("Product deleted successfully...");
       }catch(Exception e){out.println(e);}
      %>
    </body>
</html>


