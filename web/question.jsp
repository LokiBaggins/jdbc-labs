<%@ page import="java.util.List" %>
<%@ page import="lab02.services.DaoService" %>
<%@ page import="lab02.beans.QuestionBean" %>
<%@ page import="lab02.beans.AnswerBean" %>
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
<h3>Question #</h3>

<form action="QuestionController.do">

  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>TEXT</th>
    </tr>
    </thead>
    <tbody>
    <%
      QuestionBean question = DaoService.getQuestionById(1);
    %>
    <tr>
      <td colspan="2"><b><%= question.getText() %></b></td>
    </tr>
    <%
      List<AnswerBean> answers = DaoService.getAnswersByQuestionId(1);
      for(AnswerBean ab : answers) {
    %>
    <tr>
      <td><%= ab.getId() %></td>
      <td><%= ab.getText() %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</form>
</body>
</html>
