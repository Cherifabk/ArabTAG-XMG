%Cherifa Ben Khelil : cherifa.bk@gmail.com

%%=============================================================================
%% les principes utilisés dans cette méta-grammaire.
%%
%% nous utilisons des descriptions d'arbres colorées, ce qui permet de guider
%% la manière dont les différentes contributions peuvent se combiner pour
%% générer des familles d'arbres.
%%=============================================================================


%%=============================================================================
%% NomCommun contribue un syntagme nominal ancré
%%=============================================================================

class NomCommun
declare ?Gen ?Num ?Cas ?Npro ?Hum ?Anime ?F
{
  <syn>
  {

%---Livre / كتابٌ
    node (mark=anchor, color=red) [cat=sn, i=?F, bot=[subcat=sn_com], def=0]
    |

%---Le livre / ال كتابُ
    node  (color=red) [cat=sn, bot=[i=?F, subcat=sn_def, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=1, npro=0]]{
      node (color=red, mark=subst  ) [cat=proc_def]
      node (color=red, mark=anchor ) [cat=sn, bot=[i=?F], subcat=sn_com, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=0, npro=0]}

  };
  <iface>{
    [f=?F] 
  }
}

%%=============================================================================
%% NomPropre contribue un syntagme nominal ancré
%%=============================================================================

class NomPropre
declare ?F ?Hum ?Anime ?L
{
  <syn>
  {
%---Ali / عليٌ 
    node (color=red, mark=anchor) [cat=sn, bot=[i=?F, subcat=nom_prop, npro=1, hum=?Hum, anime=?Anime]]

  };
  <iface>{
    [f=?F]
  }
}

%%=============================================================================
%% NomDem 
%%=============================================================================

class NomDem
declare ?Gen ?Num ?Hum ?Anime ?Cas ?Npro ?Def ?F
{
  <syn>
  {

%---C'est le livre / هذا ال كتابُ 
    {((?Hum=h_1) | (?Hum=h_0 ; ?Num=sg) | (?Hum=h_0 ; ?Num=dl));
    (
    node (color=red) [cat=sn, bot=[i=?F, subcat=sn_dem, cas=?Cas, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime, def=?Def, npro=?Npro]]{
      node (color=red, mark=anchor) [cat=sn, subcat=dem, gen=?Gen, num=?Num]
      node (color=red, mark=foot ) [cat=sn, top=[i=?F, subcat=@{sn_ann, sn_def, sn_com, nom_prop, pron}, cas=?Cas, gen=?Gen, def=?Def, num=?Num, hum=?Hum, anime=?Anime, npro=?Npro]]}
    |

    node (color=red) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime, def=?Def, npro=?Npro]{
      node (color=red, mark=foot ) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, gen=?Gen, def=?Def, num=?Num, hum=?Hum, anime=?Anime, npro=?Npro]
      node (color=red, mark=anchor) [cat=sn, subcat=dem, gen=?Gen, num=?Num]}
    )}
    |
    {(?Hum=h_0 ; ?Num=plr);
    (node (color=red) [cat=sn, bot=[i=?F, subcat=sn_dem, cas=?Cas, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime, def=?Def, npro=?Npro]]{
      node (color=red, mark=anchor) [cat=sn, subcat=dem, gen=?Gen, num=sg]
      node (color=red, mark=foot ) [cat=sn, top=[i=?F, subcat=@{sn_ann, sn_def, sn_com, nom_prop, pron}, cas=?Cas, gen=?Gen, def=?Def, num=?Num, hum=?Hum, anime=?Anime, npro=?Npro]]}
    |

    node (color=red) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime, def=?Def, npro=?Npro]{
      node (color=red, mark=foot ) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, gen=?Gen, def=?Def, num=?Num, hum=?Hum, anime=?Anime, npro=?Npro]
      node (color=red, mark=anchor) [cat=sn, subcat=dem, gen=?Gen, num=sg]}
    )}
  };
  <iface>{
    [f=?F]
  }
}

%%=============================================================================
%% Pronom 
%%=============================================================================

class Pronom
declare ?Gen ?Num ?Hum ?Anime ?F ?X0
{
  (<syn>
  {
%---Lui / هُوَ
    node (color=red, mark=anchor) [cat=sn, i=?F, subcat=pron, gen=?Gen, num=?Num]})
   |
 (<syn>
  {
%---Il est le coupable /  هوَ الجانِي
    node  (color=red) [cat=sn, i=?F, cas= nom, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]{
      node (color=red, mark=anchor ) [cat=sn, subcat=pron, gen=?Gen, num=?Num]
      node (color=red, mark=foot  ) [cat=sn, i=?F, subcat= @{ sn_ann, sn_sem_pac, sn_sem_ppas, sn_sem_comp, sn_sem_qual, sn_sem_nv, sn_adj, sn_def, sn_com}, cas= nom, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]}	
%    |

%---lui qui dort / هو اَلّذي ينامُ
%    node  (color=red) [cat=sn, i=?X0]{
%      node (color=red, mark=anchor ) [cat=sn, i=?X0, subcat=pron, gen=?Gen, num=?Num]
%      node (color=red, mark=foot  ) [cat=sn, i=?X1, subcat= @{sn_sub,sn_subp}, gen=?Gen, num=?Num]}	
  
  };
  <iface>{
    [f=?F]
  })
}


