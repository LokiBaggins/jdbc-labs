<%@ page import="lab02.beans.AnswerBean" %>
<%@ page import="java.util.List" %>
<%@ page import="lab02.services.DaoService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <style>
    table, td {
      border: 1px solid grey;
      text-align: center;
    }
    td {
      padding: 0 5px;
    }
  </style>
</head>
<body>
<h3>Answers</h3>
<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>TEXT</th>
    <th>QUESTION_ID</th>
  </tr>
  </thead>
  <tbody>
  <%
    List<AnswerBean> answers = DaoService.getAllAnswers();
    for(AnswerBean ab : answers) {
  %>
  <tr>
    <td><%= ab.getId() %></td>
    <td><%= ab.getText() %></td>
    <td><%= ab.getQuestion_id() %></td>
  </tr>
  <%
    }
  %>
  </tbody>

</table>

</body>
</html>
