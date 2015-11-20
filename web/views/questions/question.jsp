<%@ page import="java.util.List" %>
<%@ page import="lab02.beans.QuestionBean" %>
<%@ page import="lab02.beans.AnswerBean" %>
<%@ page import="lab02.services.AnswersServices" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="styles/styles.css" >
</head>
<body>
    <%
      long qId = Long.parseLong(request.getParameter("id"));
      QuestionBean question = lab02.services.QuestionService.getQuestionById(qId);
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
