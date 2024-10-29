% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera el código gray en N bits.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class GrayCode
% {
%    // Genera la secuencia de código Gray de N bits
%    public static List<string> GenerateGrayCode(int n)
%    {
%        if (n <= 0) return new List<string>();
%
%        // Caso base: código Gray para 1 bit
%        if (n == 1)
%        {
%            return new List<string> { "0", "1" };
%        }
%
%        // Llamada recursiva para generar el código Gray de n - 1 bits
%        var previousGrayCode = GenerateGrayCode(n - 1);
%
%        // Construcción de la secuencia agregando el prefijo "0" y "1"
%        var result = new List<string>();
%
%        // Prefijo "0" a cada elemento de la secuencia
%        foreach (var code in previousGrayCode)
%        {
%            result.Add("0" + code);
%        }
%
%        // Prefijo "1" a cada elemento de la secuencia en orden inverso
%        previousGrayCode.Reverse();
%        foreach (var code in previousGrayCode)
%        {
%            result.Add("1" + code);
%        }
%
%        return result;
%    }
%
%    // Ejemplo de uso
%    public static void Main()
%    {
%        int n = 3; // Número de bits
%        var grayCodeSequence = GenerateGrayCode(n);
%
%        Console.WriteLine("Código Gray de " + n + " bits:");
%        foreach (var code in grayCodeSequence)
%        {
%            Console.WriteLine(code);
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera el código Gray de N bits.
% La secuencia de código Gray es una secuencia binaria en la que dos valores consecutivos difieren en solo un bit.

% Caso base: código Gray de 1 bit.
gray(1, ['0', '1']).

% Regla recursiva para el código Gray de N bits.
gray(N, C) :-
    N > 1,
    N1 is N - 1,
    gray(N1, C1),
    maplist(atom_concat('0'), C1, C0),
    reverse(C1, C1R),
    maplist(atom_concat('1'), C1R, C1G),
    append(C0, C1G, C).

% Ejemplo de uso:
% Ejecuta gray(N, C) con el valor de N deseado para obtener el código Gray de N bits.
% Ejemplo: gray(3, C).

% ----------------------------------------------