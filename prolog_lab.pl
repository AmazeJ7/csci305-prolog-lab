% Johnny Gaddis
% CSCI 305 Prolog Lab

% Parents
mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).

% Spouse
spouse(M, W):- married(M, W); married(W, M).

% Child
child(C, P):- parent(P, C).

% Son and Daughter
son(S, P):- child(S, P), male(S).
daughter(D, P):- child(D, P), female(D).

% Siblings, Brother, and Sister
sibling(S1, S2):- parent(P, S1), parent(P, S2), not(S1=S2).
brother(B, S):- sibling(B, S), male(B).
sister(S, S1):- sibling(S, S1), female(S).

% Uncle and Aunt
uncle(U, N):- parent(P, N), sibling(U, P), male(U); parent(P, N), sibling(P, A), spouse(U, A), male(U).
aunt(A, N):- parent(P, N), sibling(A, P), female(A); parent(P, N), sibling(P, U), spouse(A, U), female(A).

% Grandpeople
grandparent(G, C):- parent(P, C), parent(G, P).
grandfather(G, C):- parent(P, C), father(G, P).
grandmother(G, C):- parent(P, C), mother(G, P).
grandchild(C, G):- grandparent(G, C).

% Ancestory
ancestor(A, H):- parent(A, H); parent(P, H), ancestor(A, P).
descendant(D, A):- ancestor(A, D).

% Age and Regency
older(O, Y):- born(O, OB), died(O, OD), born(Y, YB), died(Y, YD), (YD-YB) < (OD-OB).
younger(Y, O):- older(O, Y).
regentWhenBorn(R, B):- born(B, Y), reigned(R, S, E), Y >= S, E > Y.

% Cousin
cousin(C, P):- uncle(U, P), child(C, U), aunt(A, P), child(C, A).
