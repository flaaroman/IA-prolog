:- ['dominio.pl', 'regole.pl'].

prova15(Soluzione, Limite) :-
    depth_limitata(Soluzione, Limite).

depth_limitata(Soluzione, Limite) :-
    init,
    occupata(pos(X, Y), 0),
    Y>3, !,
    Sinistra is Y-1,
    writeln(sinistra),
    ricerca_depth_limitata(pos(X, Sinistra), Limite, Soluzione).

depth_limitata(Soluzione, Limite) :-
    init,
    occupata(pos(X, Y), 0),
    Y<4, !,
    Destra is Y+1,
    writeln(destra),
    ricerca_depth_limitata(pos(X, Destra), Limite, Soluzione).

/*depth_limitata(Soluzione, Limite) :-
    init,
    occupata(pos(X, Y), 0),
    X>1,
    Sopra is X-1,
    writeln(sopra),
    ricerca_depth_limitata(pos(Sopra, Y), Limite, Soluzione).

depth_limitata(Soluzione, Limite) :-
    init,
    occupata(pos(X, Y), 0),
    X=1,
    Sotto is X+1,s
    writeln(sotto),
    ricerca_depth_limitata(pos(Sotto, Y), Limite, Soluzione).*/
ricerca_depth_limitata(_, _, []) :-
    finale, !.

ricerca_depth_limitata(S, Limite, [Az|SequenzaAzioni]) :-
    /*write('Sto in '),
    writeln(S),*/
    Limite>0,
    applicabile(Az, S), !,
    trasforma(Az, S, NuovoStato), !,
    occupata(S, ValorePrec),
    occupata(C, 0),
    retract(occupata(C, 0)),
    retract(occupata(S, ValorePrec)),
    assert(occupata(S, 0)),
    assert(occupata(NuovoStato, ValorePrec)),
    /*write('Spostamento 0 da '),
    write(C),
    write(' in '),
    writeln(S),
    write('Spostamento '),
    write(ValorePrec),
    write(' da '),
    write(S),
    write(' in '),
    writeln(NuovoStato),
    write('Azione appicata: '),
    writeln(Az),*/
    scegli_prox_cella(S, NuovoStato, ProxCella),
    NuovoLimite is Limite-1,
    ricerca_depth_limitata(ProxCella, NuovoLimite, SequenzaAzioni).

scegli_prox_cella(S, N, X) :-
    occupata(X, ValoreProxCella),
    \+ X=S,
    \+ X=N,
    \+ ValoreProxCella=0,
    %write('Prox cella '),
    %writeln(X).
    \+ posCorretta(X, ValoreProxCella).

scegli_prox_cella(S, N, X) :-
    occupata(X, ValoreProxCella),
    \+ X=S,
    \+ X=N,
    \+ ValoreProxCella=0,
    %write('Prox cella '),
    %writeln(X).
    posCorretta(X, ValoreProxCella), !.