/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLLocation;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Ricardo
 */
public class LocationDao {

    public static ArrayList<DLLocation> location() {
        String sql;
        sql = "SELECT l.idubicacion,l.nombre,l.estado,l.idarea,l.img,a.nombre  FROM localizacion l inner join areas a on a.idarea=l.idarea where l.estado>0;";

        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLLocation m;
        ArrayList<DLLocation> lista = new ArrayList<DLLocation>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLLocation();
                //encapsular los datos
                m.setIdlocation(rs.getInt(1));
                m.setNombre(rs.getString(2));
                m.setIdarea(rs.getInt(4));
                m.setImg(rs.getString(5));
                m.setNarea(rs.getString(6));

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

    public static String savelocation(String nombre, int idarea, String img) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria

        String resultado = null;
        try {
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_savelocation ?,?,?,? ");
            //se cargan los parametros de entrada
            proc.setString(1, nombre);//Tipo String
            proc.setString(2, img);//Tipo entero
            proc.setInt(3, idarea);//Tipo entero
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } catch (Exception e) {
            System.out.println(e);
        }
        return resultado;
    }

    public static String updatelocation(int idlocation, String nombre, String img, int idarea) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria

        String resultado = null;
        try {
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_updatelocation ?,?,?,?,? ");
            //se cargan los parametros de entrada

            proc.setInt(1, idlocation);
            proc.setString(2, nombre);//Tipo String
            proc.setString(3, img);//Tipo entero
            proc.setInt(4, idarea);//Tipo entero
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } catch (Exception e) {
            System.out.println(e);
        }
        return resultado;
    }

    public static String deletelocation(int idlocation) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria

        String resultado = null;
        try {
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_deletelocation ?,? ");
            //se cargan los parametros de entrada
            proc.setInt(1, idlocation);
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } catch (Exception e) {
            System.out.println(e);
        }
        return resultado;
    }
}
