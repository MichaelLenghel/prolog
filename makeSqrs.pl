%% makeSqrs([1,2,4,3,7], L).
%% L = [1,4,16, 9, 49].

makeSqrs([], []).

% N = numberi n front of the list, R = rest of list
makeSqrs([N|R], [N1|R1]) :-
	N1 is N * N,
	makeSqrs(R, R1).

% More sophisticated way: 

%% makeSqPairs([1,2,4,3,7], L).
%% L = [(1,1),(2, 4),(4, 16), (3,9), (7, 49)].
makeSqPairs([N|R], [(N,N1) | R1]) :-
	N1 is N * N,
	makeSqPairs(R, R1).
