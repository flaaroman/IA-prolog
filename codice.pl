:- ['dominio.pl','regole.pl'].
depth_limitata(Soluzione,Limite):-
    init,
    occupata(pos(X,Y),0),
    Y<2,
    Destra is Y+1,
    ricerca_depth_limitata(pos(X,Destra),Limite,Soluzione).

depth_limitata(Soluzione,Limite):-
    init,
    occupata(pos(X,Y),0),
    X>1,
    Sopra is X-1,
    ricerca_depth_limitata(pos(Sopra,Y),Limite,Soluzione).

depth_limitata(Soluzione,Limite):-
    init,
    occupata(pos(X,Y),0),
    X=1,
    Sotto is X+1,
    ricerca_depth_limitata(pos(Sotto,Y),Limite,Soluzione).
    
depth_limitata(Soluzione,Limite):-
    init,
    occupata(pos(X,Y),0),
    Y>1,
    Sinistra is Y-1,
    ricerca_depth_limitata(pos(X,Sinistra),Limite,Soluzione).

ricerca_depth_limitata(_,_,[]):-finale,!.

ricerca_depth_limitata(S, Limite, [Az|SequenzaAzioni]):-
    Limite>0,
    applicabile(Az,S),
    trasforma(Az,S,NuovoStato),

    occupata(S,ValorePrec),

    occupata(X,_),
    \+X=S,
    \+X=NuovoStato,

    retractall(occupata(_,0)),
    retractall(occupata(S,_)),
    assert(occupata(S,0)),
    assert(occupata(NuovoStato,ValorePrec)),

    NuovoLimite is Limite-1,
    write('Posizione: '), writeln(S), 
    write('Azione: '), writeln(Az),
    ricerca_depth_limitata(X, NuovoLimite, SequenzaAzioni).

