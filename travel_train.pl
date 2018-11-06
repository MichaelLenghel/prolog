%% travel(A,B) :- goDirect(A,C), travel(C, B).

%% % Go is a functor
%% travel(A, B, go(A,B)) :- goDirect(A,B).

%% % This is a recursive soln. that will say all locations
%% travel(A,B, go(A,B, X)) :- goDirect(A,C), travel(C,B, X).% travel(frankfurt, bangkok, X). %% Will say what x is (go From frankfurt to bangkok)

%% travelRoute(A, B, [A,B]) :- goDirect(A, B).


%% % Would find all the routes by train
%% travelRoute(A, B, [(A,B, train)]) :- byTrain(A, B).

%% travelRoute(A,B, [A|R]) :- goDirect(A, C), travelRoute(C, B, R). %Run: travelRote(valmont, raglan, X).


directTrain(nancy,metz).
directTrain(metz,fahlquemont).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(forbach,saarbruecken).
directTrain(saarbruecken,dudweiler).
directTrain(freyming,forbach).

goDirect(A, B) :-
	byCar(A, B),
	byTrain(A,B),
	byPlane(A,B).

%% That is, this knowledge base holds facts about towns it is possible to travel
%% between by taking a direct train. But of course, we can travel further by
%% `chaining together' direct train journeys. Write a recursive predicate
%% travelBetween/2 that tells us when we can travel by train between two
%% towns. For example, when given the query
%% travelBetween(nancy,saarbruecken).
%% it should reply `yes'.

travelBetween(X,Y) :- directTrain(X,Y).
travelBetween(X,Y) :-
  directTrain(X,Z),
  travelBetween(Z,Y).

%% It is, furthermore, plausible to assume that whenever it is possible to take
%% a direct train from A to B, it is also possible to take a direct train from B
%% to A. Can you encode this in Prolog? You program should e.g. answer `yes' to
%% the following query:
%% travelBetween(saarbruecken,nancy).
%% Do you see any problems you program may run into?

travelBetween(X,Y) :- directTrain(X,Y).
travelBetween(X,Y) :- directTrain(Y,X).
travelBetween(X,Y) :-
  directTrain(X,Z),
  travelBetween(Z,Y).
travelBetween(X,Y) :-
  directTrain(Z,X),
  travelBetween(Z, Y).

%% You will end up in infinite loops since you can go both directions, so it is
%% possible to keep calling the same function over and over.