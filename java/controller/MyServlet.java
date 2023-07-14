package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/servlet")
public class MyServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        
        JSONObject obj = new JSONObject();
        PrintWriter out = response.getWriter();
        
        out.println("{\r\n"
        		+ "    \"id\": 1,\r\n"
        		+ "    \"name\": \"Leanne Graham\",\r\n"
        		+ "    \"username\": \"Bret\",\r\n"
        		+ "    \"email\": \"Sincere@april.biz\",\r\n"
        		+ "    \"address\": {\r\n"
        		+ "      \"street\": \"Kulas Light\",\r\n"
        		+ "      \"suite\": \"Apt. 556\",\r\n"
        		+ "      \"city\": \"Gwenborough\",\r\n"
        		+ "      \"zipcode\": \"92998-3874\",\r\n"
        		+ "      \"geo\": {\r\n"
        		+ "        \"lat\": \"-37.3159\",\r\n"
        		+ "        \"lng\": \"81.1496\"\r\n"
        		+ "      }");
        
    }
}

