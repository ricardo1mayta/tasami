/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.admin;

import app.DAO.AreasDao;
import app.DAO.LocationDao;
import app.DAO.PanelDAO;
import app.DAO.TiposignalDAO;
import app.DAO.TipovariableDAO;
import app.DAO.VariablesDAO;
import app.pojos.bean.DLAreas;
import app.pojos.bean.DLDispositivos;
import app.pojos.bean.DLLocation;
import app.pojos.bean.DLPanel;
import app.pojos.bean.DLTiposignal;
import app.pojos.bean.DLTipovariables;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "servletAdmin", urlPatterns = {"/admin", "/ajaxAreas","/ajaxLocation","/ajaxPanel","/ajaxVariables"})
public class servletAdmin extends HttpServlet {

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
         try (PrintWriter out = response.getWriter()) {
        if (path.equals("/admin")) {
            ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/admin.jsp");
            rd.forward(request, response);
        }
        if (path.equals("/ajaxAreas")) {
            ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxAreas.jsp");
            rd.forward(request, response);
        }
        if (path.equals("/ajaxLocation")) {
            ArrayList<DLLocation> lista = LocationDao.location();
            request.setAttribute("location", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxLocation.jsp");
            rd.forward(request, response);
        }
         if (path.equals("/ajaxPanel")) {
            ArrayList<DLPanel> lista = PanelDAO.panel();
            request.setAttribute("panels", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxPanel.jsp");
            rd.forward(request, response);
        }
          if (path.equals("/ajaxVariables")) {
            ArrayList<DLDispositivos> lista = VariablesDAO.dispositivos();
            request.setAttribute("variables", lista);
            
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxVariables.jsp");
            rd.forward(request, response);
        }
         if (path.equals("/saveArea")) {
              String nombre = request.getParameter("nombre");
            String img= request.getParameter("img");
             
          // String ms= AreasDao.savearea(nombre,img);
            out.println(nombre+img);
        }
         if (path.equals("/savePanel")) {
            ArrayList<DLPanel> lista = PanelDAO.panel();
            request.setAttribute("panels", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxPanel.jsp");
            rd.forward(request, response);
        }
         if (path.equals("/savePanel")) {
            ArrayList<DLPanel> lista = PanelDAO.panel();
            request.setAttribute("panels", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/ajaxPanel.jsp");
            rd.forward(request, response);
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
