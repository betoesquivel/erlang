% elevas su argumento al doble
-module(baby).
-export ([concurrent/0]).

% concurrent processes
cycle () ->
    receive
        { rectangle, Width, Height } ->
            io:format("Area of the rectangle = ~p~n", [Width * Height]),
            ciclo();
        { circle, R } ->
            io:format("Area of the circle is ~p~n", [3.14159 * R * R]),
            ciclo();
        Other ->
            io:format(“Desconozco el area del ~p ~n", [Other]),
            ciclo()
    end.
