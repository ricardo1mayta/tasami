/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.conexion;
import app.DAO.AreasDao;
import app.DAO.TiposignalDAO;
import app.DAO.TipovariableDAO;
import app.DAO.VariablesDAO;
import app.DAO.eventosDAO;
import app.conexion.Conexion;
import app.pojos.bean.DLDispositivos;
import app.pojos.bean.DLEventos;
import app.pojos.bean.DLTiposignal;
import app.pojos.bean.DLTipovariables;
import java.sql.Connection;
import java.util.ArrayList;
/**
 *
 * @author Sistemas05
 */
public class tett {
     public static void main(String[] args) {
         /*
         Connection cn;
         cn=Conexion.abrir();
         
     System.out.println("jfkdjfk");*/
         
         ArrayList<DLDispositivos> lista =VariablesDAO.dispositivos();
        int n = 0;
        String res = "";
        for (DLDispositivos x : lista) {
            System.out.println(x.getIdvariable());
        }
        /*
        String ms= AreasDao.savearea("RDDrtd","jdjd.com");
        System.out.println("ms"+ms);
         */
           /* 
        ArrayList<DLTipovariables> lista =TipovariableDAO.tipovariable();
        int n = 0;
        String res = "";
        for (DLTipovariables x : lista) {
          System.out.println(x.getNombre());
        }
     
        String ms= AreasDao.savearea("RDDrtd","jdjd.com");
        System.out.println("ms"+ms);*/
    }
}


