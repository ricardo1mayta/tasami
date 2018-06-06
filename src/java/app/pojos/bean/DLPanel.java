/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.pojos.bean;

/**
 *
 * @author Ricardo
 */
public class DLPanel {
    private int idpanel;
    private String nombre;
    private int idarea;
    private String narea;
    private String img;

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getNarea() {
        return narea;
    }

    public void setNarea(String narea) {
        this.narea = narea;
    }

    public int getIdpanel() {
        return idpanel;
    }

    public void setIdpanel(int idpanel) {
        this.idpanel = idpanel;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdarea() {
        return idarea;
    }

    public void setIdarea(int idarea) {
        this.idarea = idarea;
    }
}
