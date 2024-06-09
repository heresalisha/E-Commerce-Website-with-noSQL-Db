<%-- 
    Document   : img_display
    Created on : 14 Oct, 2022, 1:47:46 PM
    Author     : HP
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.*"%>
<%@page import="com.mongodb.*"%>
<%@page import="com.mongodb.MongoClient"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Products</title>
        <link rel="stylesheet" href="home.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
                    .img1{
                        border-radius: 15px;
                     }
                     .butt1 {
                           display: inline-block;
                        background: #0000b3;
                        color: white;
                        padding: 8px 30px;
                        margin: 30px 0;
                        border-radius: 30px;
                        transition: background 0.5s;
                    }
            </style>
    </head>
    <body>
        <div class="header">
            <div class="container">
		<div class="navbar">
    	<div class="logo">
    		<img src="images/logo.jpg" width="70px">
    	</div>
    	<nav>
    		<ul id="MenuItems">
    			<li><a href="index.html">Home</a></li>
    			<li><a href="img_display.jsp">Products</a></li>
                                                                         <li><a href="signup.html">Sign Up</a></li>
    			<li><a href="contact.html">Contact</a></li>
    			<li><a href="login.html">Login</a></li>
    		</ul>
    	</nav>
                
      </div>
        <%
        try{
          MongoClient mongoc=new MongoClient("localhost",27017);
          MongoDatabase database=mongoc.getDatabase("CA2");
          MongoCollection<Document> c=database.getCollection("image_info");

              FindIterable<Document> it=c.find();

              Iterator itr=it.iterator();
              out.println("<table border=0 align='center' cellspacing=40 cellpadding=40><tr>");
              int i=0;
              while(itr.hasNext())
              {
                  Document d=(Document)itr.next();
                  if(d.getString("Img_Data")!=null)
                  {
                      out.println("<td>"
                          + "<div class='flip-box'><div class='flip-box-inner'><div class='flip-box-front'><form>"
                          + "<img src='"+d.getString("Img_Data")+"' width=200 height=200 class='img1'></div>"
                          +"<hr><br>Product Name : "+ d.getString("Img_Name")
                          +"<hr><br>Product Price In Rs : "+ d.getString("Img_Price")+"<hr>"
                          + "<input class='butt1'  type='submit' value='Add to Cart'></form></div></div></div></td>");
                  }
                  i++;
                  if(i%4==0)
                  {
                      out.println("</tr><tr>");
                  }
              }
              out.println("</table>");    
          }catch(Exception e){out.println(e);}
        %> 
        </div>
        <!----------footer------------>
   <div class="footer">
      <div class="container">
         <div class="row">
            <div class="footer-col-1">
               <h3>Download our App </h3>
               <p>Download our App for Andriod and ios mobile phone</p>
               <div class="app-logo">
                  <img src="images/play-store.png">
                  <img src="images/app-store.png">
               </div>
            </div>
            <div class="footer-col-2">
               <img src="images/logo.jpg">
               <p>This accessories are portable and affordable.</p>
            </div>
            <div class="footer-col-3">
               <h3>Useful Links</h3>
               <ul>
                  <li>Coupons</li>
                  <li>Blog Post</li>
                  <li>Return Policy</li>
                  <li>join Affiliate</li>
               </ul>
            </div>
            <div class="footer-col-4">
               <h3>Follow Us</h3>
               <ul>
                  <li>Facebook</li>
                  <li>Twitter</li>
                  <li>Instagram</li>
                  <li>Youtube</li>
               </ul>
            </div>
         </div>
         <hr>
         <p class="copyright">copyright 2021</p>
      </div>
   </div>
    </body>
</html>

