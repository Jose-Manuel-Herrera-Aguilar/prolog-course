% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Lista de composiciones de Goldbach para un rango de números.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%    static void Main(string[] args)
%    {
%        int low = 4; // Puedes cambiar este valor
%        int high = 100; // Puedes cambiar este valor
%        var result = GoldbachList(low, high);
%        
%        foreach (var entry in result)
%        {
%            Console.WriteLine($"{entry.Item1} = {entry.Item2} + {entry.Item3}");
%        }
%    }
%
%    // Encuentra las composiciones de Goldbach para todos los números pares en un rango
%    static List<Tuple<int, int, int>> GoldbachList(int low, int high)
%    {
%        var result = new List<Tuple<int, int, int>>();
%
%        for (int n = low; n <= high; n += 2)
%        {
%            if (n % 2 == 0)
%            {
%                var goldbach = FindGoldbach(n);
%                if (goldbach != null)
%                {
%                    result.Add(Tuple.Create(n, goldbach.Item1, goldbach.Item2));
%                }
%            }
%        }
%
%        return result;
%    }
%
%    // Encuentra los dos números primos que suman un número par dado (Goldbach)
%    static Tuple<int, int> FindGoldbach(int n)
%    {
%        for (int i = 2; i <= n / 2; i++)
%        {
%            if (IsPrime(i) && IsPrime(n - i))
%            {
%                return Tuple.Create(i, n - i);
%            }
%        }
%
%        return null; // Si no se encuentra una descomposición
%    }
%
%    // Comprueba si un número es primo
%    static bool IsPrime(int num)
%    {
%        if (num < 2) return false;
%        for (int i = 2; i * i <= num; i++)
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
% Predicado principal que encuentra las composiciones de Goldbach para un rango de números pares
goldbach_list(Low, High, L) :- 
    findall([N, P1, P2], (between(Low, High, N), N mod 2 =:= 0, goldbach(N, [P1, P2])), L).

% Predicado que encuentra dos números primos P1 y P2 cuya suma es igual a N
goldbach(N, [P1, P2]) :-
    N > 2,
    N mod 2 =:= 0,
    prime_pair(N, P1, P2).

% Predicado que encuentra un par de números primos P1 y P2 cuya suma es igual a N
prime_pair(N, P1, P2) :-
    between(2, N, P1),
    is_prime(P1),
    P2 is N - P1,
    is_prime(P2),
    P1 =< P2.

% Predicado que comprueba si un número es primo
is_prime(2).
is_prime(3).
is_prime(P) :- 
    P > 3,
    P mod 2 =\= 0, 
    \+ has_factor(P, 3).

% Predicado que comprueba si hay un factor de P entre 3 y la raíz cuadrada de P
has_factor(P, F) :- 
    P mod F =:= 0.
has_factor(P, F) :- 
    F * F < P, 
    F2 is F + 2, 
    has_factor(P, F2).

% ----------------------------------------------