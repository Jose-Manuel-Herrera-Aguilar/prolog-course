% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Extrae una porción de una lista, dado un rango.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    // Función principal que ejecuta la lógica de Slice
%    static void Main(string[] args)
%    {
%        List<int> lista = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%        int inicio = 2;  // índice I
%        int fin = 5;     // índice K
%        List<int> sublista = Slice(lista, inicio, fin);
%        
%        Console.WriteLine("Sublista: [" + string.Join(", ", sublista) + "]");
%    }
%
%    // Función que extrae una porción de la lista dado el rango [I, K]
%    public static List<T> Slice<T>(List<T> lista, int I, int K)
%    {
%        // Asegurarse de que los índices I y K sean mayores que 0
%        if (I < 1 || K < 1 || I > K || K > lista.Count)
%        {
%            throw new ArgumentOutOfRangeException("Los índices deben ser mayores que 0 y dentro de los límites de la lista.");
%        }
%
%        // Decrementar los índices para que sean 0-based
%        return SliceHelper(lista, I - 1, K - 1);
%    }
%
%    // Función recursiva para realizar el corte de la lista
%    private static List<T> SliceHelper<T>(List<T> lista, int inicio, int fin)
%    {
%        if (inicio == fin) // Caso base cuando solo se quiere un elemento
%        {
%            return new List<T> { lista[inicio] };
%        }
%
%        List<T> resultado = new List<T> { lista[inicio] };
%        resultado.AddRange(SliceHelper(lista, inicio + 1, fin)); // Recursión
%        return resultado;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae una porción de una lista, dado un rango.

% Los índices I y K deben ser mayores que 0.
slice([H|_], 1, 1, [H]).
slice([H|T], 1, K, [H|R]) :- K > 1, K1 is K - 1, slice(T, 1, K1, R).
slice([_|T], I, K, R) :- I > 1, I1 is I - 1, K1 is K - 1, slice(T, I1, K1, R).

% ----------------------------------------------