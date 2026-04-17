package com.mycompany.provicionesalfa.modelo;

/**
 * Clase de modelo para representar un Producto en ProvicionesAlfa.
 * Sigue el estándar de Java Bean.
 */
public class producto {
    
    // Atributos privados coincidentes con la base de datos
    private int id;
    private String nombre;
    private double precio;

    // 1. Constructor vacío (Indispensable para frameworks y JSPs)
    public producto() {
    }

    // 2. Constructor con parámetros (Útil para crear objetos rápidamente en el DAO)
    public producto(int id, String nombre, double precio) {
        this.id = id;
        this.nombre = nombre;
        this.precio = precio;
    }

    // 3. Métodos Getter y Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    // 4. Método toString (Opcional pero RECOMENDADO para depuración)
    // Esto te permite hacer System.out.println(p) y ver los datos reales
    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", nombre=" + nombre + ", precio=" + precio + '}';
    }
}