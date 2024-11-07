% Predicado principal: Resolver el crucigrama
solve_crossword(Puzzle, Words, Solution) :-
    find_sites(Puzzle, Sites),        % Encuentra todos los sitios vacíos
    place_words(Sites, Words),        % Coloca las palabras en los sitios
    Solution = Puzzle.

% Encuentra los sitios vacíos en el crucigrama
find_sites(Puzzle, Sites) :-
    find_horizontal_sites(Puzzle, HorSites),   % Encuentra sitios horizontales
    transpose(Puzzle, Transposed),             % Transponer el crucigrama para procesar columnas
    find_horizontal_sites(Transposed, VerSites),  % Encuentra sitios verticales
    append(HorSites, VerSites, Sites).         % Combina los sitios horizontales y verticales

% Encuentra sitios horizontales en una lista de listas (filas del crucigrama)
find_horizontal_sites([], []).
find_horizontal_sites([Row|Rows], Sites) :-
    find_sites_in_row(Row, RowSites),
    find_horizontal_sites(Rows, RemainingSites),
    append(RowSites, RemainingSites, Sites).

% Encuentra los sitios en una fila
find_sites_in_row(Row, Sites) :-
    split_row(Row, [], RowSites),
    exclude(empty_site, RowSites, Sites).  % Filtra sitios vacíos.

% Define un sitio vacío
empty_site([]).

% Divide una fila en sitios vacíos consecutivos
split_row([], Acc, [Acc]) :- Acc \= [].
split_row([], _, []).
split_row([H|T], Acc, Sites) :-
    (H == '.' ->
        append(Acc, [H], NewAcc),
        split_row(T, NewAcc, Sites)
    ;
        (Acc \= [] ->
            Sites = [Acc|RemainingSites]
        ;
            Sites = RemainingSites
        ),
        split_row(T, [], RemainingSites)
    ).

% Transponer una matriz (de filas a columnas)
transpose([], []).
transpose([[]|_], []).
transpose(Matrix, [Row|Rows]) :-
    maplist(nth1(1), Matrix, Row),
    maplist(tail, Matrix, RestMatrix),
    transpose(RestMatrix, Rows).

tail([_|T], T).

% Coloca las palabras en los sitios
place_words([], []).
place_words([Site|Sites], Words) :-
    select(Word, Words, RemainingWords),
    same_length(Site, Word),  % Verifica que la palabra tiene la misma longitud que el sitio
    match(Site, Word),        % Verifica que la palabra coincide con las restricciones del sitio
    place_words(Sites, RemainingWords).

% Verifica si una palabra coincide con las restricciones de un sitio
match([], []).
match([S|Site], [W|Word]) :-
    (S == '.' ; S == W),  % La celda es vacía o ya contiene la letra correcta
    match(Site, Word).

% Verifica si dos listas tienen la misma longitud
same_length([], []).
same_length([_|L1], [_|L2]) :-
    same_length(L1, L2).
