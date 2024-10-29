% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera el código gray en N bits.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class Program
% {
%    // Definición de la clase para el nodo del árbol
%    public class TreeNode
%    {
%        public string Value;
%        public TreeNode Left;
%        public TreeNode Right;
%
%        public TreeNode(string value)
%        {
%            Value = value;
%            Left = null;
%            Right = null;
%        }
%    }
%
%    // Método para construir un árbol binario equilibrado
%    public static TreeNode CreateBalancedTree(int n)
%    {
%        if (n == 0)
%            return null; // Retorna nulo si no hay nodos
%
%        return CreateTree(n);
%    }
%
%    private static TreeNode CreateTree(int n)
%    {
%        if (n == 0) return null;
%
%        // División de nodos entre los subárboles
%        int leftNodes = n / 2; // Nodos del subárbol izquierdo
%        int rightNodes = n - leftNodes - 1; // Nodos del subárbol derecho
%
%        TreeNode node = new TreeNode("x"); // Crea un nuevo nodo
%        node.Left = CreateTree(leftNodes); // Construye el subárbol izquierdo
%        node.Right = CreateTree(rightNodes); // Construye el subárbol derecho
%
%        return node;
%    }
%
%    // Método auxiliar para imprimir el árbol en preorden
%    public static void PreOrderTraversal(TreeNode node)
%    {
%        if (node != null)
%        {
%            Console.Write(node.Value + " "); // Imprime el valor del nodo
%            PreOrderTraversal(node.Left); // Visita el subárbol izquierdo
%            PreOrderTraversal(node.Right); // Visita el subárbol derecho
%        }
%    }
%
%    // Punto de entrada del programa
%    static void Main(string[] args)
%    {
%        int n = 7; // Número de nodos en el árbol
%        TreeNode root = CreateBalancedTree(n);
%
%        // Imprimir el árbol en preorden
%        Console.WriteLine("Preorden del árbol binario equilibrado:");
%        PreOrderTraversal(root);
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario completamente equilibrado con N nodos.
% Un árbol completamente equilibrado tiene subárboles cuya diferencia de tamaño es como máximo 1.
cbal_tree(0, nil).
cbal_tree(N, t('x', L, R)) :- N > 0, N1 is N - 1, divide(N1, N2, N3), cbal_tree(N2, L), cbal_tree(N3, R).

% Divide el número de nodos entre los dos subárboles.
divide(N, N1, N2) :- N1 is N // 2, N2 is N - N1.

% Predicado para imprimir el árbol en preorden
print_tree(nil).
print_tree(t(Value, Left, Right)) :-
    write(Value), nl,
    print_tree(Left),
    print_tree(Right).

% Predicado para crear y mostrar el árbol con N nodos
create_and_print_tree(N) :-
    cbal_tree(N, Tree),
    write('Árbol en preorden:'), nl,
    print_tree(Tree).
% ----------------------------------------------