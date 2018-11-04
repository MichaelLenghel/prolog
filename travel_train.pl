%Sample run: travel(valmont, raglan).

travel(A, B) :- goDirect(A, B).

goDirect(A, B) :-
	byCar(A, B),
	byTrain(A,B),
	byPlane(A,B).

travel(A,B) :- goDirect(A,C), travel(C, B).

% Go is a functor
travel(A, B, go(A,B)) :- goDirect(A,B).

% This is a recursive soln. that will say all locations
travel(A,B, go(A,B, X)) :- goDirect(A,C), travel(C,B, X).% travel(frankfurt, bangkok, X). %% Will say what x is (go From frankfurt to bangkok)

travelRoute(A, B, [A,B]) :- goDirect(A, B).


% Would find all the routes by train
travelRoute(A, B, [(A,B, train)]) :- byTrain(A, B).

travelRoute(A,B, [A|R]) :- goDirect(A, C), travelRoute(C, B, R). %Run: travelRote(valmont, raglan, X).