create_list_range(M, N, [M | TR]):-
    M < N, !,
    NewM is M + 1,
    create_list_range(NewM, N, TR).
create_list_range(N, N, [N]).