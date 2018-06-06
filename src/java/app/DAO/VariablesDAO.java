/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLDispositivos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ricardo
 */

public class VariablesDAO {
     public static ArrayList<DLDispositivos> dispositivos() {
        String sql;
   
            sql = "select v.idvar,v.idvariable,v.nombre,v.descripcion,v.tamano,v.latitud,v.mensage0,v.mensage1,v.creado,\n" +
"v.modificado,v.estado,v.idtipo,p.nombre as panel,l.nombre as ubicacion ,u.nombres as usuario,e.nombre as tipoestado,v.img1,v.img2,v.idpanel,v.idubicacion,v.idtipo,t.nombre as tipovariable\n" +
"from variables v left join panels p on p.idpanel=v.idpanel \n" +
"left join localizacion l on l.idubicacion=v.idubicacion\n" +
"left join tuser u on u.iduser=v.idusmodifica\n" +
"inner join tipoestados e on e.idtipoestados=v.idtipoestados\n" +
"left join tiposvariables t on t.idtipo=v.idtipo\n" +
"where v.estado>0;";
        Connection cn;
        //objeto que alamcena los datos en memoria
        ResultSet rs;
        //variable para la intrccion sql
        Statement stm;
        //abrir conexion
        cn = Conexion.abrir();
        //
        DLDispositivos m;
        ArrayList<DLDispositivos> lista = new ArrayList<DLDispositivos>();
        try {
            //para ejucutar la coneccion sql
            stm = cn.createStatement();
            //regitros de alamacena en rs

            rs = stm.executeQuery(sql);
            while (rs.next()) {
                //objeto 
                m = new DLDispositivos();
                //encapsular los datos RS en el objeto UapPersona
                m.setIdvar(rs.getInt("idvar"));
                m.setIdvariable(rs.getString("idvariable"));
                m.setNombre(rs.getString("nombre"));
                m.setDescripcion(rs.getString("descripcion"));
                m.setTamano(rs.getString("tamano"));
                m.setLatitud(rs.getString("latitud"));
                m.setMensage0(rs.getString("mensage0"));
                m.setMensage1(rs.getString("mensage1"));        
                m.setCreado(rs.getString("creado"));                
                m.setModificado(rs.getString("modificado"));              
                m.setEstado(rs.getInt("estado")); 
                m.setPanel(rs.getString("panel"));   
                m.setUbicacion(rs.getString("ubicacion"));    
                m.setUsuario(rs.getString("usuario"));
                m.setTipoestado(rs.getString("tipoestado"));
                m.setImg1(rs.getString("img1"));
                m.setImg2(rs.getString("img2"));
                m.setIdpanel(rs.getInt("idpanel"));
                m.setIdubicacion(rs.getInt("idubicacion"));
                m.setIdtipo(rs.getInt("idtipo"));
                m.setTipo(rs.getString("tipovariable"));

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
