package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLAreas;
import app.pojos.bean.DLMenu;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
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
public class AreasDao {
     public static ArrayList<DLAreas> areas() {
        String sql;
   
            sql = "select idarea,nombre,img from areas where estado>0;";
        

        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLAreas m;
        ArrayList<DLAreas> lista = new ArrayList<DLAreas>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLAreas();
                //encapsular los datos RS 
                m.setIdarea(rs.getInt(1));
                m.setNombre(rs.getString(2));
                m.setImg(rs.getString(3));
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
      public static String savearea(String nombre,String img) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria
       
        String resultado=null;
       try {            
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_savearea ?,?,? ");
            //se cargan los parametros de entrada
            proc.setString(1, nombre);//Tipo String
            proc.setString(2, img);//Tipo entero
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
       return resultado;
      }
      public static String updatearea(int idarea, String nombre,String img) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria
       
        String resultado=null;
       try {            
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_updatearea ?,?,?,? ");
            //se cargan los parametros de entrada
            proc.setInt(1,idarea);
            proc.setString(2, nombre);//Tipo String
            proc.setString(3, img);//Tipo entero
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
       return resultado;
      }
         public static String deletearea(int idarea) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria
       
        String resultado=null;
       try {            
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_deletearea ?,? ");
            //se cargan los parametros de entrada
            proc.setInt(1,idarea);          
            // parametros de salida
            proc.registerOutParameter("sms", Types.VARCHAR);//Tipo String
            // Se ejecuta el procedimiento almacenado
            proc.execute();            
            // devuelve el valor del parametro de salida del procedimiento
            resultado = proc.getString("sms");
        } 
       catch (Exception e) {                  
            System.out.println(e);
       }
       return resultado;
      }
             
    
}
