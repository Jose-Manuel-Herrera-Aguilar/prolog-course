% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera una tabla de verdad para una expresión lógica en dos variables.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class LogicalOperators
% {
%    // Método AND
%    public static bool And(bool A, bool B)
%    {
%        return A && B;
%    }
%
%    // Método OR
%    public static bool Or(bool A, bool B)
%    {
%        return A || B;
%    }
%
%    // Método NAND
%    public static bool Nand(bool A, bool B)
%    {
%        return !(A && B);
%    }
%
%    // Método NOR
%    public static bool Nor(bool A, bool B)
%    {
%        return !(A || B);
%    }
%
%    // Método XOR
%    public static bool Xor(bool A, bool B)
%    {
%        return A ^ B;
%    }
%
%    // Método de Implicación
%    public static bool Implication(bool A, bool B)
%    {
%        return !A || B;
%    }
%
%    // Método de Equivalencia
%    public static bool Equivalence(bool A, bool B)
%    {
%        return (A && B) || (!A && !B);
%    }
%
%    // Genera una tabla de verdad para cada operador
%    public static void GenerateTruthTable()
%    {
%        bool[] values = { true, false };
%
%        Console.WriteLine("A\tB\tAND\tOR\tNAND\tNOR\tXOR\tIMPL\tEQUIV");
%        foreach (var A in values)
%        {
%            foreach (var B in values)
%            {
%                Console.WriteLine($"{A}\t{B}\t{And(A, B)}\t{Or(A, B)}\t{Nand(A, B)}\t{Nor(A, B)}\t{Xor(A, B)}\t{Implication(A, B)}\t{Equivalence(A, B)}");
%            }
%        }
%    }
%
%    // Punto de entrada
%    public static void Main(string[] args)
%    {
%        GenerateTruthTable();
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Definición de los operadores básicos
and(A, B) :- A, B.
or(A, _) :- A.
or(_, B) :- B.
nand(A, B) :- \+ (A, B).
nor(A, B) :- \+ (A; B).
xor(A, B) :- A, \+ B; \+ A, B.
impl(A, B) :- \+ A; B.
equ(A, B) :- A, B; \+ A, \+ B.

% Predicado para generar una tabla de verdad
tabla_verdad :-
    write('A\tB\tAND\tOR\tNAND\tNOR\tXOR\tIMPL\tEQUIV'), nl,
    (valores(A), valores(B),
     write(A), write('\t'), write(B), write('\t'),
     eval_and(A, B), write('\t'),
     eval_or(A, B), write('\t'),
     eval_nand(A, B), write('\t'),
     eval_nor(A, B), write('\t'),
     eval_xor(A, B), write('\t'),
     eval_impl(A, B), write('\t'),
     eval_equ(A, B), nl,
     fail ; true).

% Valores posibles
valores(true).
valores(false).

% Predicados para evaluar cada operador
eval_and(A, B) :- (and(A, B) -> write(true) ; write(false)).
eval_or(A, B) :- (or(A, B) -> write(true) ; write(false)).
eval_nand(A, B) :- (nand(A, B) -> write(true) ; write(false)).
eval_nor(A, B) :- (nor(A, B) -> write(true) ; write(false)).
eval_xor(A, B) :- (xor(A, B) -> write(true) ; write(false)).
eval_impl(A, B) :- (impl(A, B) -> write(true) ; write(false)).
eval_equ(A, B) :- (equ(A, B) -> write(true) ; write(false)).

% ----------------------------------------------