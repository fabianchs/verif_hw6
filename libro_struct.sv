/*
Instituto Tecnológico de Costa Rica
Nombre : Fabian Chacon
Carne: 2018135154
Curso  : Verificación Funcional
Archivo: libro_struct.sv
Descripción:
  Define el struct Libro y muestra su uso dentro de un módulo
  para pruebas. Permite crear libros e imprimir su información.
*/
 

module libro_struct_tb;
  // Registros con campos que pertenecen a un libro 
  reg [31:0] book1_id, book1_year, book1_version;
  reg [31:0] book2_id, book2_year, book2_version;

  //Paara imprimir un libro
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

    // Asignar valores, básicamentesimula creación de instancias de struct
    book1_id = 1; book1_year = 2010; book1_version = 1;
    book2_id = 42; book2_year = 2022; book2_version = 3;

    // Prints
    print_book(book1_id, book1_year, book1_version);
    print_book(book2_id, book2_year, book2_version);

    $display("--- Fin de prueba libro_struct.sv ---");
  end
endmodule
