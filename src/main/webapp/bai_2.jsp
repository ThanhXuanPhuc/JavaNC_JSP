<%-- 
    Document   : bai_2
    Created on : Oct 16, 2024, 8:34:45 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tính diện tích - chu vi hình chữ nhật</title>
    </head>
    <body>
        <h1>Nhập chiều dài - chiều rộng</h1>
        <form action="bai_2.jsp" method="POST">
            <table>
            <tr>
                <td>Nhập chiều dài</td>
                <td><input type="text" name="dai" value="" required=""</td>
            </tr>
            <tr>
                <td>Nhập chiều rộng</td>
                <td><input type="text" name="rong" value="" required=""</td>
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
          String dai = request.getParameter("dai");
          String rong = request.getParameter("rong");
          if(dai!=null && rong!=null)
          {
          double d = Double.parseDouble(dai);
          double r = Double.parseDouble(rong);
          double dt = d*r;
          double cv = (d+r)*2;
          out.println("<hr>");
          out.println("Diện tích: " + dt + "</br>");
          out.println("Chu vi: " + cv + "</br>");
        }
        %>
    </body>
</html>
