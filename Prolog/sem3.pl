process([], []).
process([H|T], R):-
    is_list(H), !,
    process(T, R).
process([H|T], [H|R]):-
    % not(is_list(H)), % \+ is_list(H), % atomic(H)
    process(T, R).



%Given a list of numbers and sublist of numbers, substitute each sublist for which the sum of the elements is odd
% with the first element of that list. We assume sublist have at least one element


sum([], 0).
sum([H|T], S):-
    sum(T, TS),
    S is H+TS.
head_of_list([H|_], H).

process2([], []).
process2([H|T], [HH|R]):-
    is_list(H),
    sum(H, SL),
    Re is SL mod 2,
    Re =:= 1, !,
    head_of_list(H, HH),
    process2(T, R).
process2([H|T], [H|R]):-
    process2(T, R).



%Mountain????

process([], []).
process([H|T], [H1|R]):-
    is_list(H),
    m_mountain(H),!,
    remove_odd(H, H1),
    process(T,R).


%remove increasing sequences of numbers from a list

%l1 < l2 < l3
%l1 < l2 > l3
%l1 > l2


rem_inc([], []).

rem_inc[[_], [_]].

rem_inc[[H1, H2], []]:- H1<H2.

rem_inc[[H1, H2 | T], [H1 | R]]:-
    H1 >= H2,
    rem_inc[[H2 | T], R].

rem_inc[[H1, H2, H3 | T], R]:-
    H1 < H2,
    H2 < H3, !.
    rem_inc[[H2, H3 | T], R].

rem_inc[[H1, H2, H3 | T], R]:-
    H1 < H2,
    H2 >= H3, !.
    rem_inc[[H3 | T], R].
