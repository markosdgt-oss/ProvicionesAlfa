package com.mycompany.provicionesalfa.DAO;

import com.mycompany.provicionesalfa.config.conexion; 
import com.mycompany.provicionesalfa.modelo.producto;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class productoDAO {
    conexion cn = new conexion(); 
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // 1. MÉTODO PARA AGREGAR
    public int agregar(producto p) {
        // Ajustado: Nombre y Precio (con mayúscula inicial según tu DB)
        String sql = "INSERT INTO producto (Nombre, Precio) VALUES (?, ?)";
        int r = 0;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setDouble(2, p.getPrecio());
            r = ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println("❌ Error al agregar producto: " + e.getMessage());
        } finally {
            try { if (con != null) con.close(); } catch (SQLException ex) {}
        }
        return r;
    }

    // 2. MÉTODO PARA BUSCAR POR NOMBRE
    public List<producto> buscar(String nombre) {
        List<producto> lista = new ArrayList<>();
        // Ajustado: Nombre (con mayúscula)
        String sql = "SELECT * FROM producto WHERE Nombre LIKE ?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, "%" + nombre + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                producto p = new producto();
                // Ajuste de columnas: Id_producto, Nombre, Precio
                p.setId(rs.getInt("Id_producto"));
                p.setNombre(rs.getString("Nombre"));
                p.setPrecio(rs.getDouble("Precio"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.err.println("❌ Error en buscar nombre: " + e.getMessage());
        }
        return lista;
    }

    // 3. MÉTODO PARA LISTAR POR ID
    public producto listarId(int id) {
        // Ajustado: Id_producto
        String sql = "SELECT * FROM producto WHERE Id_producto = ?";
        producto p = new producto();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setId(rs.getInt("Id_producto"));
                p.setNombre(rs.getString("Nombre"));
                p.setPrecio(rs.getDouble("Precio"));
            }
        } catch (SQLException e) {
            System.err.println("❌ Error al buscar ID: " + e.getMessage());
        }
        return p;
    }

    // 4. MÉTODO PARA LISTAR TODO EL INVENTARIO
    public List<producto> listar() {
        List<producto> lista = new ArrayList<>();
        String sql = "SELECT * FROM producto";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto p = new producto();
                // Ajuste de columnas: Id_producto, Nombre, Precio
                p.setId(rs.getInt("Id_producto"));
                p.setNombre(rs.getString("Nombre"));
                p.setPrecio(rs.getDouble("Precio"));
                
                // Debug para consola
                System.out.println("✅ Cargado: " + p.getNombre());
                
                lista.add(p);
            }
        } catch (SQLException e) {
            System.err.println("❌ Error al listar productos: " + e.getMessage());
        }
        return lista;
    }
}