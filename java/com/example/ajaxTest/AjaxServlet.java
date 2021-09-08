package com.example.ajaxTest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Locale;

@WebServlet(name = "Valider", value = "/Valider")
public class AjaxServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //get param "valeur" value (it's the form input)
        String valeur = request.getParameter("valeur").toLowerCase();
        String result = "";
        response.setContentType("text/xml");
        response.setHeader("Cache-Control", "no-cache");

        if(valeur != null && valeur.startsWith("x")) {
            result = "valide";
        }else {
            result = "invalide";
        }


        //Returns a PrintWriter object that can send character text to the client
        //getElementsByTagName("message")[0]

        response.getWriter().println("<message>"+result+"</message>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
