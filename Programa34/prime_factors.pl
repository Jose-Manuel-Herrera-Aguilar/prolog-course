% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Determinar los factores primos de un número entero positivo.
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
%        Console.Write("Introduce un número: ");
%        int number = int.Parse(Console.ReadLine());
%
%        List<int> factors = PrimeFactors(number);
%
%        Console.WriteLine($"Los factores primos de {number} son: {string.Join(", ", factors)}");
%    }
%
%    static List<int> PrimeFactors(int n)
%    {
%        List<int> factors = new List<int>();
%
%        if (n > 1)
%        {
%            PrimeFactors(n, 2, factors);
%        }
%
%        return factors;
%    }
%
%    static void PrimeFactors(int n, int f, List<int> factors)
%    {
%        while (n > 1 && f * f <= n)
%        {
%            if (n % f == 0)
%            {
%                factors.Add(f);
%                n /= f;
%            }
%            else
%            {
%                f = NextFactor(f);
%            }
%        }
%
%        // Si el número restante es mayor que 1, también es un factor primo.
%        if (n > 1)
%        {
%            factors.Add(n);
%        }
%    }
%
%    static int NextFactor(int f)
%    {
%        if (f == 2)
%        {
%            return 3;
%        }
%        else
%        {
%            return f + 2;
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Encuentra los factores primos de un número entero positivo.
prime_factors(N, L) :- N > 1, prime_factors(N, 2, L).

prime_factors(1, _, []).
prime_factors(N, F, [F|L]) :- N > 1, 0 is N mod F, N1 is N // F, prime_factors(N1, F, L).
prime_factors(N, F, L) :- N > 1, F * F < N, next_factor(F, F1), prime_factors(N, F1, L).

next_factor(2, 3).
next_factor(F, F1) :- F > 2, F1 is F + 2.


% ----------------------------------------------