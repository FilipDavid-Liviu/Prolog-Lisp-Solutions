list_even_length([]).
list_even_length([_, _ | T]):-
    list_even_length(T).