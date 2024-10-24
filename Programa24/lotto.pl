% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Extrae N números aleatorios de un rango dado.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% public class Lotto
% {
%    // Método para generar una lista de N números aleatorios del rango 1 a M
%    public static List<int> LottoNumbers(int n, int m)
%    {
%        // Generar la lista del rango de 1 a M
%        List<int> range = Enumerable.Range(1, m).ToList();
%
%        // Crear una instancia de Random
%        Random rand = new Random();
%
%        // Seleccionar N números aleatorios de la lista
%        List<int> selectedNumbers = new List<int>();
%
%        for (int i = 0; i < n; i++)
%        {
%            // Escoge un índice aleatorio
%            int randomIndex = rand.Next(range.Count);
%
%            // Añadir el número aleatorio a la lista de resultados
%            selectedNumbers.Add(range[randomIndex]);
%
%            // Eliminar el número seleccionado para evitar repeticiones
%            range.RemoveAt(randomIndex);
%        }
%
%        return selectedNumbers;
%    }
%
%    public static void Main(string[] args)
%    {
%        int N = 5;  // Cantidad de números a seleccionar
%        int M = 50; // Rango superior (1 a M)
%        
%        // Llamar al método y obtener los números aleatorios
%        List<int> result = LottoNumbers(N, M);
%
%        // Imprimir el resultado
%        Console.WriteLine("Números aleatorios seleccionados:");
%        result.ForEach(Console.WriteLine);
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Extrae N números aleatorios de un rango dado.

% Utiliza la función range para generar la lista de números y luego selecciona aleatoriamente.
lotto(N, M, L) :- range(1, M, R), rnd_select(R, N, L).

% ----------------------------------------------