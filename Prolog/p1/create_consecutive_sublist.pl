create_consecutive_sublist(L, Start, End, SL) :-
    Start > 0,
    End >= Start,
    sublist_index(L, Start, End, 1, SL).

sublist_index(_, _, End, I, []):-
    I > End, !.
sublist_index([_ | T], Start, End, I, SL):-
    I < Start, !,
    NextI is I + 1,
    sublist_index(T, Start, End, NextI, SL).
sublist_index([H | T], Start, End, I, [H | SL]):-
    NextI is I + 1,
    sublist_index(T, Start, End, NextI, SL).