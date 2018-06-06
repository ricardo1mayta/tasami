/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.controlador.area;

import app.DAO.AreasDao;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Ricardo
 */
@WebServlet(name = "area", urlPatterns = {"/saveArea", "/updateArea", "/areas", "/deleteArea"})
public class serveletArea extends HttpServlet {

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
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        

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

        if (path.equals("/saveArea")) {
            try {
                String root = getServletContext().getRealPath("/Public/imagen/mapas/areas/");
                MultipartRequest mr = new MultipartRequest(request, root);
                String nombre = mr.getParameter("nombre");
                String img = null;
                img = mr.getOriginalFileName("img");

                String ms = "";
                if (nombre.equals(null) || nombre.equals("")) {
                    ms = " Datos NUlL ";
                } else {
                    ms = AreasDao.savearea(nombre, img);
                }
                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Add!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }

            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
            }

            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/areas.jsp");
            rd.forward(request, response);
        }

        if (path.equals("/updateArea")) {
            try {

                String root = getServletContext().getRealPath("/Public/imagen/mapas/areas/");
                MultipartRequest mr = new MultipartRequest(request, root);
                String nombre = mr.getParameter("nombre");
                Integer idarea = Integer.parseInt(mr.getParameter("idarea"));
                String img = null;
                img = mr.getOriginalFileName("img");

                String ms = "";
                if (idarea > 0) {
                    ms = AreasDao.updatearea(idarea, nombre, img);

                }

                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Update!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }

            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
            }

            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/areas.jsp");
            rd.forward(request, response);
        }
       
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String path = request.getServletPath();
        if (path.equals("/areas")) {
            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/areas.jsp");
            rd.forward(request, response);
        }
        if (path.equals("/deleteArea")) {
            Integer idarea = Integer.parseInt(request.getParameter("idarea"));

            try {

                String ms = "";
                if (idarea > 0) {
                    ms = AreasDao.deletearea(idarea);

                }

                if (ms.equals("ok")) {
                    request.setAttribute("msgsuccess", ms + " Delete!!");
                } else {
                    request.setAttribute("msgError", ms + " Error!!");
                }

            } catch (Exception e) {
                request.setAttribute("msgError", e + " Error!!");
            }

            RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/admin/areas.jsp");
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
