d(1..36).

1={ q(X,Y) : d(Y) }=1 :- d(X).

:- q(X,Y1),q(X,Y2),Y1 < Y2.
:- q(X1,Y),q(X2,Y),X1 < X2.
:- q(X1,Y1),q(X2,Y2),X1 < X2,Y1 < Y2,d(Z1),d(Z2),Z1 = X2 - X1,Z2 = Y2 - Y1,Z1 = Z2.
:- q(X1,Y1),q(X2,Y2),X1 < X2,Y2 < Y1,d(Z1),d(Z2),Z1 = X2 - X1,Z2 = Y1 - Y2,Z1 = Z2.

#show q/2.
