% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el k-esimo elemento de una lista.
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
%        List<int> list = new List<int> { 10, 20, 30, 40, 50 };
%        int position = 3;
%        try
%        {
%            int element = ElementAt(list, position);
%            Console.WriteLine($"El elemento en la posición {position} es: {element}");
%        }
%        catch (ArgumentException e)
%        {
%            Console.WriteLine(e.Message);
%        }
%    }
%
%    static T ElementAt<T>(List<T> list, int position)
%    {
%        // Caso base: si la posición es 1, devolvemos el primer elemento
%        if (position == 1)
%        {
%            return list[0];
%        }
%        // Si la posición es mayor a 1, seguimos buscando en la sublista
%        else if (position > 1 && list.Count > 1)
%        {
%            return ElementAt(list.GetRange(1, list.Count - 1), position - 1);
%        }
%        else
%        {
%            throw new ArgumentException("La posición está fuera del rango de la lista.");
%        }
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Predicado element_at(X, List, 1). que determina el penúltimo
% elemento X de la lista List.

% Caso base: el antepenultimo elemento es cuando la lista tiene solo 3 elementos.
element_at(X, [X|_], 1).

% Caso recursivo: ignora el primer elemento de la lista y sigue evaluando.
element_at(X, [X|_], 1).
element_at(X, [_|T], K) :- K > 1, K1 is K - 1, element_at(X, T, K1).

% Ejemplo de uso:
% ?- element_at(X, [a, b, c, d]).
% X = {a, b, c, d}. cualquiera dentro del rango de la lista
% ----------------------------------------------