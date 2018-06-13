package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class servletToJsp extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
//这里的req和response是将Servlet传递过去的
            resp.setContentType("text/html;charset=utf-8");
            req.setAttribute("servletName", "ServletToJsp");
            PrintWriter out = resp.getWriter();
            out.println("this is knowledge from servlet!!");
            getServletConfig().getServletContext().getRequestDispatcher(
                    "/ServletUseJsp.jsp"
            ).forward(req, resp);

        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
