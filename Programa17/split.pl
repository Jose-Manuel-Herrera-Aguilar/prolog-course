% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Divide una lista en dos partes.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    static void Main()
%    {
%        List<int> originalList = new List<int> { 1, 2, 3, 4, 5 };
%        int lengthOfFirstPart = 3;
%
%        // Llamar al método split
%        var (firstPart, secondPart) = SplitList(originalList, lengthOfFirstPart);
%
%        // Imprimir resultados
%        Console.WriteLine("Primera parte: " + string.Join(", ", firstPart));
%        Console.WriteLine("Segunda parte: " + string.Join(", ", secondPart));
%    }
%
%    // Método que divide una lista en dos partes
%    static (List<T>, List<T>) SplitList<T>(List<T> list, int n)
%    {
%        if (n <= 0 || list.Count == 0)
%        {
%            return (new List<T>(), new List<T>(list));
%        }
%        else
%        {
%            var firstPart = new List<T> { list[0] };
%            var (restFirstPart, secondPart) = SplitList(list.GetRange(1, list.Count - 1), n - 1);
%            firstPart.AddRange(restFirstPart);
%            return (firstPart, secondPart);
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Divide una lista en dos partes.

% La longitud de la primera parte está dada por el segundo argumento.
split(L, 0, [], L).
split([H|T], N, [H|L1], L2) :- N > 0, N1 is N - 1, split(T, N1, L1, L2).

% ----------------------------------------------