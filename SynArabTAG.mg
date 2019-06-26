%Cherifa Ben Khelil : cherifa.bk@gmail.com

%%=============================================================================
%% les fichiers de la méta-grammaire.
%%
%%=============================================================================
include Syntagmes.mg
include Verbal.mg
include Nominal.mg



%%=============================================================================
%% phrases interrogatives
%%=============================================================================

class Interrogative
{
  <syn>
  {
%---Est ce que Ali dort? / هل ينامُ عليٌ؟
    node (color=red, mark=nadj) [cat=sv, fgtype=interrogative]{
	node (mark=anchor, color=red) [cat=inter]
        node (mark=subst, color=red ) [cat=sv]}
    |
	     
%---Pourquoi? / لماذا؟
    node (color=red) [cat=sv, fgtype=interrogative]{
        node (mark=anchor, color=red) [cat=inter, pint=i_e]}
    |

%---Jusqu'à quand ali s'est endormi? / إلى متى نامَ عليٌ؟   
    node (color=red) [cat=sv, fgtype=interrogative]{
 	node (mark=subst, color=red ) [cat=p]
        node (mark=anchor, color=red) [cat=inter]
        node (mark=subst, color=red ) [cat=sv]}
    | 

%---Est ce qu'il fait beau? / هل الطقسُ جميلٌ؟ 
    node (color=red) [cat=pn, fgtype=interrogative]{
        node (mark=anchor, color=red) [cat=inter]
	node (mark=subst, color=red ) [cat=pn]}
    | 

%---Qui est à la maison? / منْ فِي المنزلِ؟
    node (color=red) [cat=pn, fgtype=interrogative]{
        node (mark=anchor, color=red) [cat=inter]
	node (mark=subst, color=red ) [cat=sp]}
    | 

%---Qui est à la maison? / منْ فِي المنزلِ؟
    node (color=red) [cat=pn, fgtype=interrogative]{
        node (mark=anchor, color=red) [cat=inter]
	node (mark=subst, color=red ) [cat=cc]}
    | 
 
%---Où est le livre de lecture? / أينَ كتابُ القراءةِ؟
    node (color=red) [cat=pn, fgtype=interrogative]{
        node (mark=anchor, color=red) [cat=inter]
	node (mark=subst, color=red ) [cat=sn]}
 	                    
    }
}


%%=============================================================================
%% phrases exclamatives
%%=============================================================================

class Exclamative
{
  <syn>
  {
%---
    node (color=red) [cat=pn, fgtype=exclamative]{
	node (mark=anchor, color=red) [cat=exc]
        node (mark=subst, color=red ) [cat=sn, subcat=sn_sem_comp]}}

}

%%=============================================================================
%% phrases d'appel
%%=============================================================================

class Appel
declare ?Cat ?Num ?Gen ?Hum ?Anime
{
  <syn>
  {
%---
    (?Cat=pn | ?Cat=sn);
    node (color=red) [cat=?Cat, fgtype=appel, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]{
	node (mark=anchor, color=red) [cat=app]
        node (mark=subst, color=red ) [cat=sn, subcat=@{sn_ann, nom_prop}, num=?Num, gen=?Gen, hum=?Hum, anime=?Anime]}}

}

