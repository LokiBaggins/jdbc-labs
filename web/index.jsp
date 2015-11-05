<%@ page import="lab02.beans.AnswerBean" %>
<%@ page import="java.util.List" %>
<%@ page import="lab02.services.DaoService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
    <h1>Welcome JSP page_update1</h1>

    <h3>BEFORE_TABLE</h3>
    <table>
      <thead>
        <tr>
          <td>ID</td>
          <td>CATEGORY_NAME</td>
        </tr>
      </thead>
      <tbody>
      <%
        List<AnswerBean> answers = DaoService.getAnswers();
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

  </body>
</html>
