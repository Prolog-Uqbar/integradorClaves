:-discontiguous clave/4.

digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).

vocal(a).
vocal(e).
vocal(i).
vocal(o).
vocal(u).

usuario(tita).
usuario(toto).
usuario(tato).
usuario(joaco).
usuario(guillermo).
usuario(julian).
usuario(rodrigo).
usuario(andrejs).
usuario(eze).
usuario(emmanuel).
usuario(rodo).
usuario(walter).
usuario(lucas).
usuario(dami).
usuario(fede).
usuario(gonzalo).
usuario(imposible).

% 1)

claveBase(Letra, Digito1, Digito2):-
    vocal(Letra),
    digito(Digito1),
    digito(Digito2),
    Digito1 \= Digito2,
    not(consecutivos(Digito1, Digito2)).

consecutivos(Num1,Num2):- Num1 is Num2 + 1. 
consecutivos(Num1,Num2):- Num1 is Num2 - 1. 

% 2)


clave(tita, Letra, Digito1, Digito2):-
    claveBase(Letra, Digito1, Digito2),
    entre0y2(Digito1, Digito2).    
    
clave(toto, o, Digito, 0):- claveBase(o, Digito, 0).
clave(toto, o, 0, Digito):- claveBase(o, 0, Digito).

clave(tato, Vocal, Digito1, Digito2):-
    vocalDe(tato,Vocal),
    claveBase(Vocal,Digito1, Digito2),
    entre0y2(Digito1,Digito2).    
    
    
    % Usuarios inventados
    
%Rodo: la suma de los dos digitos es 16 y el primero mayor qu el segundo, y que la vocal sea a
clave(rodo, a, Digito1, Digito2):-
    claveBase(a, Digito1, Digito2),
    Digito1 > Digito2,
    16 is Digito1 + Digito2.
    
%Joaco: Usa al menos una vez el dígito 7 y la suma de ambos dígitos da 14.
clave(joaco, Vocal, Num1, Num2):-
    claveBase(Vocal, Num1, Num2),
    14 is Num1 + Num2,
    algunoEs(7,Num1,Num2).

%Eze: Uno de los digitos es el 7
clave(eze, Vocal, Num1, Num2):-
    claveBase(Vocal, Num1, Num2),
    algunoEs(7,Num1,Num2).
    
% Emmanuel: la vocal es la e y el ultimo digito es un 8
clave(emmanuel,e, El2, 8):-
    claveBase(e, El2, 8).


% Walter: tiene que ser u 7 3
clave(walter, u, 7, 3):-
    claveBase(u, 7, 3). 

% Lucas:  que los digitos sean pares)
clave(lucas, PrimerElemento, SegundoElemento, TercerElemento):-
    claveBase(PrimerElemento, SegundoElemento, TercerElemento),
    sonNumerosPares(SegundoElemento, TercerElemento).

% Dami: elige la letra a, su primer digito puede ser 5 y el segundo mayor a 5, o su segundo digito puede ser 6 y el primero menor a 6.
clave(dami, a, 5, Digito2):-
    claveBase(a, 5, Digito2),
    Digito2 > 5.
clave(dami, a, Digito1, 6):-
    claveBase(a, Digito1, 6),
    Digito1 < 6.

%Fede: Los dos digitos estan En el DNI Y No Son Del Mes De Cumpleaños

clave(fede, Vocal, PrimerDigito, SegundoDigito) :-
    claveBase(Vocal, PrimerDigito, SegundoDigito),
    estanEnDNIYNoSonDelMesDeCumpleanios(PrimerDigito, fede),
    estanEnDNIYNoSonDelMesDeCumpleanios(SegundoDigito, fede).

estanEnDNIYNoSonDelMesDeCumpleanios(UnNumero, Usuario) :-
    estaEnDNI(UnNumero, Usuario),
    not(estaEnMesDeCumpleanios(UnNumero, Usuario)).

estaEnMesDeCumpleanios(1, fede).
estaEnMesDeCumpleanios(0, fede).

estaEnDNI(3, fede).
estaEnDNI(8, fede).
estaEnDNI(0, fede).
estaEnDNI(5, fede).
estaEnDNI(9, fede).
estaEnDNI(7, fede).

% Eze: empieza con e, el segundo elemento esta entre 1 y 3 y el tercero entre 5 y 7, inclusive.

clave(eze,e,Digito1,Digito2):-
    between(1,3,Digito1),
    between(5,7,Digito2),
    claveBase(e,Digito1,Digito2).


% Rodrigo: De los dígitos, el primero es par y el segundo es impar.
clave(rodrigo,Vocal,Digito1,Digito2):-
    claveBase(Vocal,Digito1,Digito2),
    esPar(Digito1),
    esImpar(Digito2).

esImpar(Digito):- not(esPar(Digito)).

% Gonzalo: 

