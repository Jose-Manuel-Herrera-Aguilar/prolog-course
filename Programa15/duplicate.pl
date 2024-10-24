% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Duplica los elementos de una lista un número dado de veces.
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
%    static void Main()
%    {
%        List<int> inputList = new List<int> { 1, 2, 3 };
%        int n = 2; // Número de veces que se duplicará cada elemento
%
%        List<int> result = Dupli(inputList, n);
%
%        Console.WriteLine("Lista original: " + string.Join(", ", inputList));
%        Console.WriteLine("Lista duplicada: " + string.Join(", ", result));
%    }
%
%    // Método para duplicar los elementos de una lista un número dado de veces
%    static List<T> Dupli<T>(List<T> list, int n)
%    {
%        if (list.Count == 0)
%        {
%            return new List<T>();
%        }
%
%        T head = list[0];
%        List<T> tail = list.Skip(1).ToList();
%        List<T> duplicatedHead = Duplicate(head, n);
%
%        List<T> result = Dupli(tail, n);
%        duplicatedHead.AddRange(result);
%        return duplicatedHead;
%    }
%
%    // Método para crear una lista con N repeticiones del elemento X
%    static List<T> Duplicate<T>(T element, int n)
%    {
%        List<T> result = new List<T>();
%        for (int i = 0; i < n; i++)
%        {
%            result.Add(element);
%        }
%        return result;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Duplica los elementos de una lista un número dado de veces.
% Caso base: la lista vacía se mantiene vacía.
dupli([], _, []).
% Caso recursivo: duplica el primer elemento N veces y continúa con el resto.
dupli([H|T], N, R) :- duplicate(H, N, D), dupli(T, N, R1), append(D, R1, R).

% Crea una lista con N repeticiones del elemento X.
duplicate(_, 0, []).
duplicate(X, N, [X|R]) :- N > 0, N1 is N - 1, duplicate(X, N1, R).

% ----------------------------------------------