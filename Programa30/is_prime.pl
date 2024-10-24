% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Verifica si un número entero dado es primo y si tiene factores.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% public class PrimeChecker
% {
%    // Método principal para verificar si un número es primo
%    public static bool IsPrime(int number)
%    {
%        if (number <= 1)
%        {
%            return false;
%        }
%        if (number == 2 || number == 3)
%        {
%            return true;
%        }
%        if (number % 2 == 0)
%        {
%            return false;
%        }
%        return !HasFactor(number, 3);
%    }
%
%    // Método para verificar si un número tiene factores
%    private static bool HasFactor(int n, int l)
%    {
%        if (n % l == 0)
%        {
%            return true;
%        }
%        if (l * l < n)
%        {
%            return HasFactor(n, l + 2);
%        }
%        return false;
%    }
%
%    // Método principal para probar la funcionalidad
%    public static void Main(string[] args)
%    {
%        Console.WriteLine("Ingrese un número entero:");
%        if (int.TryParse(Console.ReadLine(), out int number))
%        {
%            if (IsPrime(number))
%            {
%                Console.WriteLine($"{number} es un número primo.");
%            }
%            else
%            {
%                Console.WriteLine($"{number} no es un número primo.");
%            }
%        }
%        else
%        {
%            Console.WriteLine("Entrada no válida. Por favor, ingrese un número entero.");
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un número entero dado es primo.
is_prime(2).
is_prime(3).
is_prime(P) :- P > 3, P mod 2 =\= 0, \\+ has_factor(P, 3).

% Verifica si un número tiene factores.
has_factor(N, L) :- N mod L =:= 0.
has_factor(N, L) :- L * L < N, L2 is L + 2, has_factor(N, L2).

% ----------------------------------------------