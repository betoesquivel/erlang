% elevas su argumento al doble
-module(baby).
-export ([doble/1, factorial/1, stringLength/1, fibonacci/1, qsort/1, conv_long/1, list_long/1, kiss_me/0, month_length/2, kiss_me_alot/1 ]).

doble ( N ) -> N * 2.

factorial (0) -> 1;
factorial (N) when N > 0 -> N*factorial(N-1).

fibonacci (1) -> 1;
fibonacci (2) -> 2;
fibonacci (N) when N > 2 -> fibonacci (N-1) + fibonacci (N-2).

qsort ([]) -> [];
qsort ([Pivot|Rest]) -> 
    qsort([Front || Front <- Rest, Front < Pivot]) ++
    [Pivot] ++
    qsort([Back || Back <- Rest, Back >= Pivot]).

stringLength ( S ) ->
    length(S).

% Para hacer tuplas, uso las llaves
conv_long ({cm, X}) ->
    {in, X / 2.54};
conv_long ({in, X}) ->
    {cm, X * 2.54}.

% También puedo usar variables anónimas, igual que en haskell
% En lugar de los : de haskell, pongo una |
list_long([]) -> 0;
list_long([_ | Rest]) ->
    1+list_long(Rest).

% me besa
kiss_me() -> io:put_chars( "*Smooch*" ).

% me besa n veces
kiss_me_alot(0) -> io:put_chars( "!!!\n" );
kiss_me_alot(N) when N > 0 -> io:put_chars("*Smooch*"),  kiss_me_alot(N-1).

% tengo funciones trunc y tambien tengo ifs
%
month_length(Year, Month) ->
    Leap = if
        trunc(Year/400) * 400 == Year ->
            leap;
        Year rem 100 == 0 -> % this is the same as above
            not_leap;
        trunc(Year/4) * 4 == Year ->
            leap;
        true -> not_leap % esto es como el else
    end,
    case Month of
        sep -> 30;
        apr -> 30;
        jun -> 30;
        nov -> 30;
        feb when Leap == leap -> 29;
        feb -> 28;
        jan -> 31;
        mar -> 31;
        may -> 31;
        jul -> 31;
        aug -> 31;
        oct -> 31;
        dec -> 31
    end.


% tengo map, all, any, foreach, fold, foldr, foldl
