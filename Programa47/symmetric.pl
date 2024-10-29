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
%    public int Value;
%    public TreeNode Left;
%    public TreeNode Right;
%
%    public TreeNode(int value)
%    {
%        Value = value;
%        Left = null;
%        Right = null;
%    }
% }
%
% public class BinaryTree
% {
%    public TreeNode Root { get; set; }
%
%    public BinaryTree(TreeNode root)
%    {
%        Root = root;
%    }
%
%    // Comprueba si el árbol es simétrico
%    public bool IsSymmetric()
%    {
%        return IsMirror(Root?.Left, Root?.Right);
%    }
%
%    // Verifica si un árbol es el espejo de otro
%    private bool IsMirror(TreeNode node1, TreeNode node2)
%    {
%        // Ambos nodos son nulos
%        if (node1 == null && node2 == null)
%        {
%            return true;
%        }
%
%        // Uno de los nodos es nulo y el otro no
%        if (node1 == null || node2 == null)
%        {
%            return false;
%        }
%
%        // Verifica que los valores sean iguales y que sus subárboles sean espejos entre sí
%        return (node1.Value == node2.Value) &&
%               IsMirror(node1.Left, node2.Right) &&
%               IsMirror(node1.Right, node2.Left);
%    }
% }
%
% // Ejemplo de uso
% public class Program
% {
%    public static void Main()
%    {
%        TreeNode root = new TreeNode(1);
%        root.Left = new TreeNode(2);
%        root.Right = new TreeNode(2);
%        root.Left.Left = new TreeNode(3);
%        root.Left.Right = new TreeNode(4);
%        root.Right.Left = new TreeNode(4);
%        root.Right.Right = new TreeNode(3);
%
%        BinaryTree tree = new BinaryTree(root);
%        Console.WriteLine(tree.IsSymmetric() ? "El árbol es simétrico." : "El árbol no es simétrico.");
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Comprueba si un árbol binario es simétrico.
% Un árbol es simétrico si sus subárboles izquierdo y derecho son espejos entre sí.
symmetric(nil).
symmetric(t(_, L, R)) :- mirror(L, R).

% Verifica si un árbol es el espejo de otro.
mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :- mirror(L1, R2), mirror(R1, L2).

% ----------------------------------------------