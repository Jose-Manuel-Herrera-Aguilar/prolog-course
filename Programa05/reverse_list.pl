% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              la inversión de una lista.
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
%        List<int> originalList = new List<int> { 1, 2, 3, 4, 5 };
%        List<int> reversedList = ReverseList(originalList);
%
%        Console.WriteLine("Original List: " + string.Join(", ", originalList));
%        Console.WriteLine("Reversed List: " + string.Join(", ", reversedList));
%    }
%
%    // Función que inicia el proceso de invertir la lista
%    static List<T> ReverseList<T>(List<T> list)
%    {
%        return ReverseList(list, new List<T>());
%    }
%
%    // Función recursiva que utiliza un acumulador para construir la lista invertida
%    static List<T> ReverseList<T>(List<T> list, List<T> acc)
%    {
%        if (list.Count == 0)
%        {
%            return acc; // Caso base: si la lista está vacía, devuelve el acumulador
%        }
%        else
%        {
%            // Caso recursivo: toma la cabeza (primer elemento) y lo agrega al acumulador
%            List<T> newAcc = new List<T>(acc) { list[0] };
%            List<T> tail = list.GetRange(1, list.Count - 1);
%            return ReverseList(tail, newAcc);
%        }
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Invierte una lista.

% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

% Ejemplo de uso:
% ?- reverse_list(X, [a, b, c, d]).
% X = [d, c, b, a].
% ----------------------------------------------