clave(gonzalo, Vocal, Digito1, Digito2):-
    claveBase(Vocal, Digito1, Digito2),
    vocalDe(gonzalo,Vocal),
    doble(Digito1,Digito2).
    
doble(Digito1,Digito2):- Digito2 is Digito1 * 2.
doble(Digito1,Digito2):- Digito1 is Digito2 * 2.
    
vocalDe(gonzalo, e).
vocalDe(gonzalo, i). 
vocalDe(gonzalo, u).

vocalDe(tato,a).
vocalDe(tato,o).



%Andrejs: la suma de los 2 digitos debe ser un numero primo.

clave(andrejs, Vocal, DigitoUno, DigitoDos):-
    claveBase(Vocal, DigitoUno, DigitoDos),
    X is DigitoUno + DigitoDos,
    nroPrimo(X).

% Imposible: DigitoUno + DigitoDos == DigitoUno * DigitoDos
clave(imposible, Vocal, DigitoUno, DigitoDos):-
    claveBase(Vocal, DigitoUno, DigitoDos),
    Resultado is DigitoUno * DigitoDos,
    Resultado is DigitoUno + DigitoDos.

% Julian: Un digito mayor a 5 y otro menor que 5, que sumen 20
clave(julian,Elem1,Elem2,Elem3):-
    claveBase(Elem1,Elem2,Elem3),
    Elem2 > 5,
    Elem3 < 5,
    20 is Elem2 + Elem3.

%% Guillermo: no quiere confundir letras con numeros asi que
%%		- si usa a no quiere usar 4 (A).
%%		- si usa e no quiere usar 3 (E).
%%		- si usa i no quiere usar 1.
%%		- si usa o no quiere usar 0.
%%	    - si usa u por alguna razon quiere que cada digito sea primo.
%%
clave(guillermo, Vocal, Digito1, Digito2):-
	claveBase(Vocal, Digito1, Digito2),
    not(infringeConsideraciones(Vocal, Digito1, Digito2)).

infringeConsideraciones(Vocal, Digito1, Digito2):-
    similitud(Vocal,Nro),
    algunoEs(Nro, Digito1, Digito2).

similitud(a,4).
similitud(e,3).
similitud(i,1).
similitud(o,0).
similitud(u, Primo):-nroPrimo(Primo).

nroPrimo(2).
nroPrimo(3).
nroPrimo(5).
nroPrimo(7).
nroPrimo(11).
nroPrimo(13).
nroPrimo(17).



% Auxiliares

sonNumerosPares(PrimerDigito, SegundoDigito):-
    esPar(PrimerDigito),esPar(SegundoDigito).

esPar(Nro) :- 0 is Nro mod 2.

algunoEs(Valor,_,Valor).
algunoEs(Valor,Valor,_).
  

entre0y2(Digito1, Digito2):-
    Digito1 =< 2,
    Digito2 =< 2.

% 3)

% punto 3.A 

usuarioClaveUnica(Usuario):-
    clave(Usuario,Letra, Digito1, Digito2),
    not(claveDiferenteDe(Usuario, Letra, Digito1, Digito2)).

claveDiferenteDe(Usuario, Letra, Digito1, Digito2):-
    clave(Usuario, OtraLetra, OtroDigito1, OtroDigito2),
    algoDiferente( Letra, Digito1, Digito2,OtraLetra, OtroDigito1, OtroDigito2).

algoDiferente(Letra  , _, _, OtraLetra  , _, _):-Letra   \= OtraLetra.
algoDiferente(_, Digito1, _, _, OtroDigito1, _):-Digito1 \= OtroDigito1.
algoDiferente(_, _, Digito2, _, _, OtroDigito2):-Digito2 \= OtroDigito2.

%% Variante
usuarioClaveUnica2(Usuario):-
    clave(Usuario,_, _, _),
    not(masDeUnaClave(Usuario)).

masDeUnaClave(Usuario):-
    clave(Usuario, Letra, Digito1, Digito2),
    clave(Usuario, OtraLetra, OtroDigito1, OtroDigito2),
    algoDiferente( Letra, Digito1, Digito2,OtraLetra, OtroDigito1, OtroDigito2).


%% Otra variante

usuarioClaveUnica3(Usuario):-
    clave(Usuario, Vocal, DigitoUno, DigitoDos),
    forall(clave(Usuario, V, D1, D2), (Vocal == V, DigitoUno == D1, DigitoDos == D2)).

%punto 3B.

usuarioClaveImposible(Usuario):-
    usuario(Usuario),
    not(clave(Usuario,_,_,_)).

%punto 3C.

digitoQueAcota(Digito):-
    digito(Digito),
    usuario(Usuario),
    not(clave(Usuario, _, _, Digito)).

%% Variente inversa
digitoQueNoAcota(Digito):-
    digito(Digito),
    forall(usuario(Usuario),clave(Usuario, _, _, Digito)).
