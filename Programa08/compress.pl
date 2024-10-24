% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Eliminar duplicados consecutivos de los elementos de una lista.
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
%    // Método para eliminar duplicados consecutivos de una lista
%    static List<T> Compress<T>(List<T> list)
%    {
%        // Caso base: si la lista está vacía o tiene un solo elemento, no hay duplicados
%        if (list == null || list.Count <= 1)
%            return list;
%
%        // Lista donde guardaremos el resultado sin duplicados consecutivos
%        List<T> result = new List<T>();
%
%        // Agregamos el primer elemento a la lista de resultado
%        result.Add(list[0]);
%
%        // Recorremos la lista desde el segundo elemento
%        for (int i = 1; i < list.Count; i++)
%        {
%            // Solo añadimos el elemento si es distinto al anterior
%            if (!list[i].Equals(list[i - 1]))
%            {
%               result.Add(list[i]);
%            }
%        }
%
%        return result;
%    }
%
%    static void Main(string[] args)
%    {
%        // Ejemplo de uso con una lista de enteros
%        List<int> list = new List<int> { 1, 1, 2, 2, 3, 3, 3, 4, 4, 5 };
%        
%        // Aplicamos el método Compress
%        List<int> compressedList = Compress(list);
%
%        // Imprimimos el resultado
%        Console.WriteLine("Lista original: " + string.Join(", ", list));
%        Console.WriteLine("Lista sin duplicados consecutivos: " + string.Join(", ", compressedList));
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina duplicados consecutivos de una lista.

% Caso base: una lista vacía se mantiene vacía.
compress([], []).

% Si queda un solo elemento, no hay duplicados.
compress([X], [X]).

% Caso recursivo: si el primer y segundo elemento son iguales, ignora el primero.
compress([X,X|T], R) :- compress([X|T], R).

% Si el primer y segundo elemento son distintos, conserva el primero.
compress([X,Y|T], [X|R]) :- X \= Y, compress([Y|T], R).

% ----------------------------------------------