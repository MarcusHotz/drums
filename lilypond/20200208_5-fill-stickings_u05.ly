%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lilypond Template für DrumTab2LilypondConverter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.11.48"
\include "deutsch.ly"
#(set-default-paper-size "a4")

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Makros
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%-------------------------------------------------------------------------------
% myMark
%-------------------------------------------------------------------------------
myMark 		= #(define-music-function (parser location markp) (string?)
				#{
  				\once \override Score . RehearsalMark #'self-alignment-X = #left 
  				\mark \markup { \normalsize \bold $markp }
				#}
			)
			
%-------------------------------------------------------------------------------
% AdLib Schrägstrich /
%-------------------------------------------------------------------------------
adlib 		= {
  \once \override Rest #'stencil =#ly:percent-repeat-item-interface::beat-slash
  \once \override Rest #'thickness = #'0.48
  \once \override Rest #'slope = #'1.7
  \once \override Rest #'staff-position = #0
  r4
}

%-------------------------------------------------------------------------------
% Flams 
%-------------------------------------------------------------------------------
flamhh 		= { \drummode { \acciaccatura {hh8} } }
flamhho 	= { \drummode { \acciaccatura {hh8} } }
flamcymc 	= { \drummode { \acciaccatura {cymc8} } }
flamcymr 	= { \drummode { \acciaccatura {cymr8} } }
flamsn 		= { \drummode { \acciaccatura {sn8} } }
flambd 		= { \drummode { \acciaccatura {bd8} } }
flamtommh 	= { \drummode { \acciaccatura {tommh8} } }
flamtomml 	= { \drummode { \acciaccatura {tomml8} } }
flamtoml 	= { \drummode { \acciaccatura {toml8} } }
flamtomfl 	= { \drummode { \acciaccatura {tomfl8} } }

%-------------------------------------------------------------------------------
% Drags
%-------------------------------------------------------------------------------
draghho 	= { \drummode { \acciaccatura {hh16[hh]} } }
draghh 		= { \drummode { \acciaccatura {hh16[hh]} } }
dragcymr 	= { \drummode { \acciaccatura {cymr16[cymr]} } }
dragcymc 	= { \drummode { \acciaccatura {cymc16[cymc]} } }
dragsn 		= { \drummode { \acciaccatura {sn16[sn]} } }
dragbd 		= { \drummode { \acciaccatura {bd16[bd]} } }
dragtommh 	= { \drummode { \acciaccatura {tommh16[tommh]} } }
dragtomml 	= { \drummode { \acciaccatura {tomml16[tomml]} } }
dragtoml 	= { \drummode { \acciaccatura {toml16[toml]} } }
dragtomfh 	= { \drummode { \acciaccatura {tomfh16[tomfh]} } }

%-------------------------------------------------------------------------------
% Comp
%-------------------------------------------------------------------------------
comp = #(define-music-function (parser location x) ( integer?)
    #{
    \override Rest #'stencil = #ly:percent-repeat-item-interface::beat-slash
    \override Rest #'thickness = #'0.48
    \override Rest #'slope = #'1.7
         
    \repeat unfold $x { r4 }
         
    \revert Rest #'stencil
    #})


\paper{
	% 1. Zeile nicht eingerückt
	indent = #0
	
	head-separation = #0.1 % deaflault 4.0
	page-top-space = #0.1 % default 6.83
	
	%#(set-global-staff-size 10)
	%between-system-padding = #0.1
	%between-system-space = #0.1
	%ragged-last-bottom = ##f
	%ragged-bottom = ##f
	%ragged-right = ##t
	%annotate-spacing = ##t

	% Seitennummer drucken
	print-page-number = false
	
	% Header
	oddHeaderMarkup = \markup \fill-line {" "}
	evenHeaderMarkup = \markup \fill-line {" "}

	% Footer
	oddFooterMarkup = \markup { \fill-line { " " } } 

	evenFooterMarkup = \markup { \fill-line { " " } }
	
	#(define page-breaking ly:page-turn-breaking)
	%#(define page-breaking ly:minimal-breaking)
}

\layout {
	\context {
		\Score
		\remove "Bar_number_engraver"
	}
}

\score {
	\context DrumStaff\with{
		\consists "Parenthesis_engraver"
	}
	<<
	\context DrumVoice = "1" {s1*1}
	\context DrumVoice = "2" {s1*1}
	\drummode 
	{ 
		\override Staff.TimeSignature # 'style = #'()

%-------------------------------------------------------------------------------
% Beginn des generierte Teil
%-------------------------------------------------------------------------------
%\tempo 4 = 1
\numericTimeSignature
\time 4/4
\repeat volta 2 {
<<
  {
	sn8->_"R" [ sn_"L" sn_"L" sn->_"R" ] sn8->_"L" [ sn->_"R" sn->_"L" sn->_"R" ]
  }
  \\
  { s1 }
>>
}
%-------------------------------------------------------------------------------
% Ende des generierten Teils
%-------------------------------------------------------------------------------
	}
	>>
}

%-------------------------------------------------------------------------------
% Ggf. Text
%-------------------------------------------------------------------------------

