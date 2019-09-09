<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!--  Step 1: Create Html form -->
<form action="todo-demo.jsp">
	Add new item: <input type="text" name="theItem"/>
	
	<input type="submit" value = "Submit"/>	
</form>
<br/>

<!-- Step 2: Add new item to "To do" List  -->
<%
// get the TO DO items from the session
List<String> items = (List<String>) session.getAttribute("myToDoList");

//If the TO DO items doesn't exist, then create a new one

if( items == null){
	items = new ArrayList<String>();
	//Make sure getAttribute and setAttribute to point at same object "myToDOList"
	session.setAttribute("myToDoList", items);
}

// see if there is form data to add
String theItem = request.getParameter("theItem");
if ( (theItem != null) && (!theItem.trim().equals("")) ) {
	   items.add(theItem);
	   //reset the session if you refresh the page
	   response.sendRedirect("todo-demo.jsp");
	}




%>

<!-- Step3: Display all"To Do "item from session  -->
<hr>
<b>To do List Items:</b><br/>
<ol>
<%
	for(String temp : items){
		out.println("<li>" + temp + "</li>");
	}
%>

</ol>


<body>

</body>
</html>