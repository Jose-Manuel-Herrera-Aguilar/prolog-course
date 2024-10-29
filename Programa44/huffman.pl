% ===============================================
% Autor: Herrera Aguilar José Manuel
% Fecha: 24 de octubre de 2024
% Descripción: Programa en Prolog que determina 
%              Genera un árbol de Huffman dado un conjunto de frecuencias.
%              Se incluye una versión comentada
%              en C# para referencia.
% ===============================================

% -------- Código en C# (comentado) ------------
% using System;
% using System.Collections.Generic;
% using System.Linq;
%
% namespace HuffmanCoding
% {
%    // Clase para representar un nodo en el árbol de Huffman
%    public class HuffmanNode
%    {
%        public char Character { get; set; }
%        public int Frequency { get; set; }
%        public HuffmanNode Left { get; set; }
%        public HuffmanNode Right { get; set; }
%
%        public HuffmanNode(char character, int frequency)
%        {
%            Character = character;
%            Frequency = frequency;
%        }
%        
%        // Comprueba si es un nodo hoja (es decir, si no tiene hijos)
%        public bool IsLeaf() => Left == null && Right == null;
%    }
%
%    class HuffmanCoding
%    {
%        public static HuffmanNode BuildHuffmanTree(List<KeyValuePair<char, int>> frequencies)
%        {
%            // Ordena la lista de frecuencias y convierte cada una en un nodo
%            var nodes = new List<HuffmanNode>(frequencies.Select(f => new HuffmanNode(f.Key, f.Value)));
%            nodes = nodes.OrderBy(n => n.Frequency).ToList();
%
%            while (nodes.Count > 1)
%            {
%                // Toma los dos nodos de menor frecuencia
%                var left = nodes[0];
%                var right = nodes[1];
%
%                // Crea un nuevo nodo padre con la suma de las frecuencias
%                var parent = new HuffmanNode('\0', left.Frequency + right.Frequency)
%                {
%                    Left = left,
%                    Right = right
%                };
%
%                // Quita los nodos usados y añade el nuevo nodo a la lista
%                nodes.RemoveRange(0, 2);
%                nodes.Add(parent);
%
%                // Ordena de nuevo para encontrar los nodos de menor frecuencia
%                nodes = nodes.OrderBy(n => n.Frequency).ToList();
%            }
%
%            // El último nodo en la lista es la raíz del árbol de Huffman
%            return nodes.First();
%        }
%
%        public static Dictionary<char, string> GenerateHuffmanCodes(HuffmanNode root)
%        {
%            var huffmanCodes = new Dictionary<char, string>();
%            GenerateHuffmanCodesRecursive(root, "", huffmanCodes);
%            return huffmanCodes;
%        }
%
%        private static void GenerateHuffmanCodesRecursive(HuffmanNode node, string code, Dictionary<char, string> huffmanCodes)
%        {
%            if (node == null)
%                return;
%
%            // Si es un nodo hoja, asigna el código binario
%            if (node.IsLeaf())
%            {
%                huffmanCodes[node.Character] = code;
%            }
%
%            // Recorre el árbol en profundidad
%            GenerateHuffmanCodesRecursive(node.Left, code + "0", huffmanCodes);
%            GenerateHuffmanCodesRecursive(node.Right, code + "1", huffmanCodes);
%        }
%
%        static void Main(string[] args)
%        {
%            // Ejemplo de entrada de frecuencias
%            var frequencies = new List<KeyValuePair<char, int>>
%            {
%                new KeyValuePair<char, int>('a', 5),
%                new KeyValuePair<char, int>('b', 9),
%                new KeyValuePair<char, int>('c', 12),
%                new KeyValuePair<char, int>('d', 13),
%                new KeyValuePair<char, int>('e', 16),
%                new KeyValuePair<char, int>('f', 45)
%            };
%
%            var huffmanTreeRoot = BuildHuffmanTree(frequencies);
%            var huffmanCodes = GenerateHuffmanCodes(huffmanTreeRoot);
%
%            Console.WriteLine("Huffman Codes:");
%            foreach (var code in huffmanCodes)
%            {
%                Console.WriteLine($"{code.Key}: {code.Value}");
%            }
%        }
%    }
% }
%
% ----------------------------------------------

% -------- Código en Prolog --------------------
% Representación de un nodo con estructura fr(Caracter, Frecuencia).
% Cada nodo hoja tiene el formato hc(Caracter, Codigo).

% Paso 1: Construye el árbol de Huffman a partir de una lista de frecuencias.
huffman(Frecuencias, Arbol) :-
    length(Frecuencias, Len), Len > 1,
    sort(2, @=<, Frecuencias, Ordenado),
    construir_arbol_huffman(Ordenado, Arbol).

% Caso base: si queda un solo nodo, se convierte en la raíz del árbol.
construir_arbol_huffman([Nodo], Nodo).

% Combina dos nodos de menor frecuencia y construye el árbol.
construir_arbol_huffman([fr(X, FX), fr(Y, FY) | Resto], Arbol) :-
    FTotal is FX + FY,
    NodoCombinado = fr(nodo(X, Y), FTotal),
    insert(NodoCombinado, Resto, NuevosNodos),
    construir_arbol_huffman(NuevosNodos, Arbol).

% Inserta un nodo en la lista manteniendo el orden ascendente de frecuencia.
insert(Nodo, [], [Nodo]).
insert(Nodo, [H | T], [Nodo, H | T]) :-
    Nodo = fr(_, F1), H = fr(_, F2), F1 =< F2, !.
insert(Nodo, [H | T], [H | R]) :-
    insert(Nodo, T, R).

% Paso 2: Genera los códigos binarios a partir del árbol.
generar_codigos_huffman(fr(C, _), Codigo, [hc(C, Codigo)]) :- atom(C), !.
generar_codigos_huffman(fr(nodo(Izq, Der), _), Codigo, Codigos) :-
    atom_concat(Codigo, '0', CodigoIzq),
    atom_concat(Codigo, '1', CodigoDer),
    generar_codigos_huffman(Izq, CodigoIzq, CodigosIzq),
    generar_codigos_huffman(Der, CodigoDer, CodigosDer),
    append(CodigosIzq, CodigosDer, Codigos).

% Ejemplo de ejecución: llama al predicado para construir el árbol y mostrar los códigos.
ejecutar_huffman :-
    % Define las frecuencias de ejemplo.
    Frecuencias = [fr(a, 5), fr(b, 9), fr(c, 12), fr(d, 13), fr(e, 16), fr(f, 45)],
    huffman(Frecuencias, Arbol),
    generar_codigos_huffman(Arbol, '', Codigos),
    writeln('Códigos de Huffman:'),
    imprimir_codigos(Codigos).

imprimir_codigos([]).
imprimir_codigos([hc(C, Code) | Resto]) :-
    format('~w: ~w~n', [C, Code]),
    imprimir_codigos(Resto).

% ----------------------------------------------