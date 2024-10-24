% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 22 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% class Program
% {
%    // Método principal
%    static void Main(string[] args)
%    {
%        // Ejemplo de uso
%        List<int> elementos = new List<int> { 1, 2, 3, 4, 5 };
%        List<int> tamaños = new List<int> { 2, 3 };
%        
%        List<List<List<int>>> grupos = Agrupar(elementos, tamaños);
%        
%        // Mostrar los grupos
%        foreach (var grupo in grupos)
%        {
%            Console.WriteLine("Grupo:");
%            foreach (var subgrupo in grupo)
%            {
%                Console.WriteLine($"  Subgrupo: {string.Join(", ", subgrupo)}");
%            }
%        }
%    }
%
%    // Método que agrupa elementos
%    static List<List<List<int>>> Agrupar(List<int> elementos, List<int> tamaños)
%    {
%        var resultado = new List<List<List<int>>>();
%        AgruparRecursivo(elementos, tamaños, new List<List<int>>(), resultado);
%        return resultado;
%    }
%
%    // Método recursivo para agrupar
%    static void AgruparRecursivo(List<int> elementos, List<int> tamaños, List<List<int>> gruposActuales, List<List<List<int>>> resultado)
%    {
%        // Si no quedan tamaños por agrupar
%        if (tamaños.Count == 0)
%        {
%            resultado.Add(new List<List<int>>(gruposActuales));
%            return;
%        }
%
%        // Tomar el primer tamaño
%        int tamañoActual = tamaños[0];
%
%        // Generar combinaciones de elementos
%        var combinaciones = ObtenerCombinaciones(elementos, tamañoActual);
%
%        foreach (var combinacion in combinaciones)
%        {
%            var nuevoElemento = new List<int>(combinacion);
%            var nuevosElementos = elementos.Except(combinacion).ToList();
%            var nuevosTamaños = tamaños.Skip(1).ToList();
%
%            gruposActuales.Add(nuevoElemento);
%            AgruparRecursivo(nuevosElementos, nuevosTamaños, gruposActuales, resultado);
%            gruposActuales.RemoveAt(gruposActuales.Count - 1);
%        }
%    }
%
%    // Método para obtener combinaciones
%    static List<List<int>> ObtenerCombinaciones(List<int> lista, int tamaño)
%    {
%        if (tamaño > lista.Count || tamaño <= 0) return new List<List<int>>();
%
%        return ObtenerCombinaciones(lista, tamaño, 0);
%    }
%
%    // Método auxiliar para generar combinaciones
%    private static List<List<int>> ObtenerCombinaciones(List<int> lista, int tamaño, int inicio)
%    {
%        if (tamaño == 0) return new List<List<int>> { new List<int>() };
%
%        var combinaciones = new List<List<int>>();
%
%        for (int i = inicio; i <= lista.Count - tamaño; i++)
%        {
%            var subCombinaciones = ObtenerCombinaciones(lista, tamaño - 1, i + 1);
%            foreach (var sub in subCombinaciones)
%            {
%                sub.Insert(0, lista[i]);
%                combinaciones.Add(sub);
%            }
%        }
%
%        return combinaciones;
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Agrupa los elementos de un conjunto en subconjuntos disjuntos dados los tamaños de los subgrupos.
group([], [], []).
group([N|Ns], Es, [G|Gs]) :- combination(N, Es, G), subtract(Es, G, Rest), group(Ns, Rest, Gs).

% ----------------------------------------------