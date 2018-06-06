/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.location;

import app.DAO.AreasDao;
import app.DAO.LocationDao;
import app.pojos.bean.DLAreas;
import app.pojos.bean.DLLocation;
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
@WebServlet(name = "servletLocation", urlPatterns = {"/servletLocation","/location","/saveLocation","/updateLocation","/deleteLocation"})
public class servletLocation extends HttpServlet {

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
        if (path.equals("/location")) {
             ArrayList<DLAreas> lista = AreasDao.areas();
            request.setAttribute("areas", lista);
           RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/location.jsp");
           rd.forward(request, response);
        }
 if (path.equals("/deleteLocation")) {
            Integer idlocation = Integer.parseInt(request.getParameter("idlocation"));
           
                try {

                    String ms = "";
                    if (idlocation > 0) {
                        ms = LocationDao.deletelocation(idlocation);

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
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/location.jsp");
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

        if (path.equals("/saveLocation")) {
            
            try {
                
                String root = getServletContext().getRealPath("/Public/imagen/mapas/location/");
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
                    ms = LocationDao.savelocation(nombre,idarea,img);
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
           RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/location.jsp");
           rd.forward(request, response);
        }

        if (path.equals("/updateLocation")) {
           
            try {
                 
                String root = getServletContext().getRealPath("/Public/imagen/mapas/location/");
                MultipartRequest mr = new MultipartRequest(request, root);
                String nombre = mr.getParameter("nombre");
               
                
                Integer idlocation = Integer.parseInt(mr.getParameter("idlocation"));
                Integer idarea = Integer.parseInt(mr.getParameter("area"));
                 
               String img = mr.getOriginalFileName("img");
                
                String ms = "";
                if (idlocation > 0) {
                    ms = LocationDao.updatelocation(idlocation, nombre, img,idarea);

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
           
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/location.jsp");
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
