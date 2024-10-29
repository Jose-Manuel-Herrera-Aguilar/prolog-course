% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Verifica si un término dado representa un árbol binario.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
%
% class TreeNode
% {
%    public TreeNode Left { get; set; }
%    public TreeNode Right { get; set; }
%
%    public TreeNode(TreeNode left = null, TreeNode right = null)
%    {
%        Left = left;
%        Right = right;
%    }
% }
%
% class BinaryTree
% {
%    // Método que verifica si el árbol binario es válido
%    public static bool IsTree(TreeNode node)
%    {
%        // Un nodo nulo representa un árbol vacío, por lo tanto es un árbol válido
%        if (node == null)
%        {
%            return true;
%        }
%
%        // Recursivamente verifica que tanto el subárbol izquierdo como el derecho sean árboles válidos
%        return IsTree(node.Left) && IsTree(node.Right);
%    }
%
%    public static void Main()
%    {
%        // Ejemplo de uso
%        TreeNode tree = new TreeNode(
%            new TreeNode(), // Subárbol izquierdo
%            new TreeNode(new TreeNode(), null) // Subárbol derecho
%        );
%
%        Console.WriteLine(IsTree(tree) ? "Es un árbol binario." : "No es un árbol binario.");
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Verifica si un término dado representa un árbol binario.
% Un árbol binario está compuesto por un nodo raíz y dos subárboles.

% Definición de un árbol vacío
istree(nil).

% Definición de un árbol binario
istree(t(_, L, R)) :- 
    istree(L), 
    istree(R).

% Ejemplo de consulta
% Puedes ejecutar la siguiente consulta para probar el árbol:
% ?- istree(t(1, t(2, nil, nil), t(3, nil, nil))).

% ----------------------------------------------