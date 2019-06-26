%Cherifa Ben Khelil : cherifa.bk@gmail.com

%%=============================================================================
%% EpinePN
%%=============================================================================

class EpinePN[CouleurPN, CouleurAD]
export  ?PN ?AG ?AD ?Gen ?Num ?FGType
declare ?PN ?AG ?AD ?Gen ?Num ?FGType ?F
{
  <syn>
  {
    node ?PN (color=?CouleurPN) [cat=pn, gen=?Gen, num=?Num, fgtype=?FGType, i=?F] {
      node ?AG (color=?CouleurPN) [cat=advg] {
        node ?AD (color=?CouleurAD) [cat=advd] }}
  }; 
  <iface>
  { [f=?F] }
}

%%=============================================================================
%% EpineTheme
%%=============================================================================

class EpineTheme[Couleur,Cas]
import EpinePN[?Couleur,?Couleur] 
export  ?AG ?AD ?P ?Gen ?Num ?Hum ?Anime ?hasv
declare ?P ?Hum ?Anime ?Npro ?Def ?hasv ?F
{
  <syn>
  {
   ?hasv=0;
   ( 
    node ?P (color=?Couleur, mark=anchor) [cat=sn, i=?F, subcat=@{sn_com,nom_prop,dem,pron}, cas=?Cas, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]
    |

    node ?P (color=red) [cat=sn, bot=[i=?F, subcat=sn_def, cas=nom, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=1, npro=0]]{
      	node (color=red, mark=subst  ) [cat=proc_def]
      	node (color=red, mark=anchor ) [cat=sn, bot=[i=?F], subcat=sn_com, cas=nom, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=0, npro=0]}
    |
	
    node ?P (color=?Couleur) [cat=sn, i=?F, subcat=sn_def, cas=?Cas, def=1, gen=?Gen, num=?Num, npro=0]{
        node (color=?Couleur) [cat=sn, cas=?Cas, def=1, gen=?Gen, num=?Num] {
			node (color=?Couleur, mark=subst ) [cat=proc_def]
			node (color=?Couleur, mark=anchor) [cat=adj, i=?F, cas=?Cas, def=0, gen=?Gen, num=?Num] }
		node (color=?Couleur, mark=subst ) [cat=sp]}
    |
	
    node ?P (color=?Couleur) [cat=sn, i=?F, subcat=sn_ann, cas=?Cas, gen=?Gen, num=?Num, npro=0, hum=?Hum, anime=?Anime]{
		node (color=?Couleur, mark=anchor) [cat=sn, i=?F, cas=?Cas, def=0, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]
		node (color=?Couleur, mark=subst ) [cat=sn, cas=gen, npro=0]}
    |
	
    node ?P (color=?Couleur) [cat=sn, i=?F, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, npro=0]{
		node (color=?Couleur, mark=anchor) [cat=sn, i=?F, subcat=sn_com, cas=?Cas, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime, def=0, npro=0]
        node (color=?Couleur, mark=subst ) [cat=enc]}
    |
	
    node ?P (color=?Couleur) [cat=sn, i=?F, cas=?Cas, gen=?Gen, num=dl, hum=?Hum, anime=?Anime, def=1]{
	    node (mark=subst, color=?Couleur ) [cat=sn, cas=?Cas, gen=?Gen, num=sg, hum=?Hum, anime=?Anime, def=?Def]
		node  (color=?Couleur) [cat=sn, cas=nom, num=sg, def=1]{
			node (mark=anchor, color=?Couleur) [cat=proc]
			node (mark=subst, color=?Couleur ) [cat=sn, cas=?Cas, num=sg, def=?Def]}}
    |
	
    node ?P (color=?Couleur) [cat=sn, i=?F, cas=?Cas, gen=?Gen, num=plr, hum=?Hum, anime=?Anime, def=1]{
	    node (mark=subst, color=?Couleur ) [cat=sn, cas=?Cas, gen=?Gen, hum=?Hum, anime=?Anime, def=?Def]
		node  (color=?Couleur) [cat=sn, cas=?Cas, num=dl, def=1]{
			node (mark=anchor, color=?Couleur) [cat=proc]
			node (mark=subst, color=?Couleur ) [cat=sn, cas=?Cas, num=dl, def=?Def]}}
     
    );
    ?AD -> ?P

  }; 
  <iface>
  { [f=?F] }
}


