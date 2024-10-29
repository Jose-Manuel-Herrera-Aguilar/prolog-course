% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Calcula el máximo común divisor usando el algoritmo de Euclides.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%    static void Main()
%    {
%        Console.WriteLine("Ingresa el primer número:");
%        int num1 = int.Parse(Console.ReadLine());
%
%        Console.WriteLine("Ingresa el segundo número:");
%        int num2 = int.Parse(Console.ReadLine());
%
%        int gcdResult = GCD(num1, num2);
%        Console.WriteLine($"El máximo común divisor de {num1} y {num2} es: {gcdResult}");
%    }
%
%    // Función para calcular el MCD usando el algoritmo de Euclides
%    static int GCD(int x, int y)
%    {
%        if (y == 0)
%            return x;
%        else
%            return GCD(y, x % y);
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :- Y > 0, R is X mod Y, gcd(Y, R, G).

% ----------------------------------------------