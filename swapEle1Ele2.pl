%base
swap12([],[]).
%recur
swap12([X,Y|list], [Y,X|list]).