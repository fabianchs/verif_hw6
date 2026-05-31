/*
Instituto Tecnológico de Costa Rica
Nombre : Fabian Chacon
Carne: 2018135154
Curso  : Verificación Funcional
Tarea  : Tarea 6 - Structs y Clases
Archivo: compuertas_full_adder.sv
Descripción:
  Compuertas lógicas de 2 entradas y un Full Adder. Las compuertas se emulan con funciones
  y la tabla de verdad se imprime con $display.
*/

 
function [0:0] and_f;
  input [0:0] a;
  input [0:0] b;
  begin
    and_f = a & b;
  end
endfunction

function [0:0] or_f;
  input [0:0] a;
  input [0:0] b;
  begin
    or_f = a | b;
  end
endfunction

function [0:0] xor_f;
  input [0:0] a;
  input [0:0] b;
  begin
    xor_f = a ^ b;
  end
endfunction

function [0:0] xnor_f;
  input [0:0] a;
  input [0:0] b;
  begin
    xnor_f = ~(a ^ b);
  end
endfunction

function [0:0] nand_f;
  input [0:0] a;
  input [0:0] b;
  begin
    nand_f = ~(a & b);
  end
endfunction

function [0:0] nor_f;
  input [0:0] a;
  input [0:0] b;
  begin
    nor_f = ~(a | b);
  end
endfunction

// Task que imprime la tabla de verdad del FA usando las funciones
task full_adder_table;
  integer i, j, k;
  reg [0:0] A, B, Cin;
  reg [0:0] sum, cout, tmp;
  begin
    $display("--- Tabla de verdad Full Adder ---");
    $display("A B Cin | SUM Cout");
    for (i = 0; i < 2; i = i + 1) begin
      for (j = 0; j < 2; j = j + 1) begin
        for (k = 0; k < 2; k = k + 1) begin
          A = i; B = j; Cin = k;
          tmp = xor_f(A, B);
          sum = xor_f(tmp, Cin);
          cout = or_f(and_f(A,B), and_f(Cin, tmp));
          $display("%0b %0b  %0b  |  %0b   %0b", A, B, Cin, sum, cout);
        end
      end
    end
    $display("--- Fin tabla Full Adder ---");
  end
endtask

module compuertas_full_adder_tb;
  initial begin
    $display("--- compuertas_full_adder.sv - Prueba (Icarus compatible) ---");
    full_adder_table();
    $display("--- Fin de prueba compuertas_full_adder.sv ---");
  end
endmodule
