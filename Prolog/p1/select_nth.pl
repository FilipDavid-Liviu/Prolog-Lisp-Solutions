select_nth([H | _], N, H):-
    N =:= 1, !.
select_nth([_ | T], N, R):-
    NewN is N - 1,
    select_nth(T, NewN, R).