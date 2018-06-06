/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app.pojos.bean;

/**
 *
 * @author Sistemas05
 */
public class DLUsuarios {
    private int idusuario;
    private String userPass;
    private String userName;
    private String userUsuario ;

    /**
     * @return the userPass
     */
    public String getUserPass() {
        return userPass;
    }

    /**
     * @param userPass the userPass to set
     */
    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the userUsuario
     */
    public String getUserUsuario() {
        return userUsuario;
    }

    /**
     * @param userUsuario the userUsuario to set
     */
    public void setUserUsuario(String userUsuario) {
        this.userUsuario = userUsuario;
    }

    /**
     * @return the idusuario
     */
    public int getIdusuario() {
        return idusuario;
    }

    /**
     * @param idusuario the idusuario to set
     */
    public void setIdusuario(int idusuario) {
        this.idusuario = idusuario;
    }

    
}