%%=============================================================================
%% Theme
%%=============================================================================

%class Theme[Cas]
%import EpineTheme[black,Cas] as [?P ?AD]
%export ?P ?AD

class Theme[Cas,ET]
export ?P ?AD
declare ?P ?AD
{ ?P=?ET.P; ?AD=?ET.AD }



%%=============================================================================
%% EpineArgNom 
%%=============================================================================

class EpineArgNom[CasT, ?ET]
export ?AD ?P ?Gen ?Num ?Hum ?Anime
declare ?AD ?AG ?P ?Gen ?Num ?Hum ?Anime
{
 ?AG=?ET.AG;
 ?P=?ET.P;
 ?Gen=?ET.Gen;
 ?Num=?ET.Num;
 ?Hum=?ET.Hum;
 ?Anime=?ET.Anime;
  <syn>
  {
    node ?AD (color=red) [cat=advd];
    ?AG -> ?AD
  }
}

%%=============================================================================
%% Propos
%% Si le nom (sujet) est un être humain, l'accord de l'adjectif attribut se 
%% fait en genre et en nombre mais pas en cas ou en détermination.
%%--- le garçon est beau/الولدُ جميلٌ
%%--- les garçons sont beaux/الأولادُ جُملاءٌ
%% Si le nom est un inanimé singulier, l'accord de l'adjectif attribut se fait 
%% en genre et en nombre mais pas en cas ni en déterination.
%%--- le livre est lourd/الكتابُ ثقيلٌ
%% Si le nom est un inanimé pluriel, l'adjectif attribut est toujours au cas 
%% sujet indéterminé féminin singulier.
%%--- les livres sont loude/الكتبُ  ثقيلةٌ
%%=============================================================================

class Adjectif
declare ?Cas ?Num ?Gen ?F
{

 <syn>
  {
    node (mark=anchor, color=black) [cat=adj, i=?F, cas=?Cas, num=?Num, gen=?Gen]
    |
	
    node  (color=black) [cat=adj, i=?F, cas=?Cas, num=?Num, gen=?Gen, def=1]{
      node (color=red, mark=subst  ) [cat=proc_def]
      node (color=red, mark=anchor ) [cat=adj,cas=?Cas, num=?Num, gen=?Gen]}
    |
	
    node  (color=red) [cat=sn, i=?F, cas=?Cas, num=?Num, gen=?Gen, def=1]{
      node  (color=red) [cat=adj, cas=?Cas, num=?Num, gen=?Gen, def=1]{
      	node (color=red, mark=subst  ) [cat=proc_def]
      	node (color=red, mark=anchor ) [cat=adj, cas=?Cas, num=?Num, gen=?Gen]}
      node (color=red, mark=subst  ) [cat=sn, cas=acc, def=0]}
  };
  <iface>
  { [f=?F] }
}

