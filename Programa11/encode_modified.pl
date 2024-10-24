% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Modificar la codificación Run-Length de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% public class RunLengthEncoding
% {
%    // Método principal que aplica la codificación modificada
%    public static List<object> EncodeModified(List<int> inputList)
%    {
%        // Llamamos a la codificación normal
%        var encodedList = Encode(inputList);
%
%        // Modificamos el resultado codificado
%        return Modify(encodedList);
%    }
%
%    // Método que realiza la codificación Run-Length
%    private static List<Tuple<int, int>> Encode(List<int> list)
%    {
%        var encodedList = new List<Tuple<int, int>>();
%        if (list.Count == 0)
%        {
%            return encodedList;
%        }
%
%        int count = 1;
%        for (int i = 1; i < list.Count; i++)
%        {
%            if (list[i] == list[i - 1])
%            {
%                count++;
%            }
%            else
%            {
%                encodedList.Add(Tuple.Create(count, list[i - 1]));
%                count = 1;
%            }
%        }
%        encodedList.Add(Tuple.Create(count, list.Last()));
%        return encodedList;
%    }
%
%    // Método que aplica la modificación
%    private static List<object> Modify(List<Tuple<int, int>> encodedList)
%    {
%        var resultList = new List<object>();
%
%        foreach (var pair in encodedList)
%        {
%            if (pair.Item1 == 1)
%            {
%                // Si el elemento no tiene duplicados, se agrega directamente.
%                resultList.Add(pair.Item2);
%            }
%            else
%            {
%                // Si hay más de uno, se mantiene el formato (N, X).
%                resultList.Add(pair);
%            }
%        }
%
%        return resultList;
%    }
%
%    public static void Main(string[] args)
%    {
%        // Ejemplo de uso
%        List<int> inputList = new List<int> { 1, 1, 2, 3, 3, 4, 4, 4, 5 };
%        List<object> result = EncodeModified(inputList);
%
%        // Imprimir el resultado
%        foreach (var item in result)
%        {
%            if (item is Tuple<int, int>)
%            {
%                Console.WriteLine($"({((Tuple<int, int>)item).Item1}, {((Tuple<int, int>)item).Item2})");
%            }
%            else
%            {
%                Console.WriteLine(item);
%            }
%        }
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Modifica la codificación Run-Length de una lista.

% Si un elemento no tiene duplicados, se mantiene sin empaquetar.
encode_modified(L, R) :- encode(L, Enc), modify(Enc, R).

% Caso base: lista vacía.
modify([], []).

% Si hay solo un elemento, agrégalo directamente.
modify([[1,X]|T], [X|R]) :- modify(T, R).

% Si hay más de un elemento, mantén el formato (N, X).
modify([[N,X]|T], [[N,X]|R]) :- N > 1, modify(T, R).

% ----------------------------------------------