<%@ page import="java.util.List" %>
<%@ page import="lab02.beans.QuestionBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <link rel="stylesheet" href="styles/styles.css" >
</head>
<body>
<h3>Choose a question:</h3>

  <table>
    <tbody>
    <%
      List<QuestionBean> questions = lab02.services.QuestionService.getAllQuestions();
      int i = 1;
      for(QuestionBean qb : questions) {
    %>
    <tr>
      <td><%= i %></td>
      <td>
        <a href='questioncontroller.do?action=show&id=<%= qb.getId() %>' >
          <%= qb.getText() %>
        </a>
      </td>
    </tr>
    <% i++;
      } %>
    </tbody>
  </table>
<%--</form>--%>


</body>
</html>
