<%@ page import="java.util.List" %>
<%@ page import="lab02.services.QuestionService" %>
<%@ page import="lab02.beans.QuestionBean" %>
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
    <%--<th>QUESTION_ID</th>--%>
  </tr>
  </thead>
  <tbody>
  <%
    List<QuestionBean> questions = lab02.services.QuestionService.getAllQuestions();
    for(QuestionBean qb : questions) {
  %>
  <tr>
    <td><%= qb.getId() %></td>
    <td><a href="question.jsp" value="<%= qb.getId() %>"><%= qb.getText() %></a></td>
  </tr>
  <%
    }
  %>
  </tbody>

</table>

</body>
</html>
