# Árbol Genealógico Familiar

## Descripción
Este proyecto contiene un árbol genealógico simple, modelado en **Prolog** y visualizado con un diagrama en **Mermaid**. Representa las relaciones familiares de tres generaciones, incluyendo padres, hijos, abuelos, tíos y primos.

## Contenido
- **Código en Prolog**: Define las relaciones familiares básicas y las reglas de parentesco.
- **Diagrama en Mermaid**: Una representación visual del árbol genealógico.
  
## Estructura del Proyecto
1. **Hechos**: Información básica sobre padres y madres.
2. **Reglas**: Definición de relaciones como hermanos, abuelos, tíos, primos, etc.
3. **Consultas**: Ejemplos de cómo consultar el árbol genealógico.

## Autor
- José Manuel Herrera Aguilar

# Demostración en Asciinema

Aquí tienes una grabación de terminal utilizando **asciinema** para visualizar el uso de Prolog:

[![asciicast](https://asciinema.org/a/mu07gk5fyDm9czQSIeM4a44ID.svg)](https://asciinema.org/a/mu07gk5fyDm9czQSIeM4a44ID)

# Diagrama del arbol genealogico en Mermaid

```mermaid
graph TD
    %% Familia nuclear
    A[Humberto] --> B[Manuel]
    A[Humberto] --> C[Mario]
    A[Humberto] --> D[Jorge]
    X[Xochitl] --> B[Manuel]
    X[Xochitl] --> C[Mario]
    X[Xochitl] --> D[Jorge]

    %% Tíos
    E[Hector] --> F[Emiliano]
    Y[Yadira] --> F[Emiliano]
    G[Ramon] --> H[Sinai]
    Z[Lili] --> H[Sinai]

    %% Abuelos paternos
    I[Jose] --> A[Humberto]
    J[Georgina] --> A[Humberto]
    I[Jose] --> E[Hector]
    J[Georgina] --> E[Hector]
    I[Jose] --> K[Rachel]
    J[Georgina] --> K[Rachel]

    %% Abuelos maternos
    L[Rosario] --> X[Xochitl]
    M[Maria] --> X[Xochitl]
    L[Rosario] --> N[Quetzalcoatl]
    M[Maria] --> N[Quetzalcoatl]
    L[Rosario] --> Z[Lili]
    M[Maria] --> Z[Lili]
    L[Rosario] --> O[Julio]
    M[Maria] --> O[Julio]
````
# Primeros 30 programas de Prolog

## Video de ejecución de los 30 programas de Prolog
