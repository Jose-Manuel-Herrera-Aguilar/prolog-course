% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Comprueba si un árbol binario es simétrico.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% public class TreeNode
% {
%    public string Value;
%    public TreeNode Left;
%    public TreeNode Right;
%
%    public TreeNode(string value, TreeNode left = null, TreeNode right = null)
%    {
%        Value = value;
%        Left = left;
%        Right = right;
%    }
% }
%
% public class BalancedBinaryTree
% {
%    public static TreeNode BuildHbalTree(int height)
%    {
%        if (height == 0)
%        {
%            return null; // Un árbol vacío para altura 0
%        }
%        else if (height > 0)
%        {
%            int h1 = height - 1;
%            int h2 = h1 - 1;
%
%            TreeNode leftSubtree = BuildHbalTree(h1);  // Llama recursiva para subárbol izquierdo
%            TreeNode rightSubtree = BuildHbalTree(h2); // Llama recursiva para subárbol derecho
%
%            return new TreeNode("x", leftSubtree, rightSubtree);
%        }
%
%        return null;
%    }
%
%    public static void PrintTree(TreeNode node, string indent = "", bool last = true)
%    {
%        if (node != null)
%        {
%            Console.Write(indent);
%            Console.Write(last ? "└─" : "├─");
%            Console.WriteLine(node.Value);
%
%            indent += last ? "  " : "| ";
%            PrintTree(node.Left, indent, false);
%            PrintTree(node.Right, indent, true);
%        }
%    }
% }
%
% class Program
% {
%    static void Main()
%    {
%        int height = 3; // Especifica la altura deseada
%        TreeNode tree = BalancedBinaryTree.BuildHbalTree(height);
%        BalancedBinaryTree.PrintTree(tree);
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario equilibrado en altura con una altura dada.
% Un árbol equilibrado en altura tiene subárboles cuya diferencia de altura es como máximo 1.
hbal_tree(0, nil).
hbal_tree(H, t('x', L, R)) :- 
    H > 0, 
    H1 is H - 1, 
    H2 is H1 - 1, 
    hbal_tree(H1, L), 
    hbal_tree(H2, R).

% Predicado auxiliar para imprimir el árbol en consola
print_tree(nil) :- 
    writeln("nil").
print_tree(t(Value, Left, Right)) :- 
    format("~w\n", [Value]),
    format("|\n|-- Left: "),
    print_tree(Left),
    format("|-- Right: "),
    print_tree(Right).

% ----------------------------------------------