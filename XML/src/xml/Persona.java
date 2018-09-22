/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package xml;

/**
 *
 * @author ruben
 */
public class Persona {
    public String CEDULA;
    public String CODELEC;
    public String SEXO;
    public String FECHACADUC;
    public String JUNTA;
    public String NOMBRE;
    public String APELLIDO1;
    public String APELLIDO2;

    public Persona(String CEDULA, String CODELEC, String SEXO, String FECHACADUC, String JUNTA, String NOMBRE, String APELLIDO1, String APELLIDO2) {
        this.CEDULA = CEDULA;
        this.CODELEC = CODELEC;
        this.SEXO = SEXO;
        this.FECHACADUC = FECHACADUC;
        this.JUNTA = JUNTA;
        this.NOMBRE = NOMBRE;
        this.APELLIDO1 = APELLIDO1;
        this.APELLIDO2 = APELLIDO2;
    }
    
}
