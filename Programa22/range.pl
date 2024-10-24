% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Crea una lista con todos los enteros dentro de un rango dado.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    static void Main(string[] args)
%    {
%        // Llamada al método Range con un rango de ejemplo
%        List<int> result = Range(1, 5);
%        // Imprimir los resultados
%        Console.WriteLine(string.Join(", ", result));
%    }
%
%    // Método que genera una lista con los enteros dentro del rango [I, K]
%    static List<int> Range(int I, int K)
%    {
%        // Caso base: cuando el inicio y el final son iguales
%        if (I == K)
%        {
%            return new List<int> { I };
%        }
%        // Caso recursivo: agregar el inicio a la lista y continuar con el siguiente número
%        else if (I < K)
%        {
%            List<int> result = new List<int> { I };
%            result.AddRange(Range(I + 1, K));
%            return result;
%        }
%        // Manejo de errores o casos donde el rango es incorrecto
%        else
%        {
%            throw new ArgumentException("El valor de I debe ser menor o igual al valor de K.");
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Crea una lista con todos los enteros dentro de un rango dado.

% Caso base: cuando el inicio y el final son iguales.
range(I, I, [I]).

% Caso recursivo: agrega el inicio a la lista y continúa con el siguiente número.
range(I, K, [I|R]) :- I < K, I1 is I + 1, range(I1, K, R).

% ----------------------------------------------