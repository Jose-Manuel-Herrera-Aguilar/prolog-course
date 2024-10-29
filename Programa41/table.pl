% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera una tabla de verdad para una expresión lógica en dos variables.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class TablaDeVerdad
% {
%    static void Main(string[] args)
%    {
%        // Define la expresión lógica en forma de función lambda
%        Func<bool, bool, bool> expr = (A, B) => A && !B; // Ejemplo de expresión lógica
%
%        // Genera la tabla de verdad
%        Console.WriteLine("A\tB\tExpr");
%        GenerarTabla(expr);
%    }
%
%    // Método para generar la tabla de verdad con dos variables lógicas A y B
%    static void GenerarTabla(Func<bool, bool, bool> expr)
%    {
%        // Prueba todas las combinaciones de valores para A y B
%        for (int a = 0; a <= 1; a++)
%        {
%            for (int b = 0; b <= 1; b++)
%            {
%                bool A = a == 1;
%                bool B = b == 1;
%                
%                // Evalúa la expresión y muestra el resultado en la consola
%                Console.WriteLine($"{A}\t{B}\t{expr(A, B)}");
%            }
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una tabla de verdad para una expresión lógica en dos variables.
% A y B son las variables lógicas y Expr es la expresión lógica que se evalúa.

table(A, B, Expr) :-
    (A = true; A = false),
    (B = true; B = false),
    format("~w ~w ", [A, B]),
    (call(Expr) -> write(true); write(false)),
    nl,
    fail.
table(_, _, _).


% ----------------------------------------------