class Propos[Cas, CasT, ?ET]
import EpineArgNom[CasT,?ET] as [?AD ?P ?Gen ?Num ?Hum ?Anime]
declare ?AJ ?EP ?SN ?SP ?CC ?SV ?V ?X0
{

  <syn>
  {
    {( ?Hum=h_1 | 
     ( ?Num=sg ; ?Hum=h_0) 
     |( ?Num=dl ; ?Hum=h_0));
	 
    node ?AJ (color=red, mark=subst) [cat=adj, i=?X0, cas=?Cas, def=0, gen=?Gen, num=?Num];
    ?P >> ?AJ;
    ?AD -> ?AJ }
    |
	
    {( ?Num=plr; ?Hum=h_0);
      node ?AJ (color=red, mark=subst) [cat=adj, i=?X0, cas=?Cas, def=0, gen=f, num=sg];
    ?P >> ?AJ;
    ?AD -> ?AJ }
    |

    {(( ?Hum=h_1 | 
     ( ?Num=sg ; ?Hum=h_0) 
     |( ?Num=dl ; ?Hum=h_0));	
    { node ?SN (color=red, mark=subst) [cat=sn, i=?X0, cas=?Cas, def=0, num=?Num];
    ?P >> ?SN;
    ?AD -> ?SN })
    |
    (( ?Num=plr ; ?Hum=h_0);	
    { node ?SN (color=red, mark=subst) [cat=sn, i=?X0, cas=?Cas, def=0, num=sg];
    ?P >> ?SN;
    ?AD -> ?SN })
    }
    |
	
    { node ?SP (color=red, mark=subst) [cat=sp, i=?X0];
    ?AD -> ?SP }
    |
	
    { 
    ?ET.hasv=0;
    (node ?P[cat=sn, subcat=dem]);
    node ?SV (color=red, mark=subst) [cat=sv, num=?Num, gen=?Gen];
    ?P  >> ?SV;
    ?AD -> ?SV }
    |
	
    { 
    ?ET.?FGType=non;
    (node ?P[cat=v_e] | node ?P[cat=v_c] );
    node ?SV (color=red, mark=subst) [cat=sv, suj=s_0, num=?Num, gen=?Gen];
    ?P  >> ?SV;
    ?AD -> ?SV }
    |
	
    { 
    ?ET.hasv=1;
    ?V=?ET.V;
    {node ?P[cat=sn] ; (node ?V[cat=v_e] | node ?V[cat=v_c] )};
    node ?SV (color=red, mark=subst) [cat=sv, suj=s_0, num=?Num, gen=?Gen];
    ?P  >> ?SV;
    ?AD -> ?SV }
    |
	
    { 
    ?ET.hasv=1;
    ?V=?ET.V;
    node ?V[cat=v_e] ;
    node ?SP (color=red, mark=subst) [cat=sp, cas=gen];
    node ?SN (color=red, mark=subst) [cat=sn, i=?X0, cas=nom, def=0, num=?Num];
    ?V  >> ?SP;
    ?SP >> ?SN;
    ?AD -> ?SP;
    ?AD -> ?SN }
    |
	
    { 
    ?ET.hasv=1;
    ?V=?ET.V;
    node ?V[cat=v_c] ;
    node ?SP (color=red, mark=subst) [cat=sp, cas=gen];
    node ?SN (color=red, mark=subst) [cat=sn, i=?X0, cas=acc, def=0, num=?Num];
    ?V  >> ?SP;
    ?SP >> ?SN;
    ?AD -> ?SP;
    ?AD -> ?SN }
    |
	
    { node ?CC (color=red, mark=subst) [cat=cc, i=?X0];
    ?AD -> ?CC }

  };
  <iface>
  { [arg0=?X0] }
}


%%=============================================================================
%% PhrasesNominales
%%--- il fait beau/الطقسُ جميلٌ 
%---- ali est à la maison/عليٌ في المنزلِ
%%=============================================================================

%class PhraseNominale  { Theme[nom] ; Propos[nom,nom] }

class PhraseNominale
declare ?ET ?F ?X0
{
 {?ET = EpineTheme[black, nom];
 Theme[nom, ?ET] ; Propos[nom,nom, ?ET] };
 <iface>
  { [cat=sn, f=?F, arg0=?X0] }
}


%%============================================================================================
%% classes pour les phrases nominales qui commencent par un verbe d'existence ou de certitude
%%============================================================================================

class EpineThemeV[Couleur, Cat, Cas]
import EpinePN[?Couleur,?Couleur] 
export  ?AG ?P ?Gen ?Num ?Hum ?Anime ?Mode ?SN ?V ?hasv
declare ?P ?Hum ?Anime ?Mode ?V ?SN ?SP ?Proc ?Def ?hasv ?EV
{
 
  <syn>
  {  hasv=1;
    (
    {node ?P (color=?Couleur)[cat=sn, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
    	 node ?V (color=?Couleur, mark=anchor) [cat=?Cat, e=?EV, num=sg, gen=?Gen]
    	 node ?SN (color=?Couleur, mark=subst) [cat=sn, cas=?Cas, def=?Def, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]
    };
    ?FGType=pnv;
    ?V >> ?SN
    }
    |
    {
    ?Cat=v_c;
    node ?P (color=?Couleur)[cat=v_c, num=?Num, hum=h_0, gen=?Gen]{
    	 node ?V (color=?Couleur, mark=anchor) [cat=?Cat, num=sg, gen=?Gen]
    	 node ?SN (color=?Couleur, mark=subst) [cat=enc, cas=gen, gen=?Gen, num=?Num]
    };
    ?FGType=pnv;
    ?V >> ?SN
    }
    |
    {node ?P (color=?Couleur)[cat=sn, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
    	 node ?SN (color=?Couleur, mark=subst) [cat=sn, cas=?Cas, def=?Def, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]
    	 node ?V (color=?Couleur, mark=anchor) [cat=?Cat, e=?EV, num=?Num, gen=?Gen]
    };
    ?FGType=pnv;
    ?V >> ?SN
    }
    |
    {node ?P (color=?Couleur)[cat=sn, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
         node ?V (color=?Couleur)  [cat=?Cat, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
         	node (color=?Couleur, mark=subst) [cat=proc_v, mode=?Mode]
    	 	node (color=?Couleur, mark=anchor) [cat=?Cat, e=?EV, num=?Num, gen=?Gen, mode=?Mode]}
    	 node ?SN (color=?Couleur, mark=subst) [cat=sn, cas=?Cas, def=?Def, gen=?Gen, num=?Num, hum=?Hum, anime=?Anime]
    };
    ?FGType=pnv;
    ?V >> ?SN
    }
    |
    {node ?P (color=?Couleur)[cat=?Cat, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
         node ?Proc (color=?Couleur, mark=subst) [cat=proc_v, mode=?Mode]
    	 node ?V (color=?Couleur, mark=anchor) [cat=?Cat, e=?EV, num=?Num, gen=?Gen, mode=?Mode, hum=?Hum, anime=?Anime]
    };
    ?FGType=non;
    ?Proc >> ?V
    }
    |
    {
    ?FGType=non;
    node ?P (color=?Couleur, mark=anchor) [cat=?Cat, e=?EV, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime];
    ?P=?V
    }
    );
    ?AD -> ?P
  
  };
 <iface>
  { [e=?EV] }
}

class ThemeV[Cas,ET]
export ?P ?AD ?V
declare ?P ?AD ?V
{ ?P=?ET.P; ?AD=?ET.AD; ?V=?ET.V }

%%=============================================================================
%% classe pour les phrases nominales qui commencent par un verbe d'existence
%---- le temps est devenu beau/صارَ الطقسُ جميلاً 
%%--- Ali était devant la maison/كانَ عليٌ أمام المنزلِ
%%=============================================================================

class PhraseNominaleVE
declare ?ET ?EV ?X0
{
 {?ET = EpineThemeV[black, v_e, nom];
 Theme[nom, ?ET] ; Propos[acc,nom, ?ET] };
 <iface>
  { [cat=v_e, e=?EV, arg0=?X0] }
}

%%=============================================================================
%% classe pour les phrases nominales qui commencent par un verbe de certitude
%%--- le temps est beau/إنَّ الطقسَ جميلٌ
%%--- peut être que ali est devant la maison/لعلَّ علياً أمام المنزلِ
%%=============================================================================

class PhraseNominaleVC
declare ?ET ?EV ?X0
{
 {?ET = EpineThemeV[black, v_c, acc];
 Theme[acc, ?ET] ; Propos[nom,acc, ?ET] };
 <iface>
  { [cat=v_c, e=?EV, arg0=?X0] }
}
