-module(act).
-export([secuencia/1, secaux/2, mapea/2, formula_general/3]).

formula_general (A, B, C) <Aqui va una guardia para cuando no hay raices> -> {A, B};
formula_general (A, B, C) -> {A, B}.

secuencia (N) when N > 0 -> secaux(1, N).

secaux (X, N) when X < N -> [X] ++ secaux(X+1, N);
secaux (X, N) when X == N -> [X].

mapea (_, []) -> [];
mapea (F, [H|T]) -> [F (H) |  mapea (F, T)].
