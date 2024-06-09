<%-- 
    Document   : add_product
    Created on : 14 Oct, 2022, 12:42:30 PM
    Author     : HP
--%>

<%@page import="com.mongodb.client.model.Filters"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="ContentType" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <%
          try{
              String imgname=request.getParameter("t12");
              String imgprice=request.getParameter("t13");
              String imagedata=request.getParameter("img11");
        MongoClient mongoc=new MongoClient("localhost",27017);
        MongoDatabase database=mongoc.getDatabase("CA2");
        //database.createCollection("image_info");
       //out.println("image_info collection created...");
        MongoCollection<Document> collection=database.getCollection("image_info");
        Document d1=new Document("Img_Name",imgname)
                .append("Img_Price", imgprice).append("Img_Data",imagedata);
        collection.insertOne(d1);
        out.println("Product Added");
        }catch(Exception e){out.println(e);}
        %>
    </body>
</html>

