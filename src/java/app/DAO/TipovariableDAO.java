/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLTipovariables;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ricardo
 */
public class TipovariableDAO {
    
      public static ArrayList<DLTipovariables> tipovariable() {
        String sql;   
            sql = "select idtipo,nombre from tiposvariables where estado >0;";

        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLTipovariables m;
        ArrayList<DLTipovariables> lista = new ArrayList<DLTipovariables>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLTipovariables();
                //encapsular los datos
                 m.setIdtipovariable(rs.getInt(1));
                  m.setNombre(rs.getString(2));
               
              
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
