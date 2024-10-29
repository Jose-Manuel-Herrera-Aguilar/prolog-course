% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Calcular la función totiente de Euler phi(m) mejorada.
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
%        int N = 12; // Ejemplo de entrada
%        int phi = TotientImproved(N);
%        Console.WriteLine($"El valor de φ({N}) es: {phi}");
%    }
%
%    // Método que calcula la función totiente
%    static int TotientImproved(int N)
%    {
%        var factors = PrimeFactorsMult(N);
%        return TotientPhi(factors);
%    }
%
%    // Método que obtiene los factores primos con multiplicidad
%    static List<Tuple<int, int>> PrimeFactorsMult(int n)
%    {
%        var factors = new List<Tuple<int, int>>();
%        for (int i = 2; i <= n; i++)
%        {
%            int count = 0;
%            while (n % i == 0)
%            {
%                n /= i;
%                count++;
%            }
%            if (count > 0)
%            {
%                factors.Add(new Tuple<int, int>(i, count));
%            }
%        }
%        return factors;
%    }
%
%    // Método que calcula el valor de φ a partir de los factores primos
%    static int TotientPhi(List<Tuple<int, int>> factors)
%    {
%        int phi = 1;
%        foreach (var factor in factors)
%        {
%            int P = factor.Item1;
%            int M = factor.Item2;
%            phi *= (P - 1) * (int)Math.Pow(P, M - 1);
%        }
%        return phi;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Archivo: totient.pl

% Calcula la función totiente usando los factores primos con multiplicidad
totient_improved(N, Phi) :- 
    prime_factors_mult(N, F), 
    totient_phi(F, Phi).

% Calcula el totiente a partir de la lista de factores primos
totient_phi([], 1).
totient_phi([[P, M]|T], Phi) :- 
    totient_phi(T, Phi1), 
    Phi is Phi1 * (P - 1) * P ** (M - 1).

% Encuentra los factores primos con multiplicidad
prime_factors_mult(N, Factors) :- 
    prime_factors_mult(N, 2, Factors).

prime_factors_mult(1, _, []) :- !.
prime_factors_mult(N, F, [[F, M]|Factors]) :- 
    N > 1, 
    divide(N, F, M, N1), 
    M > 0, 
    prime_factors_mult(N1, F+1, Factors), !.
prime_factors_mult(N, F, Factors) :- 
    N > 1, 
    next_factor(F, F1), 
    prime_factors_mult(N, F1, Factors).

% Divide N por F mientras sea divisible, devuelve el número de divisiones (M)
divide(N, F, M, N1) :- 
    divide(N, F, 0, M, N1).
divide(N, F, A, A, N) :- 
    N < F, !.
divide(N, F, A, M, N1) :- 
    N >= F, 
    N mod F =:= 0, 
    N2 is N // F, 
    A1 is A + 1, 
    divide(N2, F, A1, M, N1), !.
divide(N, _, M, M, N).

% Encuentra el siguiente número posible de factor
next_factor(2, 3) :- !.
next_factor(F, F1) :- 
    F1 is F + 2.

% ----------------------------------------------