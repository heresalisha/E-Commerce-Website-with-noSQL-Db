<%-- 
    Document   : contact
    Created on : 13 Oct, 2022, 1:43:30 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="com.mongodb.client.MongoCollection,com.mongodb.client.MongoDatabase,org.bson.Document,com.mongodb.MongoClient"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
    </head>
    <body>
        <%
            String fn=request.getParameter("name");
            String email=request.getParameter("email");
            String msg=request.getParameter("message");
            MongoClient mongo = new MongoClient( "localhost" , 27017 );
	
	// Accessing the database
	MongoDatabase database = mongo.getDatabase("CA2");
	
	// Creating a collection
	//database.createCollection("contact_data");  //Do comment this line after first execution or else it might show error.
	//out.println("Collection created successfully");
	
	// Retrieving a collection
	MongoCollection<Document> collection = database.getCollection("contact_data");
	//out.println("Collection user_data selected successfully");
	Document document = new Document("name",fn)
	     .append("email",email)
                             .append("message",msg);
	
	//Inserting document into the collection
	collection.insertOne(document);
	out.println("Message sent successfully");
        %>
    </body>
</html>