%%=============================================================================
%% un adverbe peut s'adjoindre avant un noeud cat=advg ou après un noeud
%% cat=advd
%%=============================================================================

class AdverbePre
export ?AD ?EV
declare ?AD ?EV
{
  <syn>
  {
    node (color=red) [cat=advg, e=?EV] {
      node ? AD 
      node (color=red, mark=foot  ) [cat=advg]}};
    <iface>{[e=?EV]}
}

class AdverbePost
export ?AD ?EV
declare ?AD ?EV
{
  <syn>
  {
    node (color=red) [cat=advd, e=?EV] {
      node (color=red, mark=foot  ) [cat=advd]
      node ? AD }};
    <iface>{[e=?EV]}
}

class Adverbe
declare ?ADC ?AD ?EV ?SM ?Gen ?Num ?Cas
{
  (?ADC=AdverbePost[]; 
   ?ADC.?AD= AD; 
   ?ADC.?EV= EV;
   Adjectif[];
  <syn>
  {
    node ?AD (color=white) [cat=adj, gen=?Gen, num=?Num, cas=?Cas]}
  )

  |
  (?ADC=AdverbePre[] | ?ADC=AdverbePost[]) ; 
   ?ADC.?AD= AD; 
   ?ADC.?EV= EV;
  (

%---Beaucoup dort Ali /كثيرًا ينامُ عليٌ 
%---Dort Ali beaucoup / ينامُ عليٌ كثيرًا
  <syn>
  {
    node ?AD (color=red, mark=anchor) [cat=adv] }
  |

%---Devant la maison il attend /أمام ال منزلِ ينتظرُ
%---Il attend devant la maison / ينتظرُ أمام ال منزل  
%---Il est rentré à la maison quand le soir est venu / عادَ إلى المنزلِ لمّا حلَّ المساءُ 
%---Quand le soir est venu, il est rentré à la maison / لمّا حلَّ المساءُ عادَ إلى المنزلِ 
%---J'ai couru devant lui / ركضتُ أمامهُ 
%---Devant lui j'ai couru /أمامهُ ركضتُ
%---Je commencerai la révision demain / سوفَ أبدأُ بِالمراجعةِ غدًا
%---Demain je commencerai la révision /غدًا سوفَ أبدأُ بِالمراجعةِ  
  {ComplementCirc[];
  <syn>
  {
    node ?AD (color=white) [cat=cc]}}
  |

%---A la maison dort Ali /في ال منزلِ ينامُ عليٌ
%---Dort Ali à la maison / ينامُ عليٌ في ال منزلِ
%---Avec lui le groupe est complété /بِهِ إكتملتْ المجموعةُ  
%---Le groupe est complété avec lui/ إكتملتْ المجموعةُ بِهِ  
  {SyntagmePrep[];
  <syn>
  {
    node ?AD (color=white) [cat=sp]}}
  |

%---En lisant un livre le garçon est entré / و هوَ يقراءُ كتابًا دخلَ الولدُ
%---Le garçon est entré en lisant un livre / دخلَ الولدُ و هوَ يقراءُ كتابًا
%---En étant ravi le garçon est entré /و هو مسرورٌ دخلَ الولدُ	
%---Le garçon est entré en étant ravi / دخلَ الولدُ و هو مسرورٌ 	 
%---Heureux le garçon est rentré / فرحًا عادَ الولدُ  	
%---Le garçon est rentré heureux/ عادَ الولدُ فرحًا 
%---Le garçon est rentré heureux ravi / عادَ الولدُ فرحًا مسرورًا 
%---Heureux ravi le garçon est rentré  / فرحًا مسرورًا عادَ الولدُ   		 		
  {?SM=SyntagmeMode[];
   ?Gen=?SM.?Gen;
   ?Num=?SM.Num;
  <syn>
  {
    node ?AD (color=white) [cat=adv, gen=?Gen, num=?Num]
    |
    node ?AD (color=white) [cat=mushtaq, gen=?Gen, num=?Num]}}
  |

%---En montant sa bicyclette le garçon est rentré / راكبًا درّجتهُ عادَ الولدُ 	
%---le garçon est rentré en montant sa bicyclette / عادَ الولدُ راكبًا درّجتهُ 	
  {(SyntagmeSP[pactif,sn_sem_pac] | SyntagmeSP[qual,sn_sem_qual]);
  <syn>
  {
    node ?AD (color=white) [cat=sn]}}
  )
}

