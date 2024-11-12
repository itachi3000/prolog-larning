% This program depicts family relationships...
/*domains
  name=symbol
predicates
  parent(name,name)
  female(name)
  male(name)
  mother(name)
  father(name)
  haschild(name)
  sister(name)
  brother(name)
  clauses
  */
% Facts about females
female(pam).
female(liz).
female(pat).
female(ann).

% Facts about males
male(jim).
male(bob).
male(tom).
male(peter).

% Facts about parent-child relationships
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).
parent(bob, peter).
parent(peter, jim).

% Rule for mother: X is the mother of Y if X is female and X is a parent of Y
mother(X, Y) :- parent(X, Y), female(X).

% Rule for father: X is the father of Y if X is male and X is a parent of Y
father(X, Y) :- parent(X, Y), male(X).

% Rule for haschild: X has a child if X is a parent of someone
has_child(X) :- parent(X, _).

% Rule for sister: X is a sister of Y if they share at least one parent, X is female, and X is not the same as Y
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \== Y.

% Rule for brother: X is a brother of Y if they share at least one parent, X is male, and X is not the same as Y
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \== Y.
