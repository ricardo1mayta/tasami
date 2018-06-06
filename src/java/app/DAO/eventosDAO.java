package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLEventos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Ricardo
 */
public class eventosDAO {
    public static ArrayList<DLEventos> eventos() {
        String sql;
   
            sql = "select idevento,idvariable,fechainicio,fechafin,estado,estado2,orden from eventosordenados order by orden asc;";
        

        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLEventos m;
        ArrayList<DLEventos> lista = new ArrayList<DLEventos>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLEventos();
                //encapsular los datos RS en el objeto 
                 m.setIdevento(rs.getInt(1));
                m.setIdvariable(rs.getString(2));
                m.setFechainicio(rs.getString(3));
                m.setFechafin(rs.getString(4));
                m.setEstado(rs.getString(5));
                m.setEstado2(rs.getString(6));
                m.setOrden(rs.getString(7));
                
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
