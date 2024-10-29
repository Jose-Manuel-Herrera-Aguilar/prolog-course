% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Definición de árboles binarios equilibrados y simétricos en Prolog
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% public class BinaryTree
% {
%    public int Value { get; set; }
%    public BinaryTree? Left { get; set; }
%    public BinaryTree? Right { get; set; }
%
%    public BinaryTree(int value)
%    {
%        Value = value;
%    }
% }
%
% public class SymmetricBalancedTrees
% {
%    // Genera todos los árboles binarios completamente equilibrados con N nodos
%    public static List<BinaryTree> GenerateBalancedTrees(int n)
%    {
%        if (n == 0)
%            return new List<BinaryTree> { null };
%
%        if (n % 2 == 0)
%            return new List<BinaryTree>();  // No se puede crear un árbol completamente equilibrado con un número par de nodos.
%
%        var trees = new List<BinaryTree>();
%        int leftNodes = (n - 1) / 2;
%        int rightNodes = leftNodes;
%
%        foreach (var leftTree in GenerateBalancedTrees(leftNodes))
%        {
%            foreach (var rightTree in GenerateBalancedTrees(rightNodes))
%            {
%                var tree = new BinaryTree(0)
%                {
%                    Left = leftTree,
%                    Right = rightTree
%                };
%                trees.Add(tree);
%            }
%        }
%        return trees;
%    }
%
%    // Verifica si un árbol binario es simétrico
%    public static bool IsSymmetric(BinaryTree? tree)
%    {
%        if (tree == null)
%            return true;
%
%        return IsMirror(tree.Left, tree.Right);
%    }
%
%    private static bool IsMirror(BinaryTree? left, BinaryTree? right)
%    {
%        if (left == null && right == null)
%            return true;
%        if (left == null || right == null)
%            return false;
%
%        return IsMirror(left.Left, right.Right) && IsMirror(left.Right, right.Left);
%    }
%
%    // Genera todos los árboles binarios simétricos y completamente equilibrados con N nodos
%    public static List<BinaryTree> SymmetricBalancedTrees(int n)
%    {
%        var allBalancedTrees = GenerateBalancedTrees(n);
%        var symmetricBalancedTrees = new List<BinaryTree>();
%
%        foreach (var tree in allBalancedTrees)
%        {
%            if (IsSymmetric(tree))
%            {
%                symmetricBalancedTrees.Add(tree);
%            }
%        }
%        return symmetricBalancedTrees;
%    }
% }
%
% public class Program
% {
%    public static void Main()
%    {
%        int n = 7; // Ejemplo: Número de nodos
%        var symmetricBalancedTrees = SymmetricBalancedTrees.SymmetricBalancedTrees(n);
%
%        Console.WriteLine($"Número de árboles simétricos y equilibrados con {n} nodos: {symmetricBalancedTrees.Count}");
%        foreach (var tree in symmetricBalancedTrees)
%        {
%            // Aquí puedes implementar un método para imprimir el árbol si lo deseas
%        }
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Definición de árboles binarios equilibrados y simétricos en Prolog

% Árbol vacío es un árbol equilibrado con 0 nodos
cbal_tree(0, nil) :- !.

% Árbol con un solo nodo
cbal_tree(1, t(nil, 'x', nil)) :- !.

% Árbol equilibrado con N nodos
cbal_tree(N, t(Left, 'x', Right)) :-
    N > 1,
    N1 is N - 1,
    N2 is N1 // 2,
    N3 is N1 - N2,
    cbal_tree(N2, Left),
    cbal_tree(N3, Right).

% Verificación de simetría de un árbol
symmetric(nil).
symmetric(t(Left, _, Right)) :- mirror(Left, Right).

% Verificación de que dos árboles sean reflejos
mirror(nil, nil).
mirror(t(L1, _, R1), t(L2, _, R2)) :-
    mirror(L1, R2),
    mirror(R1, L2).

% Generación de árboles binarios simétricos y completamente equilibrados
sym_cbal_trees(N, Ts) :- findall(T, (cbal_tree(N, T), symmetric(T)), Ts).

% ----------------------------------------------