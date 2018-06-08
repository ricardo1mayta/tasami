/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.DAO;

import app.conexion.Conexion;
import app.pojos.bean.DLDispositivos;
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
public class VariablesDAO {

    public static ArrayList<DLDispositivos> dispositivos() {
        String sql;

        sql = "select v.idvar,v.idvariable,v.nombre,v.descripcion,v.tamano,v.latitud,v.mensage0,v.mensage1,v.creado,\n"
                + "v.modificado,v.estado,v.idtipo,p.nombre as panel,l.nombre as ubicacion ,u.nombres as usuario,e.nombre as tipoestado,v.img1,v.img2,isnull(v.idpanel,0) as idpanel,isnull(v.idubicacion,0) as idubicacion,isnull(v.idtipo,0) as idtipo,t.nombre as tipovariable\n"
                + "from variables v left join panels p on p.idpanel=v.idpanel \n"
                + "left join localizacion l on l.idubicacion=v.idubicacion\n"
                + "left join tuser u on u.iduser=v.idusmodifica\n"
                + "left join tipoestados e on e.idtipoestados=v.idtipoestados\n"
                + "left join tiposvariables t on t.idtipo=v.idtipo\n"
                + "where v.estado>0;";
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
     public static String updatevariable(int idvariable, String nombre, String descripcion,String ms1,String ms2, int idtipoestado,int iduscrea,int idmodifica,int idtipo,int idpanel,int idubicacion,String img1,String img2) {
        //abrimos la ejecucion
        Connection cn = Conexion.abrir();
        //objeto que alamcena los datos en memoria

        String resultado = null;
        try {
            // se crea instancia a procedimiento, los parametros de entrada y salida se simbolizan con el signo ?
            CallableStatement proc = cn.prepareCall("exec sp_updatevariables ?,?,?,?,?,?,?,?,?,?,?,?,?,? ");
            //se cargan los parametros de entrada

            proc.setInt(1, idvariable);
            proc.setString(2, nombre);//Tipo String
            proc.setString(3, descripcion);//Tipo entero
            proc.setString(4, ms1);
            proc.setString(5, ms2);
            proc.setInt(6, idtipoestado);//Tipo entero
            proc.setInt(7, iduscrea);
            proc.setInt(8, idmodifica);
            proc.setInt(9, idpanel);
            proc.setInt(10, idtipo);
            proc.setInt(11, idubicacion);
             proc.setString(12, img1);
              proc.setString(13, img2);
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
