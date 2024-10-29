% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Determinar los factores primos de un número entero positivo (con multiplicidad).
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class PrimeFactorization
% {
%    // Función principal que retorna una lista de pares (factor primo, multiplicidad)
%    public static List<Tuple<int, int>> PrimeFactorsMult(int n)
%    {
%        var factors = PrimeFactors(n);   // Obtén los factores primos
%        return Encode(factors);          // Agrupa los factores con sus multiplicidades
%    }
%
%    // Método que retorna una lista de factores primos de un número
%    private static List<int> PrimeFactors(int n)
%    {
%        List<int> factors = new List<int>();
%        for (int i = 2; i <= n; i++)
%        {
%            while (n % i == 0)
%            {
%                factors.Add(i);
%                n /= i;
%            }
%        }
%        return factors;
%    }
%
%    // Método que codifica (agrupa) los factores con sus multiplicidades
%    private static List<Tuple<int, int>> Encode(List<int> factors)
%    {
%        List<Tuple<int, int>> result = new List<Tuple<int, int>>();
%
%        var groupedFactors = factors.GroupBy(f => f);
%        foreach (var group in groupedFactors)
%        {
%            result.Add(Tuple.Create(group.Key, group.Count()));
%        }
%
%        return result;
%    }
%
%    // Función para imprimir el resultado de forma legible
%    public static void PrintFactors(List<Tuple<int, int>> factors)
%    {
%        foreach (var factor in factors)
%        {
%            Console.WriteLine($"Factor: {factor.Item1}, Multiplicidad: {factor.Item2}");
%        }
%    }
%
%    static void Main(string[] args)
%    {
%        Console.WriteLine("Introduce un número:");
%        int number = int.Parse(Console.ReadLine());
%
%        var factors = PrimeFactorsMult(number);
%        PrintFactors(factors);
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Determina los factores primos con su multiplicidad.
prime_factors_mult(N, L) :- 
    prime_factors(N, F), 
    encode(F, L).

% Encuentra los factores primos de N
prime_factors(1, []).
prime_factors(N, [F|Fs]) :- 
    between(2, N, F), 
    N mod F =:= 0, 
    N1 is N // F, 
    prime_factors(N1, Fs).

% Codifica los factores y cuenta su multiplicidad
encode(L, Encoded) :- 
    sort(L, Sorted), 
    encode(Sorted, L, Encoded).

encode([], _, []).
encode([H|T], L, [H-M|Encoded]) :- 
    count(H, L, M), 
    delete(L, H, L1), 
    encode(T, L1, Encoded).

% Cuenta las ocurrencias de un elemento
count(X, List, Count) :- 
    include(=(X), List, Occurrences), 
    length(Occurrences, Count).

% ----------------------------------------------