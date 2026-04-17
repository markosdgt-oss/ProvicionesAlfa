package com.mycompany.provicionesalfa.config; // Ahora se llama config, ya no hay choque

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
    Connection con;
    
    private String url = "jdbc:mysql://localhost:3307/provicionesbd?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private String user = "root";
    private String pass = ""; 

    public Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            System.out.println("✅ Conexión exitosa a ProvicionesAlfa");
        } catch (Exception e) {
            System.err.println("❌ Error de conexión: " + e.getMessage());
        }
        return con;
    }
}