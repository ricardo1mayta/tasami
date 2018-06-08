/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.dispositivos;

import app.DAO.AreasDao;
import app.DAO.LocationDao;
import app.DAO.PanelDAO;
import app.DAO.TiposignalDAO;
import app.DAO.TipovariableDAO;
import app.DAO.VariablesDAO;
import app.pojos.bean.DLAreas;
import app.pojos.bean.DLLocation;
import app.pojos.bean.DLPanel;
import app.pojos.bean.DLTiposignal;
import app.pojos.bean.DLTipovariables;

import app.pojos.bean.DLTiposignal;
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
@WebServlet(name = "serveletVariables", urlPatterns = {"/serveletVariables", "/sensors", "/updateSensor"})
public class servletVariables extends HttpServlet {

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
        
        if (path.equals("/sensors")) {

            ArrayList<DLTiposignal> lista2 = TiposignalDAO.tiposignal();
            request.setAttribute("tiposignal", lista2);
            ArrayList<DLTipovariables> lista3 = TipovariableDAO.tipovariable();
            request.setAttribute("tipovariable", lista3);
            ArrayList<DLPanel> listap = PanelDAO.panel();
            request.setAttribute("panels", listap);
            ArrayList<DLLocation> listal = LocationDao.location();
            request.setAttribute("location", listal);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/variables.jsp");
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

        if (path.equals("/saveSensor")) {

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
                    ms = LocationDao.savelocation(nombre, idarea, img);
                }
                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Add!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }

            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
            }

             
            
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/location.jsp");
            rd.forward(request, response);
        }

        if (path.equals("/updateSensor")) {

             
                try {
                    String root = getServletContext().getRealPath("/Public/imagen/mapas/dispositivos/");
                    MultipartRequest mr = new MultipartRequest(request, root);
                    int idvariable = Integer.parseInt(mr.getParameter("id"));
                    String nombre = mr.getParameter("name");
                    String desc = mr.getParameter("description");
                    String mess1 = mr.getParameter("message1");
                    String mess2 = mr.getParameter("message2");
                    Integer idlocation = Integer.parseInt(mr.getParameter("location"));
                    Integer idpanel = Integer.parseInt(mr.getParameter("panel"));
                    Integer idsignal = Integer.parseInt(mr.getParameter("signal"));
                    Integer idtiposensor = Integer.parseInt(mr.getParameter("tiposensor"));
                    String img1 = mr.getOriginalFileName("img1");
                    String img2 = mr.getOriginalFileName("img2");
                    //out.println(nombre + "| |" + desc + "| |" + mess1 + "| |" + mess2 + "| |" + idlocation + "| |" + idpanel + "| |" + idsignal + "| |" + idtiposensor + "| |" + img1 + "| |" + img2);
                    String ms = "";
                    if (idvariable > 0) {
                        ms = VariablesDAO.updatevariable(idvariable, nombre, desc, mess1, mess2, idsignal, 1, 1, idtiposensor, idpanel, idlocation, img1, img2);
                       //  out.println("ejetuto:"+ms);
                    }
                    if (ms.equals("ok")) {
                        request.setAttribute("msgsuccess", ms + " Update!!");
                       // out.println("Ok:"+ms);
                    } else {
                        request.setAttribute("msgError", ms + " Error!!");
                       // out.println("error:"+ms);
                    }                    
                } catch (Exception e) {
                    request.setAttribute("msgError", e + " Error!!");
                   // out.println(e);
                }          

            ArrayList<DLTiposignal> lista2 = TiposignalDAO.tiposignal();
            request.setAttribute("tiposignal", lista2);
            ArrayList<DLTipovariables> lista3 = TipovariableDAO.tipovariable();
            request.setAttribute("tipovariable", lista3);
            ArrayList<DLPanel> listap = PanelDAO.panel();
            request.setAttribute("panels", listap);
            ArrayList<DLLocation> listal = LocationDao.location();
            request.setAttribute("location", listal);
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/variables.jsp");
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
