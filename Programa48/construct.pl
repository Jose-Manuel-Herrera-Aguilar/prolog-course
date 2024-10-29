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
% using System.Collections.Generic;
%
% public class BinaryTree
% {
%    public int Value { get; set; }
%    public BinaryTree Left { get; set; }
%    public BinaryTree Right { get; set; }
%
%    public BinaryTree(int value)
%    {
%        Value = value;
%        Left = null;
%        Right = null;
%    }
%
%    // Método para construir un árbol binario de búsqueda a partir de una lista de enteros
%    public static BinaryTree Construct(List<int> values)
%    {
%        BinaryTree tree = null;
%        foreach (var value in values)
%        {
%            tree = Add(tree, value);
%        }
%        return tree;
%    }
%
%    // Método para añadir un nodo a un árbol binario de búsqueda
%    private static BinaryTree Add(BinaryTree node, int value)
%    {
%        if (node == null)
%        {
%            return new BinaryTree(value);
%        }
%        
%        if (value < node.Value)
%        {
%            node.Left = Add(node.Left, value);
%        }
%        else
%        {
%            node.Right = Add(node.Right, value);
%        }
%        
%        return node;
%    }
%
%    // Método para imprimir el árbol (en orden)
%    public static void InOrderPrint(BinaryTree node)
%    {
%        if (node != null)
%        {
%            InOrderPrint(node.Left);
%            Console.Write(node.Value + " ");
%            InOrderPrint(node.Right);
%        }
%    }
% }
%
% public class Program
% {
%    public static void Main(string[] args)
%    {
%        List<int> values = new List<int> { 10, 5, 15, 2, 7, 12, 20 };
%        BinaryTree tree = BinaryTree.Construct(values);
%        
%        Console.WriteLine("Árbol binario de búsqueda en orden:");
%        BinaryTree.InOrderPrint(tree);
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Construye un árbol binario de búsqueda a partir de una lista de enteros.
% Un árbol binario de búsqueda es un árbol en el cual, para cada nodo,
% todos los elementos en el subárbol izquierdo son menores y en el subárbol derecho son mayores.
construct([], nil).
construct([X|Xs], T) :- construct(Xs, T1), add(X, T1, T).

% Añade un nodo a un árbol binario de búsqueda.
add(X, nil, t(X, nil, nil)).
add(X, t(Root, L, R), t(Root, NL, R)) :- X < Root, add(X, L, NL).
add(X, t(Root, L, R), t(Root, L, NR)) :- X >= Root, add(X, R, NR).

% Imprime el árbol en orden
inorder(nil).
inorder(t(Root, L, R)) :-
    inorder(L),
    write(Root), write(' '),
    inorder(R).

% ----------------------------------------------