%%=============================================================================
%% le Syntagme Prépositionnel
%%=============================================================================

class SyntagmePrep
declare ?Gen ?Cas ?Num ?F ?EV ?X0
{
  <syn>
  {
%---A fatima/ إلى فاطمةٍ
    node  (color=black) [cat=sp, i=?F]{
	node (mark=anchor, color=red) [cat=p, i=?F]
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas= gen]}
    |
	
%---A elle/ إلىهَا
    node  (color=black) [cat=sp, i=?F, oclit=o_1]{
	node (mark=anchor, color=red) [cat=p, i=?F]
	node (mark=subst, color=red ) [cat=enc, i=?X0]}
    |
	
%---Pour dormir / لِينامَ
    node  (color=black) [cat=sp, i=?F]{
	node (mark=anchor, color=red) [cat=p, i=?F]
	node (mark=subst, color=red ) [cat=sv, e=?X0, mode= sub]}
			
   };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le Syntagme Subordonné
%%=============================================================================

class SyntagmeSub
declare ?Gen ?Num ?V ?Mode ?Aspect ?Voix ?F ?X0
{
  <syn>
  {

     node (color=red, mark=anchor) [cat=subor, i=?F, gen= ?Gen, num=?Num]
     |

     node (color=red, mark=anchor) [cat=subor_p, i=?F]
     |

%---celle qui est à la maison /اَلّتي في المنزلِ	
    node  (color=black) [cat=sn, i=?F, subcat=sn_sub, gen= ?Gen, num=?Num]{
	node (mark=anchor, color=red) [cat=subor, gen= ?Gen, num=?Num]
	node (mark=subst, color=red ) [cat=sp, i=?X0]}
    |
	
%---celui qui était à la maison /اَلّذي كانَ في المنزلِ
    node  (color=black) [cat=sn, i=?F, subcat=sn_sub, gen= ?Gen, num=?Num, cas=@{acc,nom}, def=@{0,1}]{
	node (mark=anchor, color=red) [cat=subor, gen= ?Gen, num=?Num]
	node (mark=subst, color=red ) [cat=pn, i=?X0, gen= ?Gen, num=?Num, fgtype=non]}
    |
	
%---ceux à la maison/من في المنزلِ
    node  (color=black) [cat=sn, i=?F, subcat=sn_subp, cas=@{acc,nom,gen}]{
	node (mark=anchor, color=red) [cat=subor_p]
	node (mark=subst, color=red ) [cat=sp, i=?X0]}
    |
	
%---celui qui était à la maison /من كانَ في المنزلِ
    node  (color=black) [cat=sn, i=?F, subcat=sn_subp, gen= ?Gen, num=?Num, cas=@{acc,nom}]{
	node (mark=anchor, color=red) [cat=subor_p]
	node (mark=subst, color=red ) [cat=pn, i=?X0, fgtype=pnv]}

   };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le syntagme conjonctif
%%=============================================================================

class SyntagmeConj 
declare ?Cas ?Gen ?Num ?Voix ?Hum ?Anime ?F ?X0 ?X1 
{
  <syn>
  {

%---Le livre et le crayon/الكتابَ و القلمَ
    node  (color=red) [cat=sn, i=?F, bot=[cas=?Cas, gen=?Gen, num=dl, hum=?Hum, anime=?Anime]]{
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas=?Cas, gen=?Gen, num=sg, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, i=?X1, cas=?Cas,num=sg]{
		node (mark=anchor, color=red) [cat=proc]
		node (mark=subst, color=red ) [cat=sn, i=?X1, cas=?Cas, num=sg]}}
    |
	
    node  (color=red) [cat=sn, i=?F, bot=[cas=?Cas, gen=?Gen, num=plr, hum=?Hum, anime=?Anime]]{
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas=?Cas, gen=?Gen, num=@{sg,dl,plr}, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, i=?X1, cas=?Cas]{
		node (mark=anchor, color=red) [cat=proc]
		node (mark=subst, color=red ) [cat=sn, i=?X1, cas=?Cas, num=@{dl,plr}]}}
    |
	
    node  (color=red) [cat=sn, i=?F, bot=[cas=?Cas, gen=?Gen, num=plr, hum=?Hum, anime=?Anime]]{
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas=?Cas, gen=?Gen, num=@{dl,plr}, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, i=?X1, cas=?Cas, num=sg]{
		node (mark=anchor, color=red) [cat=proc]
		node (mark=subst, color=red ) [cat=sn, i=?X1, cas=?Cas, num=sg]}}
    |
	
