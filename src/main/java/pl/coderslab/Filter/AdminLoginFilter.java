package pl.coderslab.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

@WebFilter(filterName = "AdminLoginFilter", urlPatterns = {"/adminpanel/*"}, initParams = {
        @WebInitParam(name = "avoid-urls", value = "/adminpanel,/adminpanel/") // na tych adresach nie chce sprawdzac logowania, bo mi sie zapetli redirect!
})
public class AdminLoginFilter implements Filter
{
    private ArrayList<String> urlList;
    private final String adminName = "admin";
    private final String adminPass = "coderslab";

    public void destroy()
    {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException
    {

        HttpServletRequest request = (HttpServletRequest) req; // full request
        HttpServletResponse response = (HttpServletResponse) resp; // full response

        // sprawdz czy url nie jest wykluczony
        if (this.urlList.contains(request.getServletPath()))
        {
            chain.doFilter(req, resp); // jak wykluczony to nie sprawdzaj
            return; // nie wykonuj dalszej części kodu bo doFiler/forward/sendRedirect musi byc ostatni! (nie mozna przekierowac wiecej niz raz)
        }

        //////////////////////////////////////////////////////////////

        HttpSession session = request.getSession(false); // false - nie twórz nowej jak nie istniteje sesja (zwroci null jak nie instnieje)

        if (session == null) // pusta sesja
        {
            System.err.println("Pusta sesja - redirect do panelu logowania");
            response.sendRedirect("/adminpanel"); // do logowania
            return;
        }
        else
        {
            String sessionAdminName = (String) session.getAttribute("admin_name");
            String sessionAdminPass = (String) session.getAttribute("admin_pass");
            if (sessionAdminName != null && sessionAdminPass != null)
            {
                if (sessionAdminName.equals(this.adminName) && sessionAdminPass.equals(this.adminPass))
                { // jak hasla sa w sesji
                    System.err.println("OK zapraszamy");
                    chain.doFilter(req, resp); // zapraszamy
                    return;
                }
            }
        }
        //chain.doFilter(req, resp);
        System.err.println("Nieustawione haslo/login w sesji");
        response.sendRedirect("/adminpanel"); // do logowania
        // dzieki returnom powyzsza linia nie wykona sie jesli dojdzie wczesniej do redirecta/doFiltera
    }

    public void init(FilterConfig config) throws ServletException
    {
        String urls = config.getInitParameter("avoid-urls");
        StringTokenizer token = new StringTokenizer(urls, ",");

        urlList = new ArrayList<>();

        while (token.hasMoreTokens())
        {
            urlList.add(token.nextToken());
        }

    }

}