<%@ page import="com.Item" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Items Management</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
 	<div class="row">
 		<div class="col">
<%
if (request.getParameter("itemCode") != null)
{
	Item itemObj= new Item();
 	itemObj.connect();//For testing the connect method
 	String stsMsg = itemObj.insertItem(request.getParameter("itemCode"),
 			 request.getParameter("itemName"),
 			 request.getParameter("itemPrice"),
 			 request.getParameter("itemDesc"));
 			 session.setAttribute("statusMsg", stsMsg);
}
//Delete item----------------------------------
if (request.getParameter("itemID") != null)
{
Item itemObj = new Item();
String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
session.setAttribute("statusMsg", stsMsg);
}
%>
	<h1>Items Management</h1>
	<form method="post" action="items.jsp">
 		Item code: <input name="itemCode" type="text" class="form-control"><br>
 		 Item name: <input name="itemName" type="text" class="form-control"><br> 
 		 Item price: <input name="itemPrice" type="text" class="form-control"><br> 
 		 Item description: <input name="itemDesc" type="text" class="form-control"><br> 
 		 <input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
	</form>
<%
 	out.print(session.getAttribute("statusMsg"));
%>
	<br>
<%
 	Item itemObj = new Item();
 	out.print(itemObj.readItems());
%>

 		</div>
 	</div>
 </div>

</body>
</html>