% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Inserta un elemento en una lista en la posición dada.
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
%        List<int> list = new List<int> { 1, 2, 3, 4, 5 };
%        int elementToInsert = 99;
%        int position = 3;
%
%        List<int> result = InsertAt(elementToInsert, list, position);
%
%        Console.WriteLine("Lista original: " + string.Join(", ", list));
%        Console.WriteLine("Lista con el elemento insertado: " + string.Join(", ", result));
%    }
%
%    // Función que inserta un elemento en la posición especificada
%    static List<T> InsertAt<T>(T element, List<T> list, int position)
%    {
%        if (position < 1 || position > list.Count + 1)
%        {
%            throw new ArgumentOutOfRangeException("El índice debe estar en el rango válido.");
%        }
%
%        List<T> resultList = new List<T>(list);
%        resultList.Insert(position - 1, element);
%        return resultList;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Inserta un elemento en una lista en la posición dada.

% El índice K debe ser mayor que 0.
insert_at(X, L, 1, [X|L]).
insert_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, insert_at(X, T, K1, R).

% ----------------------------------------------