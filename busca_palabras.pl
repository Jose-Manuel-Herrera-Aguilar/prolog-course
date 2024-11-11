% Definimos la sopa de letras como una lista de listas de letras.
letras(
  [[r, a, m, a, m, a, m, r],
   [f, r, e, t, n, i, e, v],
   [e, r, r, a, m, r, m, a],
   [l, r, a, b, a, a, r, m],
   [b, m, m, r, u, n, a, m],
   [r, o, m, z, o, r, m, r],
   [n, m, o, i, a, r, m, e],
   [r, n, s, m, r, a, a, m],
   [r, i, r, a, a, m, m, o],
   [r, m, r, a, a, r, m, r]]).

% Buscamos palabras sin las letras M, A, ni R.
valid_word(Word) :-
    \+ member(m, Word),
    \+ member(a, Word),
    \+ member(r, Word).

% Verificamos las palabras que aparecen en las filas.
find_words(Row, Word) :-
    sublist(Word, Row),        % Busca sublistas (palabras) dentro de la fila.
    valid_word(Word).          % Verifica que la palabra sea válida.

% Encontrar todas las palabras en la sopa de letras.
solve :-
    letras(Grid),
    % Buscamos en cada fila
    member(Row, Grid),
    find_words(Row, Word),
    write(Word), nl,            % Escribimos la palabra encontrada.
    fail.                       % Forzamos a Prolog a continuar buscando.
solve. 

% Caso base para terminar la búsqueda sin imprimir nada adicional.
solve.
