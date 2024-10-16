% Hechos: Definimos quién es el padre/madre de quién.
% Familia nuclear
padre(humberto, manuel).
padre(humberto, mario).
padre(humberto, jorge).
madre(xochitl, manuel).
madre(xochitl, mario).
madre(xochitl, jorge).

% Tios
padre(hector, emiliano).
madre(yadira, emiliano).

padre(ramon, sinai).
madre(lili, sinai).

% Abuelos
padre(jose, humberto).
madre(georgina, humberto).
padre(jose, hector).
madre(georgina, hector).
padre(jose, rachel).
madre(georgina, rachel).

padre(rosario, xochitl).
madre(maria, xochitl).
padre(rosario, quetzalcoatl).
madre(maria, quetzalcoatl).
padre(rosario, lili).
madre(maria, lili).
padre(rosario, julio).
madre(maria, julio).

% Género
mujer(xochitl).
mujer(georgina).
mujer(maria).
mujer(laura).
mujer(lili).
mujer(rachel).
mujer(sinai).
mujer(yadira).

hombre(humberto).
hombre(jose).
hombre(rosario).
hombre(manuel).
hombre(mario).
hombre(jorge).
hombre(julio).
hombre(hector).

hombre(ramon).
hombre(emiliano).

% Reglas: Definimos otras relaciones basadas en los hechos anteriores.
hermano(X, Y) :-
    padre(Z, X), padre(Z, Y),
    madre(W, X), madre(W, Y),
    X \= Y.

hermana(X, Y) :-
    padre(Z, X), padre(Z, Y),
    madre(W, X), madre(W, Y),
    X \= Y, mujer(X).

abuelo(X, Y) :-
    padre(X, Z), (padre(Z, Y); madre(Z, Y)).

abuela(X, Y) :-
    madre(X, Z), (padre(Z, Y); madre(Z, Y)).

% Definir tíos
tio(X, Y) :-
    hermano(X, Z), (padre(Z, Y); madre(Z, Y)).

tia(X, Y) :-
    hermana(X, Z), (padre(Z, Y); madre(Z, Y)).

% Definir primos
primo(X, Y) :-
    (padre(Z, X); madre(Z, X)),
    (hermano(Z, W); hermana(Z, W)),
    (padre(W, Y); madre(W, Y)).
