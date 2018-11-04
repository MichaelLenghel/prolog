sumList1([], 0).
sumList1([X|T], S) :-
	sumList1(T, S1),
	S is X + S1.

% sumList([1, 6, 5], S)
% S is 1 + s1
% S1 is 6 + S2
% sumList([], S3)
% S3 = 0

%% Then stack goes back up so:
% S2 = 5
% s1 = 11
% s = 12

% Now using an accumulator (Useful):::

sumList2(L, N) :-
	sumList2(L, 0, N). % The accumulator is the middle paramteter '0'. Also know as an auxillay predicate

sumList2([], N, N).

% N holds the answer, A is the accumulator
sumList2([X|T], A, N) :-
	A2 is A + X,
	sumList2(T, A2, N).

% HOw to run accumulator:
% sumList2([1, 6, 5], N).
%Worked Example of accumulator:
	% sumList2([1, 6, 5], 0, N)
	% sumList2([6, 5], 1, N)
	% sumList2([5], 7, N)
	% sumList2([], 12, N)
	% Base case terminates it so:
	% sumList2([], 12, 12)

duplicate([1,9,6,0,d], L)

L = [1,1,9,9,6,6,0,0,d,d]
duplicate([],[])

duplicate([H|T], [H,H|T2]) :-
	duplicate(T, T2).