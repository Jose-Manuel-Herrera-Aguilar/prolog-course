% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Decodificar una lista codificada mediante Run-Length.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class RunLengthDecoder
% {
%    // Método principal para decodificar una lista codificada mediante Run-Length
%    public static List<T> Decode<T>(List<(int, T)> encodedList)
%    {
%        List<T> result = new List<T>();
%        foreach (var pair in encodedList)
%        {
%            result.AddRange(Expand(pair.Item2, pair.Item1));
%        }
%        return result;
%    }
%
%    // Método auxiliar para expandir un elemento X en una lista de longitud N
%    public static List<T> Expand<T>(T element, int count)
%    {
%        List<T> expandedList = new List<T>();
%        for (int i = 0; i < count; i++)
%        {
%            expandedList.Add(element);
%        }
%        return expandedList;
%    }
%
%    static void Main(string[] args)
%    {
%        // Ejemplo de uso
%        List<(int, char)> encodedList = new List<(int, char)>
%        {
%            (4, 'a'),
%            (1, 'b'),
%            (2, 'c'),
%            (3, 'a')
%        };
%
%        List<char> decodedList = Decode(encodedList);
%
%        // Muestra la lista decodificada
%        Console.WriteLine(string.Join(", ", decodedList)); // Resultado: a, a, a, a, b, c, c, a, a, a
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Decodifica una lista codificada mediante Run-Length.

% Expande cada par (N, X) en una lista con N elementos X.
decode([], []).
decode([[N,X]|T], R) :- decode(T, R1), expand(X, N, E), append(E, R1, R).

% Expande un elemento X en una lista de longitud N.
expand(_, 0, []).
expand(X, N, [X|T]) :- N > 0, N1 is N - 1, expand(X, N1, T).

% ----------------------------------------------