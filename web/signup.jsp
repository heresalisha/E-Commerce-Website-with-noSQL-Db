<%-- 
    Document   : signup
    Created on : 13 Oct, 2022, 1:14:17 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up Confirmation</title>
    </head>
    <body>
        <%
            String fn=request.getParameter("name");
            String un=request.getParameter("user_name");
            String email=request.getParameter("email");
            String pswd=request.getParameter("password");
            MongoClient mongo = new MongoClient( "localhost" , 27017 );
	
	// Accessing the database
	MongoDatabase database = mongo.getDatabase("CA2");
	
	// Creating a collection
	//database.createCollection("user_data");  //Do comment this line after first execution or else it might show error.
	//out.println("Collection created successfully");
	
	// Retrieving a collection
	MongoCollection<Document> collection = database.getCollection("user_data");
	//out.println("Collection user_data selected successfully");
	Document document = new Document("name",fn)
                             .append("user_name",un)
	     .append("email",email)
                             .append("password",pswd);
	
	//Inserting document into the collection
	collection.insertOne(document);
	out.println("Sign Up Successful.....!!!");
        %>
    </body>
</html>
