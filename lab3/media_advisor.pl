% rule 1
stimulus_situation(verbal) :- environment(papers);
                              environment(manuals);
                              environment(documents);
                              environment(textbooks).
% rule 2
stimulus_situation(visual) :- environment(pictures);
                              environment(illustrations);
                              environment(photographs);
                              environment(diagrams).

% rule 3
stimulus_situation('physical object') :- environment(machines);
                              environment(buildings);
                              environment(tools);
                              environment(computers).

% rule 4
stimulus_situation(symbolic) :- environment(numbers);
                              environment(formulas);
                              environment(computer_programs).

% Own rule
stimulus_situation(people_orientated) :- environment(tv);
                              environment(live_show).

% rule 5
stimulus_response(oral) :- job(lecturing);
                           job(advising);
                           job(counselling).

% rule 6
stimulus_response('hands-on') :- job(building);
                           job(repairing);
                           job(troubleshooting).
% rule 7
stimulus_response(documented) :- job(writing);
                           job(typing);
                           job(drawing).

% rule 8
stimulus_response(analytical) :- job(evaluating);
                           job(reasoning);
                           job(investigating).

% Own rule
stimulus_response(entertainment) :- job(magician);
                           job(presenter);
                           job(investigating).
                              
% rule 9
medium(workshop) :- stimulus_situation('physical object'),
                    stimulus_response('hands-on'),
                    feedback(yes).

% rule 10
medium(tutorial) :- stimulus_situation(symbolic),
                    stimulus_response(analytical),
                    feedback(yes).

% rule 11
medium(videocassette) :- stimulus_situation(visual),
                    stimulus_response(documented),
                    feedback(no).

% rule 12
medium('lecture tutorial') :- stimulus_situation(visual),
                    stimulus_response(oral),
                    feedback(yes).

% rule 13
medium('lecture tutorial') :- stimulus_situation(verbal),
                    stimulus_response(analytical),
                    feedback(yes).

% rule 14
medium('role-play exercises') :- stimulus_situation(verbal),
                    stimulus_response(oral),
                    feedback(yes).

% Own rules::::
medium('information technology') :- stimulus_situation(symbolic),
                    stimulus_response('hands-on'),
                    feedback(yes).

medium('magician') :- stimulus_situation(people_orientated),
                    stimulus_response(entertainment),
                    feedback(no).


% 3 inputs required: 1 environment 2 job, 3 feedback yes/no

go :- 
    getEnvironment,
    getJob,
    feedback,
    ( stimulus_situation(SS),
      nl, write('Stimulus situation is '), write(SS), nl,
    stimulus_response(QQ),
    write('Stimulus response is '), write(QQ), nl,
      medium(M),
    write('and your medium is '), write(M)
    ;
      writeln('Could not advise on an appropriate medium')
    ), 
    cleanInputs.

% Will do user I/O
getEnvironment :-
    write('Input the environment '), 
    read(E), 
    assert(environment(E)).

getJob :-
    write('Input the job'), 
    read(G), 
    assert(job(G)).

feedback :-       
    write('Is feedback required yes/no '),
    read(F),
    assert(feedback(F)).
      
cleanInputs :- 
    retractall(environment(_)),
    retractall(job(_)),
    retractall(feedback(_)).

% job(lecturing)
% New fact in prolog: assert(environment(manuals)). 
% enviornment(E). will then return manuals.
% stimulus_situation(X). will return X = verbal.
