% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Aplana una lista anidada en una lista simple.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections;
% using System.Collections.Generic;
% using System.Linq;
%
% public class Program
% {
%    public static void Main()
%    {
%        // Ejemplo de lista anidada
%        var nestedList = new List<object> { 1, new List<object> { 2, 3 }, new List<object> { new List<object> { 4, 5 }, 6 }, 7 };
%        
%        // Llamada a la función de aplanamiento
%        var flattenedList = Flatten(nestedList);
%        
%        // Muestra la lista aplanada
%        Console.WriteLine(string.Join(", ", flattenedList));
%    }
%
%    // Función para aplanar una lista anidada
%    public static List<object> Flatten(object list)
%    {
%        var flatList = new List<object>();
%
%        if (list is IEnumerable enumerableList)
%        {
%            // Caso recursivo: recorrer la lista
%            foreach (var item in enumerableList)
%            {
%                flatList.AddRange(Flatten(item));
%            }
%        }
%        else
%        {
%            // Caso base: si el elemento no es una lista, añadirlo directamente
%            flatList.Add(list);
%        }
%
%        return flatList;
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Aplana una lista anidada en una lista simple.

% Caso base: la lista vacía se aplana a una lista vacía.
my_flatten([], []).

% Caso recursivo: si la cabeza es una lista, aplana la cabeza y la cola recursivamente.
my_flatten([H|T], Flat) :- my_flatten(H, FH), my_flatten(T, FT), append(FH, FT, Flat).

% Si la cabeza no es una lista, simplemente agrégala al resultado.
my_flatten(X, [X]) :- X \= [], \+ is_list(X).

% ----------------------------------------------