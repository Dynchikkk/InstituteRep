parent(fedor, peter).
parent(fedor, sam).
parent(elena, peter).
parent(elena, sam).

parent(anna, andrey).
parent(anna, amma).
parent(peter, andrey).
parent(peter, amma).

parent(amma, marry).
parent(tom, marry).

parent(jill, lili).
parent(andrey, lili).

parent(dan, mark).
parent(dan, ash).
parent(dan, bob).
parent(vera, mark).
parent(vera, ash).
parent(vera, bob).

parent(mark, anton).
parent(lili, anton).

parent(ash, joll).
parent(len, joll).

parent(bob, mim).
parent(bob, mom).
parent(baba, mim).
parent(baba, mom).

woman(elena).
woman(anna).
woman(jill).
woman(amma).
woman(vera).
woman(ash).
woman(lili).
woman(marry).
woman(baba).
woman(joll).
woman(mim).

man(fedor).
man(peter).
man(andrey).
man(mark).
man(dan).
man(bob).
man(anton).
man(sam).
man(tom).
man(mom).
man(len).

married_couple(fedor, elena).
married_couple(peter, anna).
married_couple(andrey, jill).
married_couple(dan, vera).
married_couple(mark, lili).
married_couple(tom, amma).
married_couple(bob, baba).
married_couple(len, ash).

brother_sister(X, A2):- 
	A2 = X;
	parent(A1, X), 
	woman(A1), 
	married_couple(A3, A1), 
	parent(A3, A2), 
	A2 \= X.

% 1
check_sister(X, A2):- 
	brother_sister(X, A2),
	woman(A2),
	A2 \= X.

% 2
check_grand_doughter(X, A3):- 
	parent(X,A1), 
	parent(A1,A2), 
	parent(A2, A3), 
	woman(A3). 

% 3
check_2x_tetya(X, A5):- 
	parent(A1, X), 
	parent(A2, A1), 
	parent(A3, A2), 
	parent(A3, A4), 
	A4 \= A2, 
	parent(A4, A5), 
	woman(A5).

% 4
n_plem(X, A5):- 
	parent(A1, X), 
	brother_sister(A1, A2), 
	parent(A2, A3), 
	A3 \= X,
	parent(A3, A5), 
	woman(A5).
	
% 5
brother_of_husband(X, A2):-
	woman(X),
	married_couple(A1, X),
	brother_sister(A1, A2),
	A2 \= A1,
	man(A2).
