<%-- 
    Document   : bai_3
    Created on : Oct 16, 2024, 8:44:26 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tính diện tích - chu vi hình tròn</title>
    </head>
    <body>
        <h1>Diện tích - chu vi hình tròn</h1>
        <form action="bai_3.jsp" method="POST">
            <table>
            <tr>
                <td>Nhập bán kính</td>
                <td><input type="text" name="bk" value="" required=""</td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Tính toán" />
                    <input type="reset" value="Tiếp tục" />
                </td>
            </tr>
            </table>
        </form>
        <%
          String bk = request.getParameter("bk");
          if(bk!=null)
          {
          double d = Double.parseDouble(bk);
          double dt = d*d*Math.PI;
          double cv = 2*d*Math.PI;
          out.println("<hr>");
          out.println("Diện tích: " + dt + "</br>");
          out.println("Chu vi: " + cv + "</br>");
        }
        %>
    </body>
</html>
