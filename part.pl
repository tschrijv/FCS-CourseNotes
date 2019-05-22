part([X],Parts) :- !, Parts = [[[X]]].
part([X|R],Parts) :-
	part(R,P1),
	add(P1,X,Parts).

add([],_,[]).
add([P|Ps],X,Parts) :-
	add21(P,X,Parts,T),
	add(Ps,X,T).

add21(P,X,Parts,T) :-
	findall(Pnew,a(P,X,Pnew),Parts,T).

a([],X,[[X]]).
a([A|R],X,Out) :-
	(
	  Out = [[X|A]|R]
	;
	  Out = [A|S],
	  a(R,X,S)
	).


t(L) :-
	part(L,Ps),
	wps(Ps,0).

wps([],_).
wps([X|R],N) :-
	write('S_'), write(N), write(' = '),
	writeln(X),
	M is N + 1,
	wps(R,M).
