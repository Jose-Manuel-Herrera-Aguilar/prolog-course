% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera todas las combinaciones de K elementos seleccionados de una lista dada.
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
%        // Ejemplo de uso
%        List<List<int>> listaDeListas = new List<List<int>>
%        {
%            new List<int> { 1, 2, 3 },
%            new List<int> { 4 },
%            new List<int> { 5, 6 },
%            new List<int> { 7, 8, 9, 10 }
%        };
%
%        List<List<int>> listaOrdenada = Lsort(listaDeListas);
%
%        // Mostrar resultado
%        foreach (var lista in listaOrdenada)
%        {
%            Console.WriteLine($"[{string.Join(", ", lista)}]");
%        }
%    }
%
%    static List<List<T>> Lsort<T>(List<List<T>> listas)
%    {
%        // Ordenar la lista de listas por la longitud de las sublistas
%        return listas.OrderBy(l => l.Count).ToList();
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Ordena una lista de listas de acuerdo con la longitud de las sublistas.
lsort(L, S) :- map_list_to_pairs(length, L, P), keysort(P, SP), pairs_values(SP, S).

% ----------------------------------------------