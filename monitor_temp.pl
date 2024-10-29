:- use_module(library(ansi_term)).
:- use_module(library(readutil)).

% Define las reglas lógicas
accion_based_on_temp(Temp) :-
    Temp < 20,
    writeln('Temperatura baja: Encender la luz.').
accion_based_on_temp(Temp) :-
    Temp >= 20,
    Temp < 30,
    writeln('Temperatura óptima: Mantener todo como está.').
accion_based_on_temp(Temp) :-
    Temp >= 30,
    writeln('Temperatura alta: Encender el ventilador.').

% Función para leer del puerto serial
leer_serial(Puerto) :-
    setup_call_cleanup(
        open(Puerto, read, Stream, [type(text)]),
        leer_datos(Stream),
        close(Stream)
    ).

leer_datos(Stream) :-
    read_line_to_string(Stream, Line),
    (   Line \= end_of_file,
        catch(number_string(Temp, Line),
              _,
              (writeln('Error al convertir la lectura a número.'), Temp = 0)),
        format('Temperatura leída: ~w°C~n', [Temp]),
        accion_based_on_temp(Temp),
        leer_datos(Stream)
    ;
        writeln('Fin de la lectura serial.')
    ).

% Punto de entrada
:- initialization(main).

main :-
    % Reemplaza 'COM5' con el puerto correcto
    Puerto = 'COM5',
    writeln('Iniciando monitor de temperatura...'),
    leer_serial(Puerto).