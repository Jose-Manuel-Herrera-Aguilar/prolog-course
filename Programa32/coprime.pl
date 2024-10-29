% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Dos números son coprimos si su máximo común divisor es 1.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%    // Método que calcula el MCD de dos números utilizando el algoritmo de Euclides
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
%
%    // Método para verificar si dos números son coprimos
%    static bool AreCoprime(int x, int y)
%    {
%        return GCD(x, y) == 1;
%    }
%
%    static void Main(string[] args)
%    {
%        // Ejemplo de uso:
%        Console.Write("Introduce el primer número: ");
%        int x = int.Parse(Console.ReadLine());
%
%        Console.Write("Introduce el segundo número: ");
%        int y = int.Parse(Console.ReadLine());
%
%        if (AreCoprime(x, y))
%        {
%            Console.WriteLine($"{x} y {y} son coprimos.");
%        }
%        else
%        {
%            Console.WriteLine($"{x} y {y} no son coprimos.");
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Dos números son coprimos si su máximo común divisor es 1.
% Definición de coprimos usando el MCD
gcd(X, 0, X) :- !.
gcd(X, Y, G) :-
    Z is X mod Y,
    gcd(Y, Z, G).

coprime(X, Y) :-
    gcd(X, Y, 1).


% ----------------------------------------------