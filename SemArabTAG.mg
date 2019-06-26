%Cherifa Ben Khelil : cherifa.bk@gmail.com

%%=============================================================================
%% import des Types et traits pour les frames sémantiques
%%=============================================================================
include FEHchy.mg
%%=============================================================================
%% les types utilisés dans cette méta-grammaire.
%%=============================================================================
type LABEL !
type IDX !
type FrameType !
%%=============================================================================
%% les traits utilisés pour l'interface sémantique dans cette méta-grammaire.
%%=============================================================================

feature e: IDX
feature i      : IDX
feature f      : IDX
feature arg0   : IDX
feature arg1   : IDX
feature arg2   : IDX
feature arg3   : IDX
feature Lem    : string
feature ValLem : string
feature First  : FrameType
feature Second : FrameType
feature Third  : FrameType
feature FEType : FrameType
feature Constraint1  : FrameType
feature Constraint2  : FrameType
feature Constraint3  : FrameType
feature NewFrameType : FrameType

%%=============================================================================
%% les verbes à 1 argument
%% ali dort/ عليٌ ينامُ
%% il dort/ ينامُ
%%=============================================================================


class FrameIntransitif
declare ?X0 ?X1 ?F ?EV ?C1
{
  
 <frame>
  {
    ?X0[?EV, 
	    FE1: [?F, 
                       subFrame: ?X1 [?C1] ]]};
 <iface>
  { [e=?X0,arg0=?X1, First= ?F, NewFrameType= ?EV, Constraint1= ?C1] }
}


%%=============================================================================
%% les verbes à 2 arguments
%% ali aime fatima/ عليٌ يحبُ فاطمةً
%% ali est allé à la maison/ ذهبَ عليٌ  إلى المنزلِ
%% il aime fatima/ يحبُ فاطمةً
%%=============================================================================

class FrameTransitif
import FrameIntransitif[]
declare ?X0 ?X2 ?S ?EV ?C2
{
 <frame>
  {
    ?X0[?EV, 
            FE2: [?S, 
                       subFrame: ?X2 [?C2] ]]};
 <iface>
  { [e=?X0, arg1=?X2, Second=?S, NewFrameType= ?EV, Constraint2= ?C2] }
}


%%=============================================================================
%% les verbes à 3 arguments
%% donne ali le livre a fatima/ أعطَى عليٌ الكتابَ إلى فاطمةً
%% ali le livre le donne a fatima/ عليٌ الكتابَ أعطَىهُ إلى فاطمةً
%% ali le donne a fatima/ عليٌ أعطَىهُ إلى فاطمةً 
%%=============================================================================

class FrameDitransitif
import FrameTransitif[]
declare ?X0 ?X3 ?T ?EV ?C3
{
 <frame>
  {
    ?X0[?EV, 
            FE3: [?T, 
                       subFrame: ?X3 [?C3] ]]};
 <iface>
  { [e=?X0, arg2=?X3, Third=?T, NewFrameType= ?EV, Constraint3 =?C3] }
}

%%=============================================================================
%% Forme passive
%%=============================================================================

class FrameTransitifPassif
declare ?X0 ?X1 ?F ?EV ?C1
{
  
 <frame>
  {
    ?X0[?EV, 
	    FE1: [?F, 
                       subFrame: ?X1 [?C1] ]]};
 <iface>
  { [e=?X0, arg0=?X1, First= ?F, NewFrameType= ?EV, Constraint1= ?C1] }
}


class FrameDitransitifPassif
import FrameTransitifPassif[]
declare ?X0 ?X2 ?S ?EV ?C2
{
 <frame>
  {
    ?X0[?EV, 
            FE2: [?S, 
                       subFrame: ?X2 [?C2] ]]};
 <iface>
  { [e=?X0, arg1=?X2, Second=?S, NewFrameType= ?EV] }
}



%%=============================================================================
%% les frames des syntagmes
%%=============================================================================
class FrameNomCommun
export ?C
declare ?X0 ?L ?C
{
  <frame>{
    ?X0[?C, 
        val: ?L]
  };
  <iface>{
    [f=?X0, Lem= ?L, FEType=?C]
  }
}


class FrameNomPropre
export ?C
declare ?X0 ?L ?C
{
  <frame>{
    ?X0[?C,
      nameProp: ?L ]
  };
  <iface>{
    [f=?X0, Lem= ?L, FEType=?C]
  }
}


class FrameSyntagmePrep
declare ?X0 ?X1 ?L
{
  <frame>{
    ?X0[
        sn: ?X1, 
        particule: ?L]
  };
  <iface>{
    [f=?X0, arg0=?X1, Lem= ?L]
  }
}

class FrameSyntagmeSub
declare ?X0 ?X1 ?L 
{
  <frame>{
    ?X0[
        val: ?L
        subbordonnee: ?X1]
  };
  <iface>{
    [f=?X0, arg0=?X1, Lem= ?L]
  }
}


class FrameSyntagmeConj
declare ?X0 ?X1 ?X2 ?L ?T ?C
{

  <frame>{
    ?X0[ ?C, 
      particule: ?L ,
      coordonné_à_lui: ?X1,
      coordonné:?X2]
  };
  <iface>{
    [f=?X0, arg0=?X1,
    arg1=?X2, Lem= ?L, FEType= ?C]
  }
}

class FrameSyntagmeAnnex
declare ?X0 ?X1 ?X2 ?L ?C
{
  <frame>{
    ?X0[ ?C,
        val: ?L, 
        annexion: ?X1]
  };
  <iface>{
    [f=?X0, arg0=?X1, Lem= ?L, FEType= ?C]
  }
}

class FrameSyntagmeCorro
declare ?X0 ?X1 ?X2 ?L ?C
{
  <frame>{
    ?X0[ ?C,
      corroboratif: ?L ,
      sujet_corroboratif: ?X1,
      enc:?X2]
  };
  <iface>{
    [f=?X0, arg0=?X1,
    arg1=?X2, Lem= ?L, FEType= ?C]
  }
}

class FrameSyntagmeAppro
declare ?X0 ?X1 ?L ?C
{
  <frame>{
    ?X0[ ?C,
        val: ?L,
        f: ?X1]
  };
  <iface>{
    [arg0=?X0, arg1=?X1, Lem= ?L, FEType= ?C]
  }
}

class FrameSyntagmeSemiProp
declare ?X0 ?X1 ?L ?C
{
  <frame>{
    ?X0[ ?C,
      val: ?L ,
      syntagme: ?X1]
  };
  <iface>{
    [f=?X0, arg0=?X1, Lem= ?L, FEType= ?C ]
  }
}

class FrameSyntagmeAdj
declare ?X0 ?L
{
  <frame>{
    ?X0[adjective: ?L]
  };
  <iface>{
    [f=?X0, Lem= ?L]
  }
}


class FrameComplementCirc
declare ?X0 ?X1 ?L
{
  <frame>{
    ?X0[
        sn: ?X1, 
        Circ: ?L]
  };
  <iface>{
    [f=?X0, arg0=?X1, Lem= ?L]
  }
}


class FrameAdverbe
declare ?X0 ?L
{
  <frame>{
    ?X0[adverbe: ?L]
  };
  <iface>{
    [f=?X0, Lem= ?L]
  }
}


class FrameSyntagmeMode
declare ?X0 ?L
{
  <frame>{
    ?X0[etat: ?L]
  };
  <iface>{
    [f=?X0, Lem= ?L]
  }
}

%%=============================================================================
%% les cadres sémantiques vides
%%=============================================================================
class FrameProcEnc
class FrameNomDem
class Pronom
class FrameInterrogative
class FrameExclamative
class FrameAppel
class FramePhraseNominaleVE
class FramePhraseNominaleVC
class FramePhraseNominale

%%=============================================================================
%% les familles de cadres sémantiques à générer.
%%=============================================================================
value FrameIntransitif
value FrameTransitif
value FrameDitransitif
value FrameTransitifPassif
value FrameDitransitifPassif
value FrameNomPropre 
value FrameNomCommun
value FrameSyntagmePrep
value FrameSyntagmeSub
value FrameSyntagmeConj
value FrameSyntagmeAnnex
value FrameSyntagmeMode
value FrameSyntagmeCorro
value FrameSyntagmeAppro
value FrameSyntagmeSemiProp
value FrameSyntagmeAdj
value FrameComplementCirc
value FrameAdverbe
value FrameProcEnc
value FrameNomDem
value Pronom
value FrameInterrogative
value FrameExclamative
value FrameAppel
value FramePhraseNominaleVE
value FramePhraseNominaleVC
value FramePhraseNominale
