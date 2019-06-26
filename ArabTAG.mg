%Cherifa Ben Khelil : cherifa.bk@gmail.com
use color with () dims (syn)
use rank  with () dims (syn)
use requires with ( fg=objet2, fg=objet1 ) dims (syn)
use precedes with ( fg=objet1, fg=objet2 ) dims (syn)

%%=============================================================================
%% les types utilisés dans cette méta-grammaire.
%%=============================================================================
type CAT    = { v, sv, sn, sp, p, adj, advg, advd, adv, inter, pinter, pn, circ, subor, subor_p, pactif, ppassif, comp, qual, nverbal,  proc_v, cc, v_e, v_c, enc, proc, proc_def, proc_c, mushtaq, exc, app}
type SUBCAT = { dem, pron, sn_sub, sn_subp,sn_ann, nom_prop, sn_sem_pac, sn_sem_ppas, sn_sem_comp, sn_sem_qual, sn_sem_nv, sn_adj, sn_def, sn_com, sn_dem}
type COLOR  = { red, black, white } 
type MARK   = { lex, subst, nadj, foot, anchor, coanchor, none }
type FG     = { sujet, objet1, objet2, sujet_adj }
type FGTYPE = { direct, indirect, pnv, non, interrogative, exclamative, appel }
type CAS    = { nom, acc, gen }
type NAME   = { PREP1, PREP2 }
type GENDER = { m, f }
type APREP  = { p_e, p_a }
type PHON   = { e }
type SUJ    = { s_0, s_1 }
type OCLIT  = { o_0, o_1, o_2 }
type PCLIT  = { p_0, p_1 }
type PINT   = { i_e, i_a }
type NUMBER = { sg, dl, plr }
type VOIX   = { act, pas }
type MODE   = { ind, sub, apoc, imp }
type ASPECT = { acco, inacco }
type HUMAIN = { h_0, h_1, h_2 }
type ANIME  = { a_0, a_1, a_2 }
type OBJET  = { objet_direct, objet_clitique, objet_indirect }
type LABEL !
type IDX !
%%=============================================================================
%% les propriétés utilisées dans cette méta-grammaire.
%%=============================================================================

property color : COLOR 
property mark  : MARK
property cas   : CAS
property name  : NAME
property rank  : RANK
 
%%=============================================================================
%% les traits utilisés dans cette méta-grammaire.
%%=============================================================================

feature cat    : CAT
feature subcat : SUBCAT
feature fg     : FG
feature fgo    : FG
feature fgtype : FGTYPE
feature gen    : GENDER
feature genA   : GENDER
feature p      : APREP
feature def    : bool
feature hasv   : bool
feature phon   : PHON
feature suj    : SUJ
feature oclit  : OCLIT
feature pclit  : PCLIT
feature pint   : PINT
feature num    : NUMBER
feature numA   : NUMBER
feature voix   : VOIX
feature mode   : MODE
feature aspect : ASPECT
feature npro   : bool
feature dis    : bool
feature hum    : HUMAIN
feature anime  : ANIME
feature top    : LABEL
feature bot    : LABEL

%%=============================================================================
%% les traits utilisés pour l'interface sémantique dans cette méta-grammaire.
%%=============================================================================

feature e      : IDX
feature f      : IDX
feature i      : IDX
feature Lem    : IDX
feature arg0   : IDX
feature arg1   : IDX
feature arg2   : IDX
feature arg3   : IDX
feature arg    : IDX

%%=============================================================================
%% les fichiers de la méta-grammaire.
%%
%%=============================================================================

include SynArabTAG.mg
%include SemArabTAG.mg

%%=============================================================================
%% les familles d'arbres (syntaxiques) à générer.
%%=============================================================================
value DiTransitifActif
value TransitifActif
value IntransitifActif
value DiTransitifPassif
value TransitifPassif
value PhraseNominaleVE
value PhraseNominaleVC
value PhraseNominale
value Exclamative
value Appel
value Interrogative
value Adverbe
value SyntagmeAdj
value SyntagmePrep
value SyntagmeConj
value SyntagmeSub
value SyntagmeAnnex
value SyntagmeSemiProp
value SyntagmeMode
value SyntagmeCorro
value SyntagmeAppro
value ComplementCirc
value NomDem
value Pronom
value NomPropre
value NomCommun
value Adjectif
value Particule
value ProcEnc
