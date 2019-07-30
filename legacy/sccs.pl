/*
algorithm tarjan is
input: graph G = (V, E)
output: set of strongly connected components (sets of vertices)

index := 0
S := empty
for each v in V do
    if (v.index is undefined) then
       strongconnect(v)
end if
end for

function strongconnect(v)
// Set the depth index for v to the smallest unused index
v.index := index
v.lowlink := index
index := index + 1
S.push(v)

// Consider successors of v
for each (v, w) in E do
     if (w.index is undefined) then
       // Successor w has not yet been visited; recurse on it
       strongconnect(w)
       v.lowlink  := min(v.lowlink, w.lowlink)
     else if (w is in S) then

     // Successor w is in stack S and hence in the current SCC
     v.lowlink  := min(v.lowlink, w.index)
     end if
end for

// If v is a root node, pop the stack and generate an SCC
if (v.lowlink = v.index) then
    start a new strongly connected component
    repeat
    w := S.pop()
    add w to current strongly connected component
    until (w = v)
    output the current strongly connected component
end if
end function
*/

tarjan(Edges) :-
	findall(Node,(member(E,Edges), (E = (X,_) ; E = (_,X))),L),
	sort(L,Nodes),
	Stack = [],
	Index = [],
	Lowlink = [],
	Index = 1,
	tarjanloop(Nodes,Edges,Stack,Index,Lowlink,Index).

tarjanloop([],_,_,_,_).
tarjanloop([N|Nodes],Edges,Stack,Lowlink,Index) :-
	(member(N-_,Index) ->
	    true
	;
	    strongconnect(N,Edges,Stack,NewStack,Lowlink,NewLowlink,Index,NewIndex),
	    tarjanloop(Nodes,Edges,NewStack,NewLowlink,NewIndex)
	).

strongconnect

