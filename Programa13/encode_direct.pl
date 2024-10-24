% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Codificación Run-Length de una lista (solución directa).
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class RunLengthEncoding
% {
%    public static List<(int, T)> EncodeDirect<T>(List<T> list)
%    {
%        var result = new List<(int, T)>();
%        if (list.Count == 0) return result;
%
%        EncodeDirectHelper(list, result);
%        return result;
%    }
%
%    private static void EncodeDirectHelper<T>(List<T> list, List<(int, T)> result)
%    {
%        if (list.Count == 0) return;
%
%        T firstElement = list[0];
%        int count = CountConsecutive(firstElement, list, out List<T> rest);
%        result.Add((count, firstElement));
%
%        EncodeDirectHelper(rest, result);
%    }
%
%    private static int CountConsecutive<T>(T element, List<T> list, out List<T> rest)
%    {
%        int count = 0;
%        int i = 0;
%        while (i < list.Count && EqualityComparer<T>.Default.Equals(list[i], element))
%        {
%            count++;
%            i++;
%        }
%
%        rest = list.GetRange(i, list.Count - i);
%        return count;
%    }
%
%    public static void Main(string[] args)
%    {
%        var input = new List<int> { 1, 1, 2, 3, 3, 3, 4 };
%        var encoded = EncodeDirect(input);
%
%        foreach (var item in encoded)
%        {
%            Console.WriteLine($"({item.Item1}, {item.Item2})");
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Codifica directamente una lista usando codificación Run-Length.

% Cuenta cuántos elementos consecutivos son iguales.
encode_direct([], []).
encode_direct([X|Xs], [[N,X]|R]) :- count(X, [X|Xs], N, Rest), encode_direct(Rest, R).

% Cuenta cuántos elementos consecutivos son iguales.
count(_, [], 0, []).
count(X, [X|Xs], N, Rest) :- count(X, Xs, N1, Rest), N is N1 + 1.
count(X, [Y|Ys], 0, [Y|Ys]) :- X \= Y.

% ----------------------------------------------