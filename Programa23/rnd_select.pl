% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Extrae un número dado de elementos aleatorios de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% public class RandomSelector
% {
%    private static Random random = new Random();
%
%    // Método principal que selecciona N elementos aleatorios de una lista
%    public static List<T> RndSelect<T>(List<T> list, int n)
%    {
%        if (n <= 0 || list.Count == 0)
%            return new List<T>();
%
%        var result = new List<T>();
%        var tempList = new List<T>(list); // Crea una copia de la lista original
%
%        for (int i = 0; i < n; i++)
%        {
%            // Si la lista temporal está vacía antes de seleccionar todos los elementos, terminar
%            if (tempList.Count == 0) break;
%
%            // Generar un índice aleatorio
%            int randomIndex = random.Next(0, tempList.Count);
%
%            // Agregar el elemento aleatorio a la lista de resultados
%            result.Add(tempList[randomIndex]);
%
%            // Eliminar el elemento seleccionado de la lista temporal
%            tempList.RemoveAt(randomIndex);
%        }
%
%        return result;
%    }
%
%    // Ejemplo de uso
%    public static void Main(string[] args)
%    {
%        var list = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
%        int n = 3; // Número de elementos a seleccionar
%
%        List<int> selectedElements = RndSelect(list, n);
%
%        Console.WriteLine("Elementos seleccionados: " + string.Join(", ", selectedElements));
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae un número dado de elementos aleatorios de una lista.

% Utiliza un generador de números aleatorios y elimina los elementos seleccionados.
rnd_select(_, 0, []).
rnd_select(L, N, [X|R]) :- length(L, Len), random(1, Len, I), element_at(X, L, I), delete(L, X, L1), N1 is N - 1, rnd_select(L1, N1, R).

% ----------------------------------------------