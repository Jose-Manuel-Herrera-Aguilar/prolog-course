% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Elimina el k-ésimo elemento de una lista.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
%
% public class RemoveAtK
% {
%    // Función que elimina el k-ésimo elemento de una lista
%    public static List<T> RemoveAt<T>(List<T> list, int k, out T removedElement)
%    {
%        if (k < 1 || k > list.Count)
%        {
%            throw new ArgumentOutOfRangeException(nameof(k), "El índice debe ser mayor que 0 y menor o igual al tamaño de la lista.");
%        }
%
%        // Almacenar el elemento que será eliminado
%        removedElement = list[k - 1];
%
%        // Crear una nueva lista sin el elemento eliminado
%        List<T> newList = new List<T>(list);
%        newList.RemoveAt(k - 1);
%
%        return newList;
%    }
%
%    // Método principal para pruebas
%    public static void Main(string[] args)
%    {
%        List<int> lista = new List<int> { 1, 2, 3, 4, 5 };
%        int k = 3;
%        
%        // Llamada a la función para eliminar el k-ésimo elemento
%        int elementoEliminado;
%        List<int> nuevaLista = RemoveAt(lista, k, out elementoEliminado);
%
%        Console.WriteLine("Elemento eliminado: " + elementoEliminado);
%        Console.WriteLine("Lista resultante: " + string.Join(", ", nuevaLista));
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Elimina el k-ésimo elemento de una lista.

% El índice K debe ser mayor que 0.
remove_at(X, [X|T], 1, T).
remove_at(X, [H|T], K, [H|R]) :- K > 1, K1 is K - 1, remove_at(X, T, K1, R).

% ----------------------------------------------