%---Noir et blanc/أسودٌ و أبيضٌ
    node  (color=red) [cat=adj, i=?F, bot=[cas=?Cas, gen=?Gen, num=?Num]]{
	node (mark=subst, color=red ) [cat=adj, i=?X0, cas=?Cas, gen=?Gen, num=?Num]
	node (color=red) [cat=adj, i=?X1, cas=?Cas, gen=?Gen, num=?Num]{
		node (mark=anchor, color=red) [cat=proc]
		node (mark=subst, color=red ) [cat=adj, i=?X1, cas=?Cas, gen=?Gen, num=?Num]}}
    |
	
%---Le livre ou le crayon /الكتابَ أو القلمَ  
    node  (color=red) [cat=sn, i=?F, bot=[cas=?Cas, hum=?Hum, anime=?Anime]]{
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas=?Cas, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, i=?X1, cas=?Cas]{
		node (mark=anchor, color=red) [cat=proc_c]
		node (mark=subst, color=red ) [cat=sn, i=?X1, cas=?Cas]}}
    |
	
%---Noir ou blanc /أسودٌ أو أبيضٌ
    node  (color=red) [cat=adj, i=?F, bot=[cas=?Cas, gen=?Gen, num=?Num]]{
	node (mark=subst, color=red ) [cat=adj, i=?X0, cas=?Cas, gen=?Gen, num=?Num]
	node (color=red) [cat=adj, i=?X1, cas=?Cas, gen=?Gen, num=?Num]{
		node (mark=anchor, color=red) [cat=proc_c]
		node (mark=subst, color=red ) [cat=adj, i=?X1, cas=?Cas, gen=?Gen, num=?Num]}}
    |
	
%---Manger et boire / أكلَ و شربَ 
%    node  (color=red) [cat=sv]{
%	node (mark=anchor, color=red) [cat=proc]
%	node (mark=foot, color=red ) [cat=sv]}
%    |
%
%---Manger ou boire / أكلَ أو شربَ 
%    node  (color=red) [cat=sv]{
%	node (mark=anchor, color=red) [cat=proc_c]
%	node (mark=foot, color=red ) [cat=sv]}
%    |
%
%---Le livre est jaune et le stylo est noir / الكتابُ أصفرٌ و القَلمُ أسودٌ 	
%    node  (color=red) [cat=pn]{
%	node (mark=anchor, color=red) [cat=proc]
%	node (mark=foot, color=red ) [cat=pn]}
%   |
%	
%---À l'école puis à la bibliothèque /  إلي المدرسة ثم إلي المكتبة
    node  (color=red) [cat=sp, i=?F]{
	node (mark=subst, color=red ) [cat=sp, i=?X0]
	node (mark=anchor, color=red) [cat=proc]
	node (mark=subst, color=red ) [cat=sp, i=?X1]}
    |

%---À l'école ou à la maison /  في المدرسةِ أو في المنزلِ 
    node  (color=red) [cat=sp, i=?F]{
	node (mark=subst, color=red ) [cat=sp, i=?X0]
	node (mark=anchor, color=red) [cat=proc_c]
	node (mark=foot, color=red ) [cat=sp, i=?X1]}

   };
  <iface>{
    [f=?F, arg0=?X0, arg1=?X1]
  }
}
%%=============================================================================
%% les Syntagmes nominaux: le syntagme d'annexion
%%--- ville de bizerte/ مدينةُ بنزرت
%%=============================================================================

class SyntagmeAnnex
declare ?Cas ?Gen ?Num ?NP ?Def ?Hum ?Anime ?X0 ?F ?Num ?SubCat
{
  <syn>
  {

%---Livre de lecture / كتابُ القراءةِ 
%---Mon livre ceci/ كتابي هذا  
    node  (color=black) [cat=sn, top=[i=?F, cas=?Cas, gen=?Gen, num=?Num, def=?Def, npro=?NP, hum=?Hum, anime=?Anime], bot=[subcat=sn_ann]]{
	node (color=red, mark=anchor ) [cat=sn, i=?F, cas=?Cas, gen=?Gen, num=?Num, def=?Def, npro=?NP, hum=?Hum, anime=?Anime]
	node (color=red, mark=foot   ) [cat=sn, i=?X0, cas=gen]}
    |

%---Mon ami/ صديقيِ
    node  (color=black) [cat=sn, bot=[i=?F, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=0, npro=0, oclit=o_1, subcat=sn_ann]]{
	node (color=red, mark=anchor ) [cat=sn, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=0, npro=0, oclit=o_0]
	node (color=red, mark=subst  ) [cat=enc, i=?X0]}
    |

	
%---élève de sixième / تلميذٌ في الصفِّ السادسِ  
    node  (color=black) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, num=?Num, gen=?Gen, def=0, npro=?NP, hum=?Hum, anime=?Anime]{
	node (mark=anchor, color=red ) [cat=sn, cas=?Cas, num=?Num, gen=?Gen, npro=?NP, hum=?Hum, anime=?Anime]
	node (mark=subst , color=red ) [cat=sp, i=?X0]}
                     
   };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le syntagme de mode
