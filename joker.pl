% Datos del caso
acusado(1, "Oswald Hubert Loomis", "El Bromista").
crimen(1, secuestro).
crimen(1, robo).
crimen(1, caos_publico).
nivel_empatia(1, bajo).

% Recuerdos disponibles
recuerdo_disponible("sufrimiento de las víctimas").
recuerdo_disponible("consecuencias legales").
recuerdo_disponible("impacto social negativo").

% Resultados esperados
resultado_esperado(1, "aumento de empatía").

% Selección de recuerdos basados en el crimen y nivel de empatía
seleccionar_recuerdo(Crimen, Empatia, Recuerdo) :-
    crimen(_, Crimen),
    nivel_empatia(_, Empatia),
    (
        (Crimen = secuestro, Empatia = bajo, Recuerdo = "sufrimiento de las víctimas");
        (Crimen = robo, Empatia = bajo, Recuerdo = "consecuencias legales");
        (Crimen = caos_publico, Empatia = bajo, Recuerdo = "impacto social negativo")
    ).

% Evaluar el impacto de un recuerdo
evaluar_impacto(Recuerdo, Impacto) :-
    (
        Recuerdo = "sufrimiento de las víctimas", Impacto = "aumento de empatía";
        Recuerdo = "consecuencias legales", Impacto = "miedo a la retribución";
        Recuerdo = "impacto social negativo", Impacto = "deseo de aceptación social"
    ).

% Proceso de rehabilitación
rehabilitacion(Acusado, Resultado) :-
    acusado(Acusado, _, _),
    seleccionar_recuerdo(_, bajo, Recuerdo),
    evaluar_impacto(Recuerdo, Impacto),
    Impacto = "aumento de empatía",
    Resultado = "rehabilitación exitosa".