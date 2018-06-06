/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLMenu;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Sistemas05
 */
public class MenuDAO {
     public static ArrayList<DLMenu> menu(int idmenu,int idus) {
        String sql;
   
            sql = "select m.idmenu,m.nombre,m.link from menu_web m inner join detallemenu dm on dm.idmenu=m.idmenu where m.padre='"+idmenu+"' and dm.estado=1 and dm.idusuario='"+idus+"';";
        

        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLMenu m;
        ArrayList<DLMenu> lista = new ArrayList<DLMenu>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLMenu();
                //encapsular los datos RS en el objeto UapPersona
                m.setIdmenu(rs.getInt(1));
                m.setNombre(rs.getString(2));
                m.setLink(rs.getString(3));
                lista.add(m);
            }
            // System.out.println("error en la lista" );
            stm.close();
            rs.close();
            cn.close();
        } catch (Exception ex) {
            System.out.println("error en la lista" + ex);
        }
        return lista;

    }

    
}
