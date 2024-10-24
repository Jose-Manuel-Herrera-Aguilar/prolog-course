% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Rota una lista N lugares a la izquierda.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% public class ListRotator
% {
%    // Método para rotar una lista N lugares a la izquierda
%    public static List<T> Rotate<T>(List<T> list, int n)
%    {
%        // Obtener la longitud de la lista
%        int len = list.Count;
%        
%        // Manejar casos en los que N sea mayor que la longitud
%        int n1 = n % len;
%        
%        // Dividir la lista en dos partes
%        List<T> l1 = list.GetRange(0, n1);  // Desde el inicio hasta el N1-esimo elemento
%        List<T> l2 = list.GetRange(n1, len - n1); // Desde N1 hasta el final
%        
%        // Concatenar las dos partes
%        List<T> result = new List<T>(l2);
%        result.AddRange(l1);
%        
%        return result;
%    }
%    
%    public static void Main(string[] args)
%    {
%        // Ejemplo de uso
%        List<int> list = new List<int> { 1, 2, 3, 4, 5, 6 };
%        int n = 2;
%
%        List<int> rotatedList = Rotate(list, n);
%
%        Console.WriteLine("Lista original: " + string.Join(", ", list));
%        Console.WriteLine($"Lista rotada {n} posiciones a la izquierda: " + string.Join(", ", rotatedList));
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Rota una lista N lugares a la izquierda.

% Utiliza la longitud de la lista para manejar rotaciones mayores que la longitud.
rotate(L, N, R) :- length(L, Len), N1 is N mod Len, split(L, N1, L1, L2), append(L2, L1, R).

% ----------------------------------------------