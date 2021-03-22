%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - MiEI/3

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Operacoes aritmeticas e conjuntos (listas).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Soma -> {V,F}

soma( X,Y,Soma ) :- Soma is X+Y.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado soma: X,Y,Z,Soma -> {V,F}

soma2( X,Y,Z,Soma2 ) :- Soma2 is X+Y+Z.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior: X,Y,maior -> {V,F}

maior(X,Y,X):- X>Y.
maior(X,Y,Y):- Y>X.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para 3 valores: X,Y,Z,maior -> {V,F}

maior3( X,Y,Z,X ) :- X>Y, X>Z.
maior3( X,Y,Z,Y ) :- Y>X, Y>Z.
maior3( X,Y,Z,Z ) :- Z>X, Z>Y.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado maior para uma lista: [H|T],maior -> {V,F}

maiorL( [X],X ).
maiorL( [H|T],H ) :- maiorL( T,N ), H>N.
maiorL( [H|T],N ) :- maiorL( T,N ), N>H.


% Extensao do predicado menor: X,Y,menor -> {V,F}

menor( X,Y,X ) :- X<Y.
menor( X,Y,Y ) :- Y<X.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menor para 3 valores: X,Y,Z,menor -> {V,F}

menor( X,Y,Z,X ) :- X<Y, X<Z.
menor( X,Y,Z,Y ) :- Y<X, Y<Z.
menor( X,Y,Z,Z ) :- Z<X, Z<Y.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado menor para uma lista: [H|T],menor -> {V,F}

menorL( [X],X ).
menorL( [H|T],H ) :- menorL( T,N ), H<N.
menorL( [H|T],T ) :- menorL( T,N ), N<H.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% aplica uma operação aritmética (adição ou multiplicação) a um conjunto de valores

aritm( [X],_,X ).
aritm( [H|T], '+',R ) :- aritm( T,'+',N ), R is N+H.
aritm( [H|T], '*',R ) :- aritm( T,'*',N ), R is N*H.


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado media para uma lista: [H|T],maior -> {V,F}

comp( [_|T], L ) :- comp( T,N ), L is N+1.

media( L,M ) :- aritm( L,+,S ), comp( L,T ), M is S/T.
media( [X],X ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que ordena de forma crescente uma lista: [H|T],ListaOrdenada -> {V,F}

insereC( X,[],[X] ).
insereC( N,[H|T],[N,H|T] ) :- N=<H.
insereC( X,[H|T],[H,L] ) :- X>H, insereC( X,T,L ).

crescente( [X],[X] ).
crescente( [H|T],S ) :- crescente( T,N ), insereC( H,N,S ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que ordena de forma decrescente uma lista: [H|T],ListaOrdenada -> {V,F}

insereD( X,[],[X] ).
insereD( N,[H|T],[N,H|T] ) :- N>=H.
insereD( X,[H|T],[H,L] ) :- X<H, insereD( X,T,L ).


decrescente( [X],[X] ).
decrescente( [H|T],S ) :- decrescente( T,N ), insereD( H,N,S ).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%Extensao de um predicado que calcule a quantidade de conjuntos vazios existentes num dado conjunto de ocorrências: [H|T],X -> {V,F}

vazios( [_],0 ).
vazios( [H|T],X ) :- comp( H,1 ), vazios( T,N ), X is N+1.
vazios( [_|T],X ) :- vazios( T,X ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que e calcule o valor de verdade contrário à resposta a uma questão: X,Bool -> {V,F}

oposto(X) :- \+X.




