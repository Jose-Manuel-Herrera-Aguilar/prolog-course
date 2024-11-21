% Datos del caso
acusado(3, "Andrés Mendoza", "Feminicida de Atizapán").
crimen(3, feminicidio_serial).
nivel_empatia(3, muy_bajo).

% Recuerdos disponibles
recuerdo_disponible("dolor de las víctimas").
recuerdo_disponible("destrucción familiar").
recuerdo_disponible("pérdida irreparable").

% Resultados esperados
resultado_esperado(3, "reflexión y remordimiento").

seleccionar_recuerdo(Crimen, Empatia, Recuerdo) :-
    crimen(_, Crimen),
    nivel_empatia(_, Empatia),
    (
        (Crimen = feminicidio_serial, Empatia = muy_bajo, Recuerdo = "dolor de las víctimas");
        (Crimen = feminicidio_serial, Empatia = muy_bajo, Recuerdo = "destrucción familiar")
    ).

evaluar_impacto(Recuerdo, Impacto) :-
    (
        Recuerdo = "dolor de las víctimas", Impacto = "empatía generada";
        Recuerdo = "destrucción familiar", Impacto = "remordimiento profundo"
    ).

rehabilitacion(Acusado, Resultado) :-
    acusado(Acusado, _, _),
    seleccionar_recuerdo(_, muy_bajo, Recuerdo),
    evaluar_impacto(Recuerdo, Impacto),
    Impacto = "remordimiento profundo",
    Resultado = "rehabilitación parcial".