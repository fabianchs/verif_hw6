/*
Instituto Tecnológico de Costa Rica
Nombre : Fabian Chacon
Carne: 2018135154
Curso  : Verificación Funcional
Archivo: persona_estudiante.sv
Descripción:
  Emulación  usando registros y
  tareas. Además un módulo de prueba que inicializa e imprime los datos.
*/
 
module persona_estudiante_tb;
  // Fields para Persona
  reg [31:0] p_id;
  reg [31:0] p_edad;

  // Fields para Estudiante
  reg [31:0] s_id;
  reg [31:0] s_edad;
  reg [31:0] s_carne;
  reg [31:0] s_carrera_id;

  // Este task inicializa los fields de una persona
  task init_persona;
    input [31:0] id;
    input [31:0] edad;
    begin
      p_id = id; p_edad = edad;
    end
  endtask

  // Este task imprime los fields de una persona
  task print_persona;
    begin
      $display("Persona - ID: %0d | Edad: %0d", p_id, p_edad);
    end
  endtask

  // Este tasks inicializa los fields de un estudiante
  task init_estudiante;
    input [31:0] id;
    input [31:0] edad;
    input [31:0] carne;
    input [31:0] carrera_id;
    begin
      s_id = id; s_edad = edad; s_carne = carne; s_carrera_id = carrera_id;
    end
  endtask

  // Imprimir estudiante
  task print_estudiante;
    begin
      $display("Persona - ID: %0d | Edad: %0d", s_id, s_edad);
      if (s_carrera_id == 0)
        $display("  Estudiante - Carne: %0d | Carrera: Ingenieria Electronica", s_carne);
      else if (s_carrera_id == 1)
        $display("  Estudiante - Carne: %0d | Carrera: Ingenieria Mecatronica", s_carne);
      else
        $display("  Estudiante - Carne: %0d | Carrera: Otra", s_carne);
    end
  endtask

  initial begin
    $display("--- persona_estudiante.sv - Prueba (Icarus compatible) ---");
    init_persona(10, 45);
    init_estudiante(117450220, 27, 2018135154, 809); //son mis datos del TEC
    print_persona();
    print_estudiante();
    $display("--- Fin de prueba persona_estudiante.sv ---");
  end
endmodule
