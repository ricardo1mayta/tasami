/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.user;

import app.DAO.AreasDao;
import app.DAO.UsuariosDAO;
import app.pojos.bean.DLAreas;
import app.pojos.bean.DLUsuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "serveletUser", urlPatterns = {"/User","/logear"})
public class serveletUser extends HttpServlet {
    

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();
        response.setContentType("text/html;charset=UTF-8");
          if (path.equals("/User")) {
/*
            String nombre;
       
            nombre = (String) request.getSession().getAttribute("Sesion_Persona");
          
            try {
                if (nombre == null) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("WEB-INF/reportes/menu.jsp").forward(request, response);
                }
            } catch (Exception e) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }*/
  request.getRequestDispatcher("WEB-INF/principal/eventos.jsp").forward(request, response);
        }
          if (path.equals("/logear")) {

            String us = request.getParameter("txtemail");
            String pw = request.getParameter("txtpassword");
            DLUsuarios usuario = UsuariosDAO.validar_usuario("admin@admin.com","1234");
            if (usuario != null) {

                request.getSession().setAttribute("Sesion_Persona", usuario.getUserName());
                request.getSession().setAttribute("idusuario", usuario.getIdusuario());


                request.setAttribute("datos_persona", usuario.getUserName());
                ArrayList<DLAreas> lista = AreasDao.areas();
                request.setAttribute("areas", lista);
                request.getRequestDispatcher("WEB-INF/principal/panel.jsp").forward(request, response);
            } else {
                request.setAttribute("msgError", "Error: Usuario y/o Clave"+us+pw);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

           
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
