% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Duplicar los elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%    static void Main(string[] args)
%    {
%        List<int> inputList = new List<int> { 1, 2, 3, 4 };
%        List<int> duplicatedList = DuplicateElements(inputList);
%
%        Console.WriteLine("Original list: " + string.Join(", ", inputList));
%        Console.WriteLine("Duplicated list: " + string.Join(", ", duplicatedList));
%    }
%
%    // Método recursivo para duplicar los elementos de la lista
%    static List<T> DuplicateElements<T>(List<T> list)
%    {
%        if (list.Count == 0)
%        {
%            // Caso base: si la lista está vacía, retorna una lista vacía.
%            return new List<T>();
%        }
%        else
%        {
%            // Caso recursivo: duplicar el primer elemento y continuar con el resto.
%            var head = list[0];
%            var tail = list.Skip(1).ToList();
%            var duplicatedTail = DuplicateElements(tail);
%
%            // Retorna el primer elemento duplicado seguido de la duplicación del resto.
%            return new List<T> { head, head }.Concat(duplicatedTail).ToList();
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista.

% Caso base: la lista vacía se mantiene vacía.
dupli([], []).

% Caso recursivo: duplica el primer elemento y continúa con el resto.
dupli([H|T], [H,H|R]) :- dupli(T, R).

% ----------------------------------------------