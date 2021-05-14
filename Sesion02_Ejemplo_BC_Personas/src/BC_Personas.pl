mujer(ana).
mujer(maria).
mujer(luisa).
mujer(fabiola).
mujer(esther).
mujer(rocio).
mujer(diana).
mujer(vanessa).
mujer(martha).
mujer(olivia).

hombre(hugo).
:- discontiguous hombre/1. 
adulto(hugo).
hombre(paco).
hombre(luis).
hombre(mario).
hombre(marco).
hombre(juan).
:- discontiguous hombre/1. 
ninio(juan).
hombre(pedro).
hombre(raul).
hombre(gabriel).
hombre(sergio).

madre(ana, sergio).
madre(ana, maria).
madre(ana, luis).
madre(martha, diana).
madre(olivia, raul).

padre(raul, rocio).
padre(raul, ana).
padre(marco, hugo).
padre(pedro, gabriel).
padre(sergio, paco).
padre(hugo, sergio).

%listado de PADRES y MADRES de familia con sus hijos
padres_familia(X, Y) :- padre(X, Y) ; madre(X, Y).

%listado de PADRES y MADRES de familia
padres(X) :- padre(X, _) ; madre(X, _).

%PAPAS
papa(X) :- padre(X, _). 

%MAMAS
mama(X) :- madre(X, _).

%HIJOS
hijo(Y) :- (padre(_, Y) ; madre(_, Y)) , hombre(Y). 

%HIJAS
hija(Y) :- (padre(_, Y) ; madre(_, Y)) , mujer(Y).








%ABUELOS
abuelo(Z, Y) :- padre(Z, X) , (padre(X, Y) ; madre(X, Y)), hombre(Z).
% abuelo(marco, sergio).

%ABUELAS
abuela(Z, Y) :- madre(Z, X) , (padre(X, Y) ; madre(X, Y)), mujer(Z).
% abuela(ana, paco).

%PERSONAS
persona(X) :- (hombre(X) ; mujer(X)).
% persona(ana).        persona(paco).

%NIETOS
nieto(Z, Y) :- (padre(X, Z) ; madre(X, Z)) , (padre(Y, X) ; madre(Y, X)) , hombre(Z).
% nieto(paco, ana).

%NIETAS
nieta(Z, Y) :- (padre(X, Z) ; madre(X, Z)) , (padre(Y, X) ; madre(Y, X)) , mujer(Z).
% nieta(rocio, olivia).

%HERMANOS
hermano(X, Y) :- hombre(X) , hombre(Y) , (padre(Z, X) ; madre(Z, X)) , (padre(Z, Y) ; madre(Z, Y)).
% hermano(sergio, luis).

%HERMANAS
hermana(X, Y) :- mujer(X) , mujer(Y) , (padre(Z, X) ; madre(Z, X)) , (padre(Z, Y) ; madre(Z, Y)).
% hermana(ana, rocio).

%HERMANAS
hermanos(X, Y) :- (padre(Z, X) ; madre(Z, X)) , (padre(Z, Y) ; madre(Z, Y)).
% hermanos(sergio, maria).

%ESPOSOS
esposo(Z, Y) :- padre(Z, X) , madre(Y, X).
% esposo(hugo, ana).

%ESPOSAS
esposa(Z, Y) :- madre(Z, X) , padre(Y, X).
% esposa(ana, hugo).