%%--- Ali endormi/ عليٌ نائمًا
%%=============================================================================

class SyntagmeMode
export ?Gen ?Num
declare ?Cas ?Gen ?Num ?F ?X0 ?X1 ?X2 ?X3 
{

  <syn>
  {
%---endormi/ نائمًا
    node  (mark=anchor, color=black) [cat=mushtaq, i=?F,cas=acc, gen=?Gen, num=?Num]
    |


%---en étant ravi / و هو مسرورٌ  
    node  (color=black) [cat=adv, i=?F, cas=acc, gen=?Gen, num=?Num]{
	node (mark=anchor, color=red ) [cat=proc]
	node (mark=subst, color=red  ) [cat=sn, subcat=pron, cas=?Cas, gen=?Gen, num=?Num]
	node (mark=subst, color=red  ) [cat=adj, i=?X0, gen=?Gen, num=?Num]}
    |
	
%---et la fatigue l'a épuisé / وَ قَدْ أَنْهَكَهُ التَّعَبُ  
    node  (color=black) [cat=adv, i=?F, cas=acc, gen=?Gen, num=?Num]{
	node (mark=anchor, color=red ) [cat=proc]
	node (mark=subst, color=red  ) [cat=sv, i=?X0, gen=?Gen, num=?Num]}
  };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le syntagme corroboratif
%%=============================================================================

class SyntagmeCorro
declare ?Gen ?Num ?Cas ?Npro ?Hum ?Anime ?SubCat ?F ?X0 ?X1 ?X2 ?X3 ?X4
{

  <syn>
  {
%---La maison entière/ المنزلَ كلَّهُ
%---Tous les garçons/ الأولادُ كلَّهُمْ  
    {((?Num=sg; ?Hum=h_0) | ?Hum=h_1);
    node  (color=red) [cat=sn, i=?F, subcat=?SubCat, cas=?Cas, num=?Num, gen=?Gen, def=1, npro=?Npro, hum=?Hum, anime=?Anime]{
	node (color=red, mark=foot ) [cat=sn, i=?F, subcat=?SubCat, cas=?Cas, num=?Num, gen=?Gen, def=1, npro=?Npro, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, def=0, oclit=o_1, gen=?Gen, num=?Num]{
		node (mark=anchor, color=red) [cat=sn, i=?X0, def=0]
		node (mark=subst, color=red ) [cat=enc, i=?X1, gen=?Gen, num=?Num]}}}

   |

%---Les livres entière/  الكتبُ كلَّهَا
    {((?Num=dl|?Num=plr); ?Hum=h_0);
    node  (color=red) [cat=sn, i=?F, subcat=?SubCat, cas=?Cas, num=?Num, gen=?Gen, def=1, npro=?Npro, hum=?Hum, anime=?Anime]{
	node (color=red, mark=foot ) [cat=sn, i=?F, subcat=?SubCat, cas=?Cas, num=?Num, gen=?Gen, def=1, npro=?Npro, hum=?Hum, anime=?Anime]
	node (color=red) [cat=sn, def=0, oclit=o_1, gen=f, num=sg]{
		node (mark=anchor, color=red) [cat=sn, i=?X0, def=0]
		node (mark=subst, color=red ) [cat=enc, i=?X1, gen=f, num=sg]}}}

  };
  <iface>{
    [f=?F, arg0=?X0, arg1=?X1]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le syntagme approbatif 
%%    node (color=red) [cat=sn, gen=?Gen, num=?Num, cas=?Cas, def=0, npro=1, hum=h_1]{
%%      node (color=red, mark=foot  ) [cat=sn, gen=?Gen, num=?Num, cas=?Cas, npro=1, hum=h_1]
%%      node (color=red, mark=anchor) [cat=adj, gen=?Gen, num=?Num, cas=?Cas, def=0]
%%      	   }
%%=============================================================================

class SyntagmeAppro
declare ?Gen ?Num ?Cas ?Npro ?Hum ?Anime ?Def ?F  
{  

%---Fatima celle qu'Ali aime / فاطمةٌ اَلّتي يحبُ هَا عليٌ  
%---Le garçon qui aime Fatima/ ال ولدُ اَلّذي يحبُ فاطمةً 
%---Mon ami Ahmed/ صديقيِ أحمدُ
%---Ahmed mon ami/أحمدُ صديقيِ	
  <syn>
  {
    node (color=red) [cat=sn, bot=[i=?F, gen=?Gen, num=?Num, cas=?Cas, def=1, hum=?Hum, anime=?Anime]] {
      node (color=red ) [cat=sn, bot=[subcat=sn_def, gen=?Gen, num=?Num, cas=?Cas, def=1, hum=?Hum, anime=?Anime]]{
	node (color=red, mark=subst  ) [cat=proc_def]
        node (color=red, mark=anchor ) [cat=sn, gen=?Gen, num=?Num, cas=?Cas, hum=?Hum, anime=?Anime]}
        node (color=red, mark=foot) [cat=sn, top=[subcat=@{sn_sub,sn_subp,sn_ann,nom_prop}, gen=?Gen, num=?Num]]}
    |

    node (color=red) [cat=sn,  bot=[i=?F, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]] {
      node (color=red, mark=foot) [cat=sn, subcat=@{sn_sub,sn_subp,sn_ann, nom_prop}, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]
      node (color=red ) [cat=sn,  subcat=sn_def, gen=?Gen, num=?Num, def=1]{
	node (color=red, mark=subst  ) [cat=proc_def]
        node (color=red, mark=anchor ) [cat=sn, gen=?Gen, num=?Num]}}
    |

    node (color=red) [cat=sn, bot=[i=?F, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]] {
      node (color=red, mark=foot) [cat=sn, subcat=@{sn_sub,sn_subp,sn_ann}, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]
      node (color=red, mark=anchor  ) [cat=sn, gen=?Gen, num=?Num]}
    |

    node (color=red) [cat=sn, bot=[i=?F, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]] {
      node (color=red, mark=anchor  ) [cat=sn, gen=?Gen, num=?Num, cas=?Cas, def=?Def, hum=?Hum, anime=?Anime]
      node (color=red, mark=foot) [cat=sn, top=[subcat=@{sn_sub,sn_subp,sn_ann}, gen=?Gen, num=?Num]]}};

  <iface>{
    [f=?F]
  }
}

%%=============================================================================
%% les Syntagmes nominaux: le syntagme semi-propositionnel
%%=============================================================================

class SyntagmeSP[Derive, Cat]
declare ?Cas ?Num ?Gen ?F ?X0 
{
  <syn>
  {
	node  (color=black) [cat=sn, i=?F, subcat=Cat, cas=?Cas, num=?Num, gen=?Gen, def=0]{
		node (mark=anchor, color=red) [cat=Derive, cas=?Cas, num=?Num, gen=?Gen]
		node (mark=subst, color=red ) [cat=sn, i=?X0]}
	|
	
    	node  (color=black) [cat=sn, i=?F, subcat=Cat, cas=?Cas, num=?Num, gen=?Gen, def=0]{
		node (mark=anchor, color=red) [cat=Derive, cas=?Cas, num=?Num, gen=?Gen]
		node (mark=subst, color=red ) [cat=sp, i=?X0]}
	|
	
	node  (color=black) [cat=sn, i=?F, subcat=Cat, oclit=o_1, cas=?Cas, num=?Num, gen=?Gen, def=0]{
		node (mark=anchor, color=red) [cat=Derive, cas=?Cas, num=?Num, gen=?Gen]
		node (mark=subst, color=red ) [cat=enc, i=?X0]}
	
	|
	
	node  (color=black) [cat=sn, i=?F, subcat=Cat, cas=?Cas, def=1, num=?Num, gen=?Gen]{
		node (color=red) [cat=Derive, def=1, num=?Num, gen=?Gen]{
			node (color=red, mark=subst ) [cat=proc_def]
			node (mark=anchor, color=red) [cat=Derive, cas=?Cas, num=?Num, gen=?Gen]}
		node (mark=subst, color=red ) [cat=sn, i=?X0]}
	|
	
    	node  (color=black) [cat=sn, i=?F, subcat=Cat, cas=?Cas, def=1, num=?Num, gen=?Gen]{
		node (color=red) [cat=Derive, def=1, num=?Num, gen=?Gen]{
			node (color=red, mark=subst ) [cat=proc_def]
			node (mark=anchor, color=red) [cat=Derive, cas=?Cas, num=?Num, gen=?Gen]}
		node (mark=subst, color=red ) [cat=sp, i=?X0]}

  };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

class SyntagmeSemiProp
declare ?F ?X0 ?X1 ?Cas ?Num ?Gen
{
%---participe actif: dormant à la maison/ نائمًا في المنزلِ
    SyntagmeSP[pactif,sn_sem_pac]  |

%---participe passif: écrit dans le livre/ مكتوبٌ في الكتابِ 
%---Plein de pouvoir / الواسِعُ السُّلْطَانِ
%---L'abandonnée à la maison / المترووكةَ في المنزلِ
    SyntagmeSP[ppassif,sn_sem_ppas] |

%---comparatif: plus âgé/ أكبرُ سنًّا
    SyntagmeSP[comp,sn_sem_comp]    |

%---qualité similaire: vieux/ كبيرُ السّنِ 
     SyntagmeSP[qual,sn_sem_qual]    |
%---nom verbal: le vieil âge/ كِبَرُ السّنِ 
      SyntagmeSP[nverbal,sn_sem_nv] |
	{
	<syn>
	{
%---comparatif: le plus âgé parmi les gens/ أكبرُ النَّاسِ سنًّا
	 node  (color=red) [cat=sn, i=?F, subcat=sn_sem_comp, cas=?Cas, num=?Num, gen=?Gen]{
		 node  (color=red) [cat=sn, i=?X1, cas=?Cas, num=?Num, gen=?Gen]{
			node (mark=anchor, color=red) [cat=comp, cas=?Cas, num=?Num, gen=?Gen]
			node (mark=subst, color=red ) [cat=sn, i=?X1, cas=gen, def=1]}
		 node (mark=subst, color=red ) [cat=sn, i=?X0, cas=acc, def=0]}};
  <iface>{
   [f=?F, arg0=?X0]
  }
	}
}

%%=============================================================================
%% SyntagmeAdj (= Syntagme adjectival) sets up a modifier that post-adjoins to
%% the verbe or an argument
%% Si le nom est un être humain, l'acord de l'adjectif épithète se fait en genre
%% en nombre, en cas et en détermination et l'adjectif se place toujours après
%% le nom qu'il qualifie.
%%--- Beau garçon/ ولدٌ جميلٌ
%%--- Beaux garçons/ أولادٌ  جُملاءٌ 
%% si le nom est non humain singulier, l'accord de l'adjectif épithète se fait
%% en cas, en genre et en détermination.
%%--- le livre jaune/ الكتابُ الأصفرُ
%%--- livre jaune/كتابٌ أصفرٌ
%% Si le nom est un non humain pluriel, l'adjectif épithèse se fait en cas et en
%% déternimation, mais normalement au féminin singulier.
%%--- livres jaune/ كتبٌ صفراءٌ
%%--- les livres la jaune/ الكتبُ الصفراءُ
%% quand au nom propre il s'accord en genre, en nombre et en cas.
%%--- Ali est beau/عليٌ جميلٌ
%%--- Ali le beau/عليٌ الجميلٌ
%%=============================================================================

class SyntagmeAdj
declare ?Cas ?Gen ?Def ?Num ?Npro ?Hum ?Anime ?F ?X0 ?X1 
{
  <syn>
  {
%---Beau garçon / ولدٌ جميلٌ
%---Beaux garçons / أولادٌ  جُملاءٌ 
%---Livre jaune/كتابٌ أصفرٌ
 {(?Hum=h_1 |(?Hum=h_0; ?Num= sg) |(?Hum=h_0; ?Num=dl));
  (
    node (color=red) [cat=sn, i=?F, bot=[subcat=sn_adj, gen=?Gen, num=?Num, cas=?Cas, def=0, npro=?Npro,  anime=?Anime, hum=?Hum]]{
	node (color=red, mark=foot  ) [cat=sn, i=?F, subcat=@{sn_com, nom_prop, sn_ann}, gen=?Gen, num=?Num, cas=?Cas, def=0, npro=?Npro, anime=?Anime, hum=?Hum]
	node (color=red, mark=anchor ) [cat=adj, gen=?Gen, num=?Num, cas=?Cas, def=0]}
    |
	
%---Le beau garçon / الولدُ الجميلُ
%%---Le livre jaune/ الكتابُ الأصفرُ
    node (color=red) [cat=sn,  i=?F, gen=?Gen, num=?Num, cas=?Cas, def=1, npro=?Npro, anime=?Anime, hum=?Hum]{
	node (color=red, mark=foot ) [cat=sn, i=?F, subcat=sn_def, gen=?Gen, num=?Num, cas=?Cas, def=1, npro=?Npro, anime=?Anime, hum=?Hum]
	node (color=red) [cat=adj, gen=?Gen, num=?Num, cas=?Cas, def=1]{
		node (color=red, mark=subst ) [cat=proc_def]
		node (color=red, mark=anchor) [cat=adj, gen=?Gen, num=?Num, cas=?Cas, def=0]}}
   )
 }
    |
	
%---Livres jaune/ كتبٌ صفراءٌ
    node (color=red) [cat=sn, i=?F, gen=?Gen, num=plr, cas=?Cas, def=0, anime=?Anime, hum=h_0]{
	node (color=red, mark=foot  ) [cat=sn, i=?F, gen=?Gen, num=plr, cas=?Cas, anime=?Anime, def=0, hum=h_0]
	node (color=red, mark=anchor) [cat=adj, gen=f, num=sg, cas=?Cas, def=0]}
    |
	
%---Les livres la jaune/ الكتبُ الصفراءُ
    node (color=red) [cat=sn, i=?F, gen=?Gen, num=plr, cas=?Cas, def=1, anime=?Anime, hum=h_0]{
	node (color=red, mark=foot ) [cat=sn, i=?F, gen=?Gen, num=plr, cas=?Cas, def=1, anime=?Anime, hum=h_0]
	node (color=red) [cat=adj, gen=?Gen, num=sg, cas=?Cas, def=1]{
		node (color=red, mark=subst ) [cat=proc_def]
		node (color=red, mark=anchor) [cat=adj, gen=f, num=sg, cas=?Cas, def=0]}}
	
  };
  <iface>{
    [f=?F, arg0=?X0]
  }
}

%%=============================================================================
%% complément Circonstanciel
%%--- hier soir/مساءَ أمسٍ
%%=============================================================================

class ComplementCirc
declare ?X0 ?F
{
  (<syn>
  {
%---matin/صباحًا
    node (color=black) [cat=cc, i=?F]{
	node (mark=anchor, color=red) [cat=sn, cas=acc]}

    |

%---le matin/الصباحُ	
    node (color=black) [cat=cc, i=?F, def=1]{
	node (mark=subst, color=red) [cat=proc_def]
	node (mark=anchor, color=red ) [cat=sn]}
    |

%---hier soir/مساءَ أمسٍ
    node (color=black) [cat=cc, i=?F]{
	node (mark=anchor, color=red) [cat=circ]
	node (mark=foot, color=red ) [cat=cc]}};
  <iface>{
    [f=?F, arg0=?X0]
  })
    |

 (<syn>
  {
%---devant la maison /أمام المنزلِ
    node (color=black) [cat=cc, i=?F]{
	node (mark=anchor, color=red) [cat=circ]
	node (mark=subst, color=red ) [cat=sn, i=?X0, cas= gen]}
    |

    node (color=black) [cat=cc, i=?F]{
	node (mark=anchor, color=red) [cat=circ]
	node (mark=subst, color=red ) [cat=sv, i=?X0]}
   |

    node (color=black) [cat=cc, i=?F]{
	node (mark=anchor, color=red) [cat=circ]
	node (mark=subst, color=red ) [cat=pn, i=?X0, fgtype=pnv]}
    |

%---devant lui /أمامهُ 
    node (color=black) [cat=cc, i=?F, oclit=o_1]{
		node (mark=anchor, color=red ) [cat=circ]
		node (mark=subst, color=red) [cat=enc, i=?X0]}
	
   };
  <iface>{
    [f=?F, arg0=?X0]
  })
}

%%=============================================================================
%% classes pour les particules / Enclitique / Proclitique
%%=============================================================================

%%--- particule 

class Particule
declare ?F
{
  <syn>
  {
    node (mark=anchor, color=red) [cat=p, i=?F]
  };
  <iface>{
    [f=?F]
  }
}


%%--- proclitique / enclitique

class ProcEnc
export ?Gen ?Num ?Voix ?Mode ?Aspect ?A ?A_Num ?A_Gen
declare ?V ?Gen ?Num ?Voix ?Mode ?Aspect ?A ?A_Num ?A_Gen ?PClit ?OClit ?EV ?X0 ?F 
{
 { <syn>
  {
    node (mark=anchor, color=red) [cat=proc_def]
    |
	
    node (mark=anchor, color=red) [cat=enc, i=?F]
    |
	
    node (mark=anchor, color=red) [cat=proc_v, i=?F]};
  <iface>{
    [f=?F]
  }
}
    |
{
<syn>
  {	
    node ?V (color=red) [cat=v, e=?EV, num=?Num, gen=?Gen, voix=?Voix, mode=?Mode, aspect=?Aspect, oclit=?OClit, pclit=p_1]{
		node (color=red, mark=anchor) [cat=proc_v, e=?EV, mode=?Mode]
		node (color=red, mark=foot  ) [cat=v, num=?Num, gen=?Gen, voix=?Voix, aspect=?Aspect, mode=?Mode, oclit=?OClit, pclit=p_0]}
    |

    node ?V (color=red) [cat=v, e=?EV, top= [num=?Num, gen=?Gen, voix=?Voix, mode=?Mode, aspect=?Aspect, oclit=o_1, numA=?A_Num, genA= ?A_Gen]]{
		node (color=red, mark=foot) [cat=v, num=?Num, gen=?Gen, voix=?Voix, mode=?Mode, aspect=?Aspect, oclit=o_0]
		node ?A (color=red, mark=anchor ) [cat=enc, e=?EV, fg=objet1, num=?A_Num, gen= ?A_Gen] }};
  <iface>{
    [e=?EV]
  }
}
}

%%=============================================================================
%% probablement pas utile
%%=============================================================================

%%--- particule interrogative

class ParticuleI
{
  <syn>
  {
    node (mark=anchor, color=red) [cat=pinter]
  }
}
class ParticuleInterrogative
{
  <syn>
  {
    node (mark=anchor, color=red) [cat=inter, pint=i_a]
    |
	
    node (mark=anchor, color=red) [cat=inter, pint=i_e]
  }
}
