<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%--
  Created by IntelliJ IDEA.
  User: SBT-Meshkov-AV
  Date: 20.11.2015
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ERROR</title>
  <link rel="stylesheet" href="styles/styles.css" >
</head>
<body>
  <%
    ArrayList al = Collections.list(request.getParameterNames());
    out.println(Arrays.toString(al.toArray()));

  %>
  <br/>
  <a href="<%= request.getServletContext().getContextPath() %>">Back to Form</a>
</body>
</html>
