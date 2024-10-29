% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Comparar dos métodos para calcular la función totiente de Euler.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%    static void Main(string[] args)
%    {
%        int N = 10; // Puedes cambiar este valor para probar con otros números
%        CompareTotient(N);
%    }
%
%    static void CompareTotient(int N)
%    {
%        int phi1 = Totient(N);
%        int phi2 = TotientImproved(N);
%
%        Console.WriteLine("Phi (método básico): " + phi1);
%        Console.WriteLine("Phi (método mejorado): " + phi2);
%    }
%
%    // Método básico para calcular la función totiente
%    static int Totient(int N)
%    {
%        int result = 1;
%        for (int i = 2; i < N; i++)
%        {
%            if (GCD(N, i) == 1)
%            {
%                result++;
%            }
%        }
%        return result;
%    }
%
%    // Método mejorado para calcular la función totiente
%    static int TotientImproved(int N)
%    {
%        int result = N;
%        for (int p = 2; p * p <= N; p++)
%        {
%            if (N % p == 0)
%            {
%                while (N % p == 0)
%                {
%                    N /= p;
%                }
%                result -= result / p;
%            }
%        }
%        if (N > 1)
%        {
%            result -= result / N;
%        }
%        return result;
%    }
%
%    // Función para calcular el máximo común divisor (MCD)
%    static int GCD(int a, int b)
%    {
%        while (b != 0)
%        {
%            int temp = b;
%            b = a % b;
%            a = temp;
%        }
%        return a;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Regla principal para comparar los dos métodos de la función totiente.
compare_totient(N) :-
    totient(N, Phi1),
    totient_improved(N, Phi2),
    write('Phi (método básico): '), write(Phi1), nl,
    write('Phi (método mejorado): '), write(Phi2), nl.

% Función totiente básica: Cuenta cuántos números son coprimos con N.
totient(N, Phi) :- 
    totient_helper(N, N, 0, Phi).

totient_helper(_, 0, Phi, Phi). % Caso base
totient_helper(N, I, Acc, Phi) :-
    I > 0,
    gcd(N, I, GCD), % Calcula el MCD (máximo común divisor)
    (GCD =:= 1 -> Acc1 is Acc + 1 ; Acc1 is Acc),
    I1 is I - 1,
    totient_helper(N, I1, Acc1, Phi).

% Método mejorado usando factorización
totient_improved(N, Phi) :-
    prime_factors(N, Factors),
    calculate_totient(N, Factors, Phi).

% Calcula la función totiente utilizando los factores primos
calculate_totient(N, [], N).
calculate_totient(N, [P|Rest], Phi) :-
    N1 is N * (P - 1) // P,
    calculate_totient(N1, Rest, Phi).

% Encuentra los factores primos únicos de N
prime_factors(N, Factors) :- 
    prime_factors_helper(N, 2, Factors).

prime_factors_helper(1, _, []).
prime_factors_helper(N, F, [F|Rest]) :- 
    N mod F =:= 0, 
    divide_all(N, F, N1), 
    prime_factors_helper(N1, F, Rest).
prime_factors_helper(N, F, Factors) :- 
    F2 is F + 1,
    prime_factors_helper(N, F2, Factors).

% Divide N por F tantas veces como sea posible
divide_all(N, F, N1) :- 
    N mod F =:= 0 -> N2 is N // F, divide_all(N2, F, N1) ; N1 = N.

% MCD (máximo común divisor)
gcd(X, 0, X) :- !.
gcd(X, Y, G) :- 
    R is X mod Y, 
    gcd(Y, R, G).

% ----------------------------------------------