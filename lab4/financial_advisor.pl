%% Student Number = C16434974
%% Student Name = Michael Lenghel

%% How to run::

%% Input the amount_saved 900.
%% Input earnings per year|: 500.
%% Input if job is steady or not|: steady.
%% Input the number of dependencies |: 3.

%% Input the amount_saved 25000.
%% Input earnings per year|: 9000.
%% Input if job is steady or not|: unsteady.
%% Input the number of dependencies |: 3.

%% Input the amount_saved 50000.
%% Input earnings per year|: 3.
%% Input if job is steady or not|: steady.
%% Input the number of dependencies |: 3.

% rule 1
investment(savings) :- savings_account(inadequate).

%rule 2
investment(stocks) :- 
					savings_account(adequate),
					income(adequate).

%rule 3
investment(combination) :-
					savings_account(adequate),
					income(inadequate).

%Own rule
investment(savings) :-
					savings_account(inadequate),
					income(adequate).

%rule 4
savings_account(adequate) :-
                        amount_saved(X),
                        dependencies(Y),
                        min_savings(Y, MS),
                        X > MS.

%rule 5
savings_account(inadequate) :-
                        amount_saved(X),
                        dependencies(Y),
                        min_savings(Y, MS),
                        X < MS.

%rule 6
income(adequate) :-
				earnings(X, steady),
				dependencies(Y),
				min_income(Y, MI),
				X > MI.

%rule 7
income(inadequate) :-
				earnings(X, steady),
				dependencies(Y),
				min_income(Y, MI),
				X < MI.

%rule 8
income(inadequate) :- earnings(X, unsteady).

min_savings(Y, MS) :-
				MS is 5000 * Y.
						% min_saving will return MS

min_income(Y, MI) :-
                MI is 15000 + (4000 * Y).


%% amount_saved(900).
%% % Earnings how much he saved in a year
%% earnings(500, steady).
%% dependencies(3).

go :- 
    getAmtSaved,
    getEarnings,
    getSteady,
    get_dependents,
    ( savings_account(SS),
      nl, write('Your saving account is '), write(SS), nl,
    income(QQ),
    write('Your income is '), write(QQ), nl,
      investment(M),
    write('and you should invest your money in '), write(M)
    ;
      writeln('Could not advise on an appropriate investment')
    ).

% Will do user I/O
getAmtSaved :-
    write('Input the amount_saved '), 
    read(E), 
    assert(amount_saved(E)).

getEarnings :-
    write('Input earnings per year'),
    read(S),
    assert(earns(S)).

getSteady :-
    write('Input if job is steady or not'),
    read(R),
    earns(S),
    assert(earnings(S, R)).

get_dependents :-       
    write('Input the number of dependencies '),
    read(F),
    assert(dependencies(F)).
      
cleanInputs :- 
    retractall(investment(_)),
    retractall(savings_account(_)),
    retractall(income(_)).