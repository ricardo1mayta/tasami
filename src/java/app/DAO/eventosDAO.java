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
   
            sql = "select idevento,idvariable,nombre,fechainicio,fechafin,estado,idtipoestados,mensage0,"
                    + "mensage1,panel,ubicacion,tipoestado,tipovariable from eventosordenados where estado=1 order by idtipoestados asc;";
        

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
                m.setNombre(rs.getString(3));
                m.setFechainicio(rs.getString(4));
                m.setFechafin(rs.getString(5));
                m.setEstado(rs.getString(6));
                m.setIdtipoestados(rs.getInt(7));
                m.setMensage0(rs.getString(8));
                m.setMensage1(rs.getString(9));
                m.setPanel(rs.getString(10));
                m.setUbicacion(rs.getString(11));
                m.setTipoestado(rs.getString(12));
                m.setTipovariable(rs.getString(13));
                
                
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
    public static ArrayList<DLEventos> eventos2() {
        String sql;
   
            sql = "select idevento,idvariable,nombre,fechainicio,fechafin,estado,idtipoestados,mensage0,"
                    + "mensage1,panel,ubicacion,tipoestado,tipovariable from eventosordenados where estado=0 order by idtipoestados asc;";
        

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
                m.setNombre(rs.getString(3));
                m.setFechainicio(rs.getString(4));
                m.setFechafin(rs.getString(5));
                m.setEstado(rs.getString(6));
                m.setIdtipoestados(rs.getInt(7));
                m.setMensage0(rs.getString(8));
                m.setMensage1(rs.getString(9));
                m.setPanel(rs.getString(10));
                m.setUbicacion(rs.getString(11));
                m.setTipoestado(rs.getString(12));
                m.setTipovariable(rs.getString(13));
                
                
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
