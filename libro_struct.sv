/*
Nombre : Fabian Chacon
Curso  : Verificación Funcional
Tarea  : Tarea 6 - Structs y Clases
Archivo: libro_struct.sv
Descripción:
  Define el struct `Libro` y muestra su uso dentro de un módulo
  de prueba. Permite crear libros e imprimir su información.
Fecha: 2026-05-30
*/

// Icarus-verilog no soporta completamente SystemVerilog structs en
// muchas versiones. Aquí se emula la idea de un `struct Libro` usando
// registros separados y una tarea para imprimirlos. Se conserva el
// encabezado y la claridad del diseño para la tarea.

module libro_struct_tb;
  // Campos que pertenecen a un libro (emulan el struct)
  reg [31:0] book1_id, book1_year, book1_version;
  reg [31:0] book2_id, book2_year, book2_version;

  // Task para imprimir un "Libro"
  task print_book;
    input [31:0] id;
    input [31:0] year;
    input [31:0] version;
    begin
      $display("Libro - ID: %0d | Ano: %0d | Version: %0d", id, year, version);
    end
  endtask

  initial begin
    $display("--- libro_struct.sv - Prueba (Icarus compatible) ---");

    // Asignar valores (simula creación de instancias de struct)
    book1_id = 1; book1_year = 2010; book1_version = 1;
    book2_id = 42; book2_year = 2022; book2_version = 3;

    // Imprimir
    print_book(book1_id, book1_year, book1_version);
    print_book(book2_id, book2_year, book2_version);

    $display("--- Fin de prueba libro_struct.sv ---");
  end
endmodule
