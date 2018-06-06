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
public class DLLocation {
    private int idlocation;
    private String nombre;
    private int idarea;
    private String img;
    private String Narea;

    public String getNarea() {
        return Narea;
    }

    public void setNarea(String Narea) {
        this.Narea = Narea;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    

    public int getIdlocation() {
        return idlocation;
    }

    public void setIdlocation(int idlocation) {
        this.idlocation = idlocation;
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
