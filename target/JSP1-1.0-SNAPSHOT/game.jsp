<%-- 
    Document   : game
    Created on : 16/04/2024, 12:03:48 PM
    Author     : Dialoz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Juego de Azar</h1>
        <%
            String verificar = request.getParameter("valor");
            
            if (verificar != null && verificar.length() > 0) {
                int num = 0;
                num = Integer.valueOf(verificar);
                float ruleta = (float) Math.random();
                if (ruleta >= 0.0 && ruleta <= 0.2) {
                    num = 0;
                    out.println("<img src = 'https://cdn-icons-png.freepik.com/512/1724/1724993.png?ga=GA1.2.1896956042.1709235287&' style='width:50px; height:50px'>");
                }else if (ruleta > 0.2 && ruleta <= 0.5){
                    num = num / 2;
                    out.println("<img src = 'https://cdn-icons-png.freepik.com/512/13481/13481808.png?ga=GA1.2.1896956042.1709235287&' style='width:50px; height:50px'>");
                }else{
                    num = num * 2;
                    out.println("<img src = 'https://cdn-icons-png.freepik.com/512/3983/3983340.png?ga=GA1.2.1896956042.1709235287&' style='width:50px; height:50px'>");
                }
                String ff = "";
                if (num > 0){
                    ff = "<p>Si desea seguir jugando presiones este boton "+"</p><br><form action='game.jsp' method='get'><input type='number' name='valor' value='"+num+"' style='display:none;'><input type='submit' value='seguir jugando'></form>";
                }else{
                    ff = "<p>Perdistes, vuelve a intentarlo</p><br><button><a href='index.jsp'>Volver al inicio</a></button>";
                }
                out.println("<h2>Dinero obtenido: "+(num)+"</h2><br><br>"+ff);
            }
        %>
    </body>
</html>
