% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Lista de números primos en un rango.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class PrimeGenerator
% {
%    static void Main(string[] args)
%    {
%        int low = 10; // valor inicial del rango
%        int high = 50; // valor final del rango
%        
%        List<int> primes = GeneratePrimesInRange(low, high);
%
%        Console.WriteLine("Números primos en el rango:");
%        foreach (int prime in primes)
%        {
%            Console.WriteLine(prime);
%        }
%    }
%
%    // Función para generar números primos en un rango
%    static List<int> GeneratePrimesInRange(int low, int high)
%    {
%        List<int> primes = new List<int>();
%
%        for (int i = low; i <= high; i++)
%        {
%            if (IsPrime(i))
%            {
%                primes.Add(i);
%            }
%        }
%
%        return primes;
%    }
%
%    // Función para verificar si un número es primo
%    static bool IsPrime(int number)
%    {
%        if (number <= 1)
%        {
%            return false;
%        }
%
%        for (int i = 2; i * i <= number; i++)
%        {
%            if (number % i == 0)
%            {
%                return false;
%            }
%        }
%
%        return true;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% prime_list.pl

% Predicado principal para generar una lista de números primos en un rango dado.
prime_list(Low, High, Primes) :-
    findall(P, (between(Low, High, P), is_prime(P)), Primes).

% Predicado para verificar si un número es primo.
is_prime(2).
is_prime(N) :- 
    N > 2,
    \+ has_factor(N, 2).

% Verifica si N tiene algún divisor entre 2 y la raíz cuadrada de N.
has_factor(N, F) :- 
    N mod F =:= 0.
has_factor(N, F) :- 
    F * F < N, 
    F2 is F + 1,
    has_factor(N, F2).

% ----------------------------------------------