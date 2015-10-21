/**
* prolog 2 worksheet 
* author: andrew watts
* description: my attempts at programming in prolog and 
* trying the practice problems given.
* version: 1
*
*/
% problem 1: separate
separate([], [], []).
separate(In, Out1, Out2) :-
    append(Out1, Out2, In).



% problem 2: partition
partition(_X, [], [], []).
partition(X, [Y|Tail], [Y|Small], Big) :-
    X >= Y,                         
    partition(X, Tail, Small, Big).
partition(X, [Y|Tail], Small, [Y|Big]) :-
    X < Y,
    partition(X, Tail, Small, Big).






% problem 3: quicksort
quicksort([],[]).
quicksort([X|Tail], Sorted) :-
    partition(X,Tail,Small,Big),
    quicksort(Small, SSmall),
    quicksort(Big, SBig),
    append(SSmall, [X|SBig], Sorted).




% problem 4: mini
mini([H|T], Min) :-
    mini(T, H, Min).
mini([], Min, Min).
mini([H|T], Min0, Min) :-
    Min1 is min(H, Min0),
    mini(T, Min1, Min).



             
% problem 5: reverse, uses provided app/3 procedure
app([],[],[]).
app([], [H|T], [H|T]).
app([H|T], L, [H|R]) :- 
    app(T,L,R).
rev([],[]).
rev([H|T], R) :- 
    rev(T, Rev), app(Rev, [H], R).




% problem 6: how many times does append app get called to reverse a simple list? is it inefficient?
% to be honest, when i run trace it calls and then returns and exits. i will ask you about it tomorrow because i am sure i am doing it wrong.




% problem 7: rev2
rev2(X,Y) :- rev2recursive(X, [], Y).
rev2recursive([], Solution, Solution).
rev2recursive([H,T], Partial, Z) :- rev2recursive(T, [H|Partial], Z).




% problem 8: insertionsort
insertsort([A|B], Complete) :- 
    insertsort(B, CompleteTail), insert(A, CompleteTail, Complete).
insertsort([],[]).
insert(A, [B|C], [B|D]) :-
    A @> B, !, insert(A, C, D).
insert(A, C, [A|C]).
