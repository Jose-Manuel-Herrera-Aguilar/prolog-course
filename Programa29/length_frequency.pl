% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% public class LengthFrequency
% {
%    // Método principal para ejecutar el código
%    public static void Main(string[] args)
%    {
%        List<List<int>> inputList = new List<List<int>>
%        {
%            new List<int> { 1, 2, 3 },
%            new List<int> { 4, 5 },
%            new List<int> { 6, 7, 8, 9 },
%            new List<int> { 10 }
%        };
%
%        var result = LengthFrequencyCount(inputList);
%        foreach (var pair in result)
%        {
%            Console.WriteLine($"Length: {pair.Item1}, Frequency: {pair.Item2}");
%        }
%    }
%
%    // Método para contar la frecuencia de longitudes de sublistas
%    public static List<(int, int)> LengthFrequencyCount(List<List<int>> lists)
%    {
%        // Crear un diccionario para contar las frecuencias
%        var lengthCount = new Dictionary<int, int>();
%
%        // Contar la longitud de cada sublista
%        foreach (var sublist in lists)
%        {
%            int length = sublist.Count;
%
%            if (lengthCount.ContainsKey(length))
%            {
%                lengthCount[length]++;
%            }
%            else
%            {
%                lengthCount[length] = 1;
%            }
%        }
%
%        // Ordenar por longitud y crear una lista de pares
%        var sortedList = lengthCount
%            .OrderBy(pair => pair.Key) // Ordenar por longitud
%            .Select(pair => (pair.Key, pair.Value)) // Crear una tupla
%            .ToList();
%
%        return sortedList;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Ordena una lista de listas de acuerdo con la frecuencia de la longitud de las sublistas.
length_frequency(L, F) :- map_list_to_pairs(length, L, P), msort(P, SP), encode(SP, F).

% ----------------------------------------------