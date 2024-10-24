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
%
% class Program
% {
%    // Método principal
%    static void Main(string[] args)
%    {
%        var list = new List<int> { 1, 2, 3, 4 }; // Lista de elementos
%        int k = 2; // Número de elementos en cada combinación
%        
%        var combinations = GetCombinations(list, k);
%        
%        // Imprimir las combinaciones
%        foreach (var combination in combinations)
%        {
%            Console.WriteLine(string.Join(", ", combination));
%        }
%    }
%
%    // Método que obtiene todas las combinaciones de K elementos de una lista
%    static List<List<T>> GetCombinations<T>(List<T> list, int k)
%    {
%        var result = new List<List<T>>();
%        GenerateCombinations(list, k, 0, new List<T>(), result);
%        return result;
%    }
%
%    // Método recursivo para generar combinaciones
%    static void GenerateCombinations<T>(List<T> list, int k, int startIndex, List<T> current, List<List<T>> result)
%    {
%        if (k == 0)
%        {
%            result.Add(new List<T>(current));
%            return;
%        }
%
%        for (int i = startIndex; i <= list.Count - k; i++)
%        {
%            current.Add(list[i]);
%            GenerateCombinations(list, k - 1, i + 1, current, result);
%            current.RemoveAt(current.Count - 1);
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera todas las combinaciones de K elementos seleccionados de una lista dada.
combination(0, _, []).
combination(K, [H|T], [H|Comb]) :- K > 0, K1 is K - 1, combination(K1, T, Comb).
combination(K, [_|T], Comb) :- K > 0, combination(K, T, Comb).

% ----------------------------------------------