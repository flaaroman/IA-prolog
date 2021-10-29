applicabile(ovest,pos(R,C)):- C>1, ColonnaSinistra is C-1, occupata(pos(R,ColonnaSinistra),0).
applicabile(nord,pos(R,C)):- R>1, RigaSopra is R-1, occupata(pos(RigaSopra,C),0).
applicabile(est,pos(R,C)):- C<4, ColonnaDestra is C+1, occupata(pos(R,ColonnaDestra),0).
applicabile(sud,pos(R,C)):- R<4, RigaSotto is R+1, occupata(pos(RigaSotto,C),0).

trasforma(ovest,pos(R,C),pos(R,ColonnaASinistra)):- ColonnaASinistra is C-1.
trasforma(nord,pos(R,C),pos(NuovaRigaSopra,C)):- NuovaRigaSopra is R-1.
trasforma(est,pos(R,C),pos(R,ColonnaADestra)):- ColonnaADestra is C+1.
trasforma(sud,pos(R,C),pos(NuovaRigaSotto,C)):- NuovaRigaSotto is R+1.

checkRiga:-
    occupata(pos(1,1),1),
    occupata(pos(1,2),2),
    occupata(pos(1,3),3),
    occupata(pos(1,4),4).
