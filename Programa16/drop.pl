% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Elimina cada n-ésimo elemento de una lista.
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
%        List<int> list = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9};
%        int n = 3;
%
%        List<int> result = DropEveryNth(list, n);
%
%        Console.WriteLine("Original List: " + string.Join(", ", list));
%        Console.WriteLine("List after dropping every " + n + "rd element: " + string.Join(", ", result));
%    }
%
%    static List<T> DropEveryNth<T>(List<T> list, int n)
%    {
%        return DropHelper(list, n, n);
%    }
%
%    static List<T> DropHelper<T>(List<T> list, int counter, int n)
%    {
%        if (list.Count == 0) return new List<T>();
%
%        if (counter == 1)
%        {
%            // Drop the first element and reset the counter
%            return DropHelper(list.Skip(1).ToList(), n, n);
%        }
%        else
%        {
%            // Keep the first element and decrease the counter
%            List<T> result = new List<T> { list[0] };
%            result.AddRange(DropHelper(list.Skip(1).ToList(), counter - 1, n));
%            return result;
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina cada n-ésimo elemento de una lista.

% Utiliza un contador para determinar cuándo eliminar un elemento.
drop(L, N, R) :- drop(L, N, N, R).

% Caso base: cuando la lista está vacía, el resultado es vacío.
drop([], _, _, []).
% Si el contador llega a 1, omite el primer elemento y reinicia el contador.
drop([_|T], 1, N, R) :- drop(T, N, N, R).
% Caso recursivo: disminuye el contador y conserva el elemento.
drop([H|T], K, N, [H|R]) :- K > 1, K1 is K - 1, drop(T, K1, N, R).

% ----------------------------------------------