% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
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
%        int M = 10;  // Cambia este valor para probar con diferentes números
%        int phi = Totient(M);
%        Console.WriteLine($"La función totiente de {M} es {phi}");
%    }
%
%    // Función principal para calcular la función totiente
%    static int Totient(int M)
%    {
%        if (M == 1)
%        {
%            return 1;
%        }
%        else
%        {
%            return TotientAcc(M, M, 0);
%        }
%    }
%
%    // Función auxiliar para llevar la cuenta (acumulador)
%    static int TotientAcc(int M, int K, int Acc)
%    {
%        if (K == 0)
%        {
%            return Acc;
%        }
%        else if (Coprime(M, K))
%        {
%            return TotientAcc(M, K - 1, Acc + 1);
%        }
%        else
%        {
%            return TotientAcc(M, K - 1, Acc);
%        }
%    }
%
%    // Función que determina si dos números son coprimos (mcd == 1)
%    static bool Coprime(int a, int b)
%    {
%        return Gcd(a, b) == 1;
%    }
%
%    // Función para calcular el máximo común divisor (usando el algoritmo de Euclides)
%    static int Gcd(int a, int b)
%    {
%        if (b == 0)
%        {
%            return a;
%        }
%        else
%        {
%            return Gcd(b, a % b);
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Calcula la función totiente de Euler, que cuenta cuántos números menores que M son coprimos con M.
% https://es.wikipedia.org/wiki/Función_φ_de_Euler

% Caso base: la función totiente de 1 es 1.
totient(1, 1).

% Caso general: llama a la función auxiliar con M y un acumulador inicial.
totient(M, Phi) :- M > 1, totient_acc(M, M, 0, Phi).

% Cuando K es 0, el acumulador Acc contiene el valor final de Phi.
totient_acc(_, 0, Acc, Acc).

% Si M y K son coprimos, incrementa el acumulador y reduce K.
totient_acc(M, K, Acc, Phi) :-
    K > 0, coprime(M, K), Acc1 is Acc + 1, K1 is K - 1, totient_acc(M, K1, Acc1, Phi).

% Si M y K no son coprimos, solo reduce K sin incrementar el acumulador.
totient_acc(M, K, Acc, Phi) :-
    K > 0, \+ coprime(M, K), K1 is K - 1, totient_acc(M, K1, Acc, Phi).

% Verifica si dos números son coprimos (el mcd es 1).
coprime(A, B) :- gcd(A, B, 1).

% Calcula el máximo común divisor usando el algoritmo de Euclides.
gcd(A, 0, A).
gcd(A, B, GCD) :- B > 0, R is A mod B, gcd(B, R, GCD).


% ----------------------------------------------