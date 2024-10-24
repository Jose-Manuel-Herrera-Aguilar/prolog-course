% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Codificación Run-Length de una lista.
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
%        List<int> inputList = new List<int> { 1, 1, 2, 3, 3, 3, 4, 4, 4, 4 }; // Lista de entrada
%        List<(int, int)> encodedList = Encode(inputList); // Codificación de la lista
%        foreach (var pair in encodedList)
%        {
%            Console.WriteLine($"({pair.Item1}, {pair.Item2})"); // Mostrar el resultado
%        }
%    }
%
%    // Función para codificar la lista
%    static List<(int, int)> Encode(List<int> list)
%    {
%        var packed = Pack(list);
%        return Transform(packed);
%    }
%
%    // Agrupa los duplicados en sublistas
%    static List<List<int>> Pack(List<int> list)
%    {
%        List<List<int>> packed = new List<List<int>>();
%        List<int> currentGroup = new List<int>();
%
%        foreach (var item in list)
%        {
%            if (currentGroup.Count == 0 || currentGroup[currentGroup.Count - 1] == item)
%            {
%                currentGroup.Add(item);
%            }
%            else
%            {
%                packed.Add(currentGroup);
%                currentGroup = new List<int> { item };
%            }
%        }
%        if (currentGroup.Count > 0)
%        {
%            packed.Add(currentGroup);
%        }
%
%        return packed;
%    }
%
%    // Transforma sublistas en parejas (N, X)
%    static List<(int, int)> Transform(List<List<int>> packed)
%    {
%        List<(int, int)> result = new List<(int, int)>();
%
%        foreach (var group in packed)
%        {
%            int count = group.Count;
%            int value = group[0];
%            result.Add((count, value));
%        }
%
%        return result;
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica una lista usando codificación Run-Length.

% Primero agrupa los duplicados y luego transforma las sublistas en parejas (N, X).
encode(L, R) :- pack(L, P), transform(P, R).

% Transforma sublistas en parejas (N, X), donde N es la cantidad de elementos.
transform([], []).
transform([[X|Xs]|Ys], [[N,X]|Zs]) :- length([X|Xs], N), transform(Ys, Zs).

% ----------------------------------------------