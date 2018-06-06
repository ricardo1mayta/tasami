/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.panel;

import app.DAO.AreasDao;
import app.DAO.LocationDao;
import app.DAO.PanelDAO;
import app.pojos.bean.DLAreas;
import com.oreilly.servlet.MultipartRequest;
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
@WebServlet(name = "servletPanel", urlPatterns = {"/servletPanel","/panels","/savePanel","/updatePanel","/deletePanel"})
public class servletPanel extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String path = request.getServletPath();
        if (path.equals("/panels")) {
             ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
           RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/panel.jsp");
           rd.forward(request, response);
        }
 if (path.equals("/deletePanel")) {
            Integer idlocation = Integer.parseInt(request.getParameter("idpanel"));
           
                try {

                    String ms = "";
                    if (idlocation > 0) {
                        ms = PanelDAO.deletepanel(idlocation);
                    }
                    if (ms.equals("ok")) {
                        request.setAttribute("msgsuccess", ms + " Delete!!");
                    } else {
                        request.setAttribute("msgError", ms + " Error!!");
                    }

                } catch (Exception e) {
                    request.setAttribute("msgError", e + " Error!!");
                }
            ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/panel.jsp");
            rd.forward(request, response);
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
         String path = request.getServletPath();

        if (path.equals("/savePanel")) {
            
            try {                
                String root = getServletContext().getRealPath("/Public/imagen/mapas/panels/");
                MultipartRequest mr = new MultipartRequest(request, root);
                String nombre = mr.getParameter("nombre");
               
                Integer idarea = 0;
                idarea = Integer.parseInt(mr.getParameter("area"));
               
                String img = null;
                img = mr.getOriginalFileName("img");

                String ms = "";
                if (nombre.equals(null) || nombre.equals("")) {
                    ms = " Datos NUlL ";
                } else {
                    ms = PanelDAO.savepanel(nombre,idarea,img);
                }
                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Add!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }
                
            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
                
            }
           
          ArrayList<DLAreas> lista = AreasDao.areas();
          request.setAttribute("areas", lista);
          RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/panel.jsp");
          rd.forward(request, response);
        }

        if (path.equals("/updatePanel")){
          
            try {
                 
                String root = getServletContext().getRealPath("/Public/imagen/mapas/panels/");
                MultipartRequest mr = new MultipartRequest(request, root);
                String nombre = mr.getParameter("nombre");
               
                
                Integer idlocation = Integer.parseInt(mr.getParameter("idpanel"));
                Integer idarea = Integer.parseInt(mr.getParameter("area"));
                 
               String img = mr.getOriginalFileName("img");
               
                String ms = "";
                if (idlocation > 0) {
                    ms = PanelDAO.updatepanel(idlocation, nombre, img,idarea);

                }

                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Update!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }
              
            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
                
            }  
             
            
             ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
           
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/panel.jsp");
           rd.forward(request, response);
        }
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
