% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Conjetura de Goldbach.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Goldbach
% {
%    // Método principal
%    static void Main(string[] args)
%    {
%        Console.WriteLine("Ingresa un número par mayor que 2:");
%        int N = int.Parse(Console.ReadLine());
%
%        if (N > 2 && N % 2 == 0)
%        {
%            var primes = PrimeList(2, N);
%            var result = FindGoldbachPair(N, primes);
%
%            if (result != null)
%            {
%                Console.WriteLine($"Los dos números primos que suman {N} son: {result[0]} y {result[1]}");
%            }
%            else
%            {
%                Console.WriteLine("No se encontraron dos primos que sumen el número dado.");
%            }
%        }
%        else
%        {
%            Console.WriteLine("El número debe ser par y mayor que 2.");
%        }
%    }
%
%    // Encuentra los dos números primos que suman N
%    static int[] FindGoldbachPair(int N, List<int> primes)
%    {
%        foreach (int p1 in primes)
%        {
%            int p2 = N - p1;
%            if (primes.Contains(p2))
%            {
%                return new int[] { p1, p2 };
%            }
%        }
%        return null; // No se encontraron pares que cumplan la conjetura
%    }
%
%    // Genera una lista de números primos entre low y high
%    static List<int> PrimeList(int low, int high)
%    {
%        List<int> primes = new List<int>();
%        for (int i = low; i <= high; i++)
%        {
%            if (IsPrime(i))
%            {
%                primes.Add(i);
%            }
%        }
%        return primes;
%    }
%
%    // Verifica si un número es primo
%    static bool IsPrime(int num)
%    {
%        if (num < 2)
%        {
%            return false;
%        }
%        for (int i = 2; i <= Math.Sqrt(num); i++)
%        {
%            if (num % i == 0)
%            {
%                return false;
%            }
%        }
%        return true;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número es primo
is_prime(2).
is_prime(3).
is_prime(X) :- X > 3, X mod 2 =\= 0, \+ has_factor(X,3).

% Verifica si un número tiene un factor en el rango
has_factor(X,Factor) :- X mod Factor =:= 0.
has_factor(X,Factor) :- Factor * Factor < X, NextFactor is Factor + 2, has_factor(X,NextFactor).

% Genera una lista de números primos desde Low hasta High
prime_list(Low, High, []) :- Low > High.
prime_list(Low, High, [Low|Rest]) :- 
    Low =< High, 
    is_prime(Low), 
    Next is Low + 1, 
    prime_list(Next, High, Rest).
prime_list(Low, High, Rest) :- 
    Low =< High, 
    \+ is_prime(Low), 
    Next is Low + 1, 
    prime_list(Next, High, Rest).

% Encuentra dos números primos P1 y P2 que sumen N según la conjetura de Goldbach
goldbach(N, [P1, P2]) :- 
    N > 2, 
    N mod 2 =:= 0, 
    prime_list(2, N, Primes), 
    member(P1, Primes), 
    P2 is N - P1, 
    is_prime(P2).

% Consulta para probar el programa
:- goldbach(28, Pair), write(Pair), nl.

% ----------------------------------------------