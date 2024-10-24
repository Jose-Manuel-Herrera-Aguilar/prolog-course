% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera una permutación aleatoria de los elementos de una lista.
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
%        List<int> originalList = new List<int> { 1, 2, 3, 4, 5 }; // Cambia esto por los elementos deseados
%        List<int> permutedList = RandomPermutation(originalList);
%        
%        Console.WriteLine("Lista original: " + string.Join(", ", originalList));
%        Console.WriteLine("Lista permutada: " + string.Join(", ", permutedList));
%    }
%
%    static List<T> RandomPermutation<T>(List<T> list)
%    {
%        Random random = new Random();
%        List<T> shuffledList = new List<T>(list);
%        int n = shuffledList.Count;
%
%        for (int i = 0; i < n; i++)
%        {
%            int j = random.Next(i, n); // Selección aleatoria
%            // Intercambiar elementos
%            T temp = shuffledList[i];
%            shuffledList[i] = shuffledList[j];
%            shuffledList[j] = temp;
%        }
%
%        return shuffledList;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Genera una permutación aleatoria de los elementos de una lista.

% Utiliza la selección aleatoria para construir la permutación.
rnd_permu(L, P) :- length(L, Len), rnd_select(L, Len, P).

% ----------------------------------------------