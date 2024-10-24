% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 21 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              determinar si una lista es un palindromo.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% class Program
% {
%    static void Main(string[] args)
%    {
%        List<int> list = new List<int> { 1, 2, 3, 2, 1 };
%        
%        // Invertir la lista
%        List<int> reversedList = ReverseList(list);
%        Console.WriteLine("Lista invertida: " + string.Join(", ", reversedList));
%        
%        // Verificar si es un palíndromo
%        bool isPalindrome = IsPalindrome(list);
%        Console.WriteLine("Es palíndromo: " + isPalindrome);
%    }
%
%    // Método para invertir la lista utilizando acumulador
%    static List<T> ReverseList<T>(List<T> list)
%    {
%        return ReverseListHelper(list, new List<T>());
%    }
%
%    // Método recursivo auxiliar para construir la lista invertida
%    static List<T> ReverseListHelper<T>(List<T> list, List<T> acc)
%    {
%        if (list.Count == 0)
%            return acc;
%
%        List<T> newAcc = new List<T>(acc);
%        newAcc.Insert(0, list[0]);
%
%        return ReverseListHelper(list.GetRange(1, list.Count - 1), newAcc);
%    }
%
%    // Método para verificar si una lista es un palíndromo
%    static bool IsPalindrome<T>(List<T> list)
%    {
%        List<T> reversedList = ReverseList(list);
%        return AreListsEqual(list, reversedList);
%    }
%
%    // Método auxiliar para comparar dos listas
%    static bool AreListsEqual<T>(List<T> list1, List<T> list2)
%    {
%        if (list1.Count != list2.Count)
%            return false;
%
%        for (int i = 0; i < list1.Count; i++)
%        {
%            if (!list1[i].Equals(list2[i]))
%                return false;
%        }
%
%        return true;
%    }
% }
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Invierte una lista.

% Utiliza un acumulador para ir construyendo la lista invertida.
reverse_list(L, R) :- reverse_list(L, [], R).

% Caso base: cuando la lista original está vacía, el acumulador contiene la lista invertida.
reverse_list([], Acc, Acc).

% Caso recursivo: mueve el elemento de la cabeza al acumulador.
reverse_list([H|T], Acc, R) :- reverse_list(T, [H|Acc], R).

% Verifica si una lista es un palíndromo.

% Una lista es un palíndromo si es igual a su inversa.
palindrome(L) :- reverse_list(L, L).

% Ejemplo de uso:
% ?- palindrome(X, [a, b, c, d, c, b, a]).
% X = True.
% ----------------------------------------------