<%@ page import="java.util.List" %>
<%@ page import="lab02.services.QuestionService" %>
<%@ page import="lab02.beans.QuestionBean" %>
<%@ page import="lab02.beans.AnswerBean" %>
<%@ page import="lab02.services.AnswersServices" %>
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
    <%
      QuestionBean question = lab02.services.QuestionService.getQuestionById(1);
    %>
<h3>Question #<%= question.getId() %></h3>

<form action="QuestionController.do">
  <table>
    <tbody>
    <tr>
      <td colspan="2"><b><%= question.getText() %></b></td>
    </tr>
    <%
      List<AnswerBean> answers = AnswersServices.getAnswersSet(question.getCorrectAnswerId());
      for(int i = 0; i < answers.size(); i++) {
    %>
    <tr>
      <td><%= i + 1 %></td>
      <td><%= answers.get(i).getText() %></td>
    </tr>
    <%
      }
    %>
    </tbody>
  </table>
</form>
</body>
</html>
