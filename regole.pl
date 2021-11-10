applicabile(ovest,pos(R,C)):- C>1, ColonnaSinistra is C-1, occupata(pos(R,ColonnaSinistra),0).
applicabile(nord,pos(R,C)):- R>1, RigaSopra is R-1, occupata(pos(RigaSopra,C),0).
applicabile(est,pos(R,C)):- C<4, ColonnaDestra is C+1, occupata(pos(R,ColonnaDestra),0).
applicabile(sud,pos(R,C)):- R<4, RigaSotto is R+1, occupata(pos(RigaSotto,C),0).

trasforma(ovest,pos(R,C),pos(R,ColonnaASinistra)):- ColonnaASinistra is C-1.
trasforma(nord,pos(R,C),pos(NuovaRigaSopra,C)):- NuovaRigaSopra is R-1.
trasforma(est,pos(R,C),pos(R,ColonnaADestra)):- ColonnaADestra is C+1.
trasforma(sud,pos(R,C),pos(NuovaRigaSotto,C)):- NuovaRigaSotto is R+1.

posCorretta(pos(X,Y),Valore):-X = 1,Y = 1,Valore = 1.
posCorretta(pos(X,Y),Valore):-X = 1,Y = 2,Valore = 2.
posCorretta(pos(X,Y),Valore):-X = 1,Y = 3,Valore = 3.
posCorretta(pos(X,Y),Valore):-X = 1,Y = 4,Valore = 4.
posCorretta(pos(X,Y),Valore):-X = 2,Y = 1,Valore = 5.
posCorretta(pos(X,Y),Valore):-X = 2,Y = 2,Valore = 6.
posCorretta(pos(X,Y),Valore):-X = 2,Y = 3,Valore = 7.
posCorretta(pos(X,Y),Valore):-X = 2,Y = 4,Valore = 8.
posCorretta(pos(X,Y),Valore):-X = 3,Y = 1,Valore = 9.
posCorretta(pos(X,Y),Valore):-X = 3,Y = 2,Valore = 10.
posCorretta(pos(X,Y),Valore):-X = 3,Y = 3,Valore = 11.
posCorretta(pos(X,Y),Valore):-X = 3,Y = 4,Valore = 12.
posCorretta(pos(X,Y),Valore):-X = 4,Y = 1,Valore = 13.
posCorretta(pos(X,Y),Valore):-X = 4,Y = 2,Valore = 14.
posCorretta(pos(X,Y),Valore):-X = 4,Y = 3,Valore = 15.
posCorretta(pos(X,Y),Valore):-X = 4,Y = 4,Valore = 0.
