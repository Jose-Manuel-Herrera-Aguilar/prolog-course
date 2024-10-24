% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              el calculo de elementos de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    // Método recursivo que calcula la longitud de una lista
%    static int ListLength(List<int> list)
%    {
%        // Caso base: Si la lista está vacía, su longitud es 0
%        if (list.Count == 0)
%        {
%            return 0;
%        }
%        else
%        {
%            // Caso recursivo: Calcula la longitud de la cola de la lista
%            List<int> tail = list.GetRange(1, list.Count - 1); // La "cola" es todo excepto el primer elemento
%            return 1 + ListLength(tail);
%        }
%    }
%
%    static void Main()
%    {
%        // Ejemplo de lista
%        List<int> numbers = new List<int> { 1, 2, 3, 4, 5 };
%        
%        // Llamada al método que calcula la longitud de la lista
%        int length = ListLength(numbers);
%        
%        // Imprimir el resultado
%        Console.WriteLine("La longitud de la lista es: " + length);
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el número de elementos de una lista.

% Caso base: una lista vacía tiene longitud 0.
list_length([], 0).

% Caso recursivo: la longitud es 1 más que la longitud de la cola.
list_length([_|T], N) :- list_length(T, N1), N is N1 + 1.

% Ejemplo de uso:
% ?- list_length(X, [a, b, c, d]).
% X = 4. cualquiera dentro del rango de la lista
% ----------------------------------------------