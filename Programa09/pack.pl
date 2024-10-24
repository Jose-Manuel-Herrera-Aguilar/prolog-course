% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Agrupar duplicados consecutivos de los elementos de una lista en sublistas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    static void Main()
%    {
%        List<int> list = new List<int> { 1, 1, 2, 3, 3, 3, 4, 5, 5 };
%        List<List<int>> packedList = Pack(list);
%
%        // Imprime el resultado
%        foreach (var sublist in packedList)
%        {
%            Console.Write("[");
%            Console.Write(string.Join(", ", sublist));
%            Console.WriteLine("]");
%        }
%    }
%
%    // Método principal que agrupa duplicados consecutivos en sublistas
%    static List<List<int>> Pack(List<int> list)
%    {
%        if (list.Count == 0)
%            return new List<List<int>>();
%
%        List<int> sublist = new List<int>();
%        List<List<int>> result = new List<List<int>>();
%
%        // Transferir duplicados consecutivos a una sublista
%        Transfer(list[0], list, sublist, result);
%        return result;
%    }
%
%    // Transferencia de elementos consecutivos duplicados
%    static void Transfer(int current, List<int> list, List<int> sublist, List<List<int>> result)
%    {
%        sublist.Add(current);
%
%        // Verifica si hay más elementos en la lista
%        if (list.Count == 1)
%        {
%            result.Add(new List<int>(sublist));
%            return;
%        }
%
%        // Si el siguiente elemento es diferente, agrega la sublista al resultado
%        if (list[1] != current)
%        {
%            result.Add(new List<int>(sublist));
%            sublist.Clear();
%            Pack(list.GetRange(1, list.Count - 1)).ForEach(s => result.Add(s));
%        }
%        else
%        {
%            Transfer(current, list.GetRange(1, list.Count - 1), sublist, result);
%        }
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Agrupa duplicados consecutivos de una lista en sublistas.

% Caso base: una lista vacía se agrupa como una lista vacía.
pack([], []).

% Caso recursivo: transfiere todos los elementos consecutivos iguales a una sublista.
pack([X|Xs], [[X|Ys]|Zs]) :- transfer(X, Xs, Ys, Rest), pack(Rest, Zs).

% Transfiere los elementos duplicados consecutivos a una sublista.
transfer(X, [], [], []).

% Si el siguiente elemento es diferente, termina la transferencia.
transfer(X, [Y|Ys], [], [Y|Ys]) :- X \= Y.

% Si el siguiente elemento es igual, agrégalo a la sublista.
transfer(X, [X|Xs], [X|Ys], Rest) :- transfer(X, Xs, Ys, Rest).

% ----------------------------------------------