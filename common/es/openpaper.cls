%%
%% This is file `openpaper.cls',
%% obtained starting from paper.cls
%%
%% The original source files were:
%%
%% paper.dtx  (with options: `paper')
%% 
%% Original copyright (C) 1993, 1998 by wenzel_matiaske@notes.uni-paderborn.de
%% Copyright (C) 2004 by g.pignalberi@freesoftwaremagazine.com
%% 
%% 
\def\filename{openpaper}
\def\fileversion{1.4}
\def\filedate{2005/03/01}
\def\docdate{}
\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{openpaper}[\filedate\space\fileversion\space%
       LaTeX document class (wm).]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\marginparwidth=0pt
\if@compatibility
  \renewcommand\@ptsize{0}
\else
   \DeclareOption{10pt}{\renewcommand\@ptsize{0}}
   \DeclareOption{11pt}{\renewcommand\@ptsize{1}}
   \DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\fi
\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\newcount\hours \newcount\minutes
\def\SetTime{\hours=\time
        \global\divide\hours by 60
        \minutes=\hours
        \multiply\minutes by 60
        \advance\minutes by-\time
        \global\multiply\minutes by-1 }
\def\now{\number\hours:\ifnum\minutes<10 0\fi\number\minutes}
\newif\iffinal \finaltrue
\DeclareOption{draft}{\setlength\overfullrule{5pt}\finalfalse \SetTime}
\newif\ifprinted %\printedtrue
\DeclareOption{printed}{\printedtrue}
\newif\ifelectronic %\electronictrue
\DeclareOption{electronic}{\electronictrue}
\newif\ifsubscriber %\subscribertrue
\DeclareOption{subscriber}{\subscribertrue}
\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}\finaltrue}
\fi
\newif\if@openjournal
\DeclareOption{openjournal}{\@openjournaltrue}
\newif\if@crosshair \@crosshairfalse
\DeclareOption{crosshair}{\@crosshairtrue}
\newif\if@itemization \@itemizationtrue
\DeclareOption{itemize}{\@itemationtrue}
\DeclareOption{noitemize}{\@itemizationfalse}
\newif\if@enumeration \@enumerationtrue
\DeclareOption{enumerate}{\@enumerationtrue}
\DeclareOption{noenumerate}{\@enumerationfalse}
\newif\if@noind \@noindfalse
\DeclareOption{indent}{\@noindfalse}
\DeclareOption{noindent}{\@noindtrue}
\newif\if@center \@centerfalse
\DeclareOption{center}{\@centertrue}
\DeclareOption{nocenter}{\@centerfalse}
\newif\if@upper      \@upperfalse
\DeclareOption{upper}{\@uppertrue}
\DeclareOption{noupper}{\@upperfalse}
\newif\if@headline  \@headlinetrue
\DeclareOption{headline}{\@headlinetrue}
\DeclareOption{noheadline}{\@headlinefalse}
\newif\if@headcount \@headcounttrue
\DeclareOption{headcount}{\@headcounttrue}
\DeclareOption{noheadcount}{\@headcountfalse}
\def\partfont#1{\def\p@font{#1}}             \def\p@font{}
\def\sectionfont#1{\def\s@font{#1}}          \def\s@font{}
\def\subsectionfont#1{\def\ss@font{#1}}      \def\ss@font{}
\def\subsubsectionfont#1{\def\sss@font{#1}}  \def\sss@font{}
\def\paragraphfont#1{\def\pg@font{#1}}       \def\pg@font{}
\def\subparagraphfont#1{\def\spg@font{#1}}   \def\spg@font{}
\def\titlefont#1{\def\t@font{#1}}            \def\t@font{}
\def\paperfont#1{\def\pj@font{#1}}           \def\pj@font{}
\def\pilltitlefont#1{\def\pt@font{#1}}       \def\pt@font{}
\def\subtitlefont#1{\def\st@font{#1}}        \def\st@font{}
\def\suptitlefont#1{\def\st@font{#1}}        \def\st@font{}
\def\papersubtitlefont#1{\def\pst@font{#1}}  \def\pst@font{}
\def\papersuptitlefont#1{\def\pst@font{#1}}  \def\pst@font{}
\def\articledescrfont#1{\def\ad@font{#1}}    \def\ad@font{}
\def\authorfont#1{\def\a@font{#1}}           \def\a@font{}
\def\pillauthorfont#1{\def\pa@font{#1}}      \def\pa@font{}
\def\institutionfont#1{\def\in@font{#1}}     \def\in@font{}
\def\theoremheaderfont#1{\def\thh@font{#1}}  \def\thh@font{}
\def\theorembodyfont#1{\def\thb@font{#1}}    \def\thb@font{}
\def\itemfont#1{\def\item@font{#1}}          \def\item@font{}
\def\examplefont#1{\def\ex@font{#1}}         \def\ex@font{}
\def\headingstextfont#1{\def\h@font{#1}}     \def\h@font{}
\def\pagenumberfont#1{\def\pn@font{#1}}      \def\pn@font{}
\def\captionheaderfont#1{\def\cph@font{#1}}  \def\cph@font{}
\def\captionbodyfont#1{\def\cpb@font{#1}}    \def\cpb@font{}
\def\figurefont#1{\def\fig@font{#1}}         \def\fig@font{}
\def\tablefont#1{\def\tab@font{#1}}          \def\tab@font{}
\def\textboxfont#1{\def\fra@font{#1}}          \def\fra@font{}
\DeclareOption{sfbold}{%
    \partfont{\Huge\sffamily\bfseries}
    \sectionfont{
                 \def\textbf##1{\begingroup\color{HeadingsBold}##1\endgroup}%
                 \color{HeadingsFont}\large\sffamily\bfseries}
    \subsectionfont{\def\textbf##1{\begingroup\color{HeadingsBold}##1\endgroup}%
                    \color{HeadingsFont}\large\sffamily}
    \subsectionfont{\def\textbf##1{\begingroup\color{HeadingsBold}##1\endgroup}%
                    \color{HeadingsFont}\sffamily}
    \paragraphfont{\color{HeadingsFont}\sffamily}
    \subparagraphfont{\color{HeadingsFont}\sffamily}
    \titlefont{\def\textbf##1{\begingroup\color{TitleBold}##1\endgroup}%
               \color{TitleFont}\tiny\sffamily\bfseries}
%.. nn ridere ... ma hai visto i denti del tipo sembra dracula
    \paperfont{
      %\fontsize{36}{\f@baselineskip}\selectfont
      \@setfontsize\normalsize{36}{36}%
      \abovedisplayskip 18\p@
      \abovedisplayshortskip \z@
      \belowdisplayshortskip \z@
      \belowdisplayskip 18\p@
      \def\textbf##1{\begingroup\color{PaperBold}##1\endgroup}%
      \color{PaperFont}\sffamily\bfseries
    }
    \papersubtitlefont{
      %\fontsize{18}{\f@baselineskip}\selectfont
      \@setfontsize\normalsize{18}{18}%
      \abovedisplayskip 9\p@
      \abovedisplayshortskip \z@
      \belowdisplayshortskip \z@
      \belowdisplayskip 9\p@
      \def\textbf##1{\begingroup\color{PaperSubtitleBold}##1\endgroup}%
      \color{PaperSubtitleFont}\sffamily\bfseries
    }
    \papersuptitlefont{
      %\fontsize{18}{\f@baselineskip}\selectfont
      \@setfontsize\normalsize{12}{12}%
      \abovedisplayskip 9\p@
      \abovedisplayshortskip \z@
      \belowdisplayshortskip \z@
      \belowdisplayskip 9\p@
      \def\textbf##1{\begingroup\color{PaperSubtitleBold}##1\endgroup}%
      \color{PaperSubtitleFont}\sffamily\bfseries
    }
    \pilltitlefont{\color{TitleFont}\large\sffamily}
    \subtitlefont{\def\textbf##1{\begingroup\color{SubtitleBold}##1\endgroup}%
                  \color{TitleFont}\Large\sffamily}
    \suptitlefont{\def\textbf##1{\begingroup\color{SubtitleBold}##1\endgroup}%
                  \color{TitleFont}\large\sffamily}
    \articledescrfont{\color{HeadingsFont}\footnotesize\sffamily\slshape}
%    \authorfont{\color{AuthorFont}\large\sffamily}
    \authorfont{\large}
%    \pillauthorfont{\color{AuthorFont}\sffamily}
    \institutionfont{\sffamily}
    \theoremheaderfont{\sffamily}
    \theorembodyfont{}
    \itemfont{\sffamily}
    \examplefont{}
    \headingstextfont{\small\sffamily}
    \pagenumberfont{\small\sffamily}
    \captionheaderfont{\sffamily}
    \captionbodyfont{\footnotesize}
    \figurefont{}
    \tablefont{}
    \textboxfont{}
}
\DeclareOption{titlepage}{\@titlepagetrue}
\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi
\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
\ExecuteOptions{letterpaper,10pt,oneside,onecolumn,final,sfbold}
\ProcessOptions
\input{size1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\if@noind
%  \setlength\parskip{0.5\baselineskip
  \setlength\parskip{0.1\baselineskip
         \@plus.1\baselineskip \@minus.1\baselineskip}
  \setlength\parindent{\z@}
  \def\noparskip{\par\vspace{-\parskip}}
\else
  \setlength\parskip{0\p@ \@plus \p@}
  \let\noparskip\relax
\fi
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}
\def\e@skip{\h@font{\phantom{y}}}
% Questa definizione di articletype era originariamenti
% alla riga 320. Forse la seconda parte va eliminata?
%\def\@articletype{}  \def\articletype#1{\gdef\@articletype{\uppercase{#1}}}
% Ora posso modificare i colori in base all'articletype.
% ATTENZIONE: Il seguente codice ha senso solo se in fsmcolor.sty
% non è definito articletype. Inoltre bisogna vedere se la definizione
% delle sezioni in fsmcolor.sty vale anche qui.
%\def\@IRR{\uppercase {Il Ricercatore Romano}}
%\def\@IRN{\uppercase {Il Resto del Neutrino}}
%\def\@NG{\uppercase {Nanos Gigantum}}
%\def\@OL{\uppercase {Onda Lunga}}
%\def\@REC{\uppercase {Recensioni}}
%\def\@ESP{\uppercase {Esperimenti}}
%\def\@EV{\uppercase {Eventi}}
%\ifx\@articletype\@IRR
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@IRN
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@NG
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@OL
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@REC
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@ESP
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\ifx\@articletype\@EV
%	\definecolor{RuleColor}{cmyk}{0,0,0,1}
%\else
%\fi\fi\fi\fi\fi\fi
% ---
\if@twoside
  \def\ps@headings{%
   \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\vbox{\hsize=\textwidth
      \hbox to \textwidth{%
        {\pn@font\thepage}\hfill{\h@font\leftmark}\e@skip\if@center\hfill\fi}
        \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
   \def\@oddhead{\vbox{\hsize=\textwidth
      \hbox to \textwidth{%
        \if@center\hfill\fi{\h@font\rightmark}\e@skip\hfill{\pn@font\thepage}}
        \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \let\@mkboth\markboth
    \def\sectionmark##1{\markboth{\ifnum \c@secnumdepth
\z@ \if@headcount \thesection \ \fi \fi ##1}{}}
    \def\subsectionmark##1{\markright{\ifnum \c@secnumdepth >\@ne
      \if@headcount \thesubsection \ \fi \fi ##1}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{\vbox{\hsize=\textwidth
       \hbox to \textwidth{%
         \if@center\hfill\fi{\h@font\rightmark}\e@skip\hfill{\pn@font\thepage}}
         \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \def\sectionmark##1{\markright {\if@headcount
      \ifnum \c@secnumdepth >\z@ \thesection \ \fi \fi ##1}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{\vbox{\hsize=\textwidth
      \hbox to \textwidth{%
     \if@center\hfill\fi{\h@font\rightmark}\e@skip\hfill{\pn@font\thepage}}
      \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \def\@evenhead{\vbox{\hsize=\textwidth
      \hbox to \textwidth{%
     {\pn@font\thepage}\hfill{\h@font\leftmark}\e@skip\if@center\hfill\fi}
     \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}
\if@openjournal
%  \def\evenrunhead#1{\gdef\@evenrunhead{#1}}    \def\@evenrunhead{}
%  \def\oddrunhead#1{\gdef\@oddrunhead{#1}}      \def\@oddrunhead{}
 \def\ps@openjournal{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@oddhead{\vbox{\hsize=\textwidth
        \hbox to \textwidth{%
        \if@center\hfill\fi{\h@font%
       \ifx\@oddrunhead\@empty\rightmark\else\@oddrunhead\fi}
        \e@skip\hfill{\pn@font\thepage}}
        \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
      \def\@evenhead{\vbox{\hsize=\textwidth
        \hbox to \textwidth{%
        {\pn@font\thepage}\e@skip\hfill{\h@font%
         \ifx\@evenrunhead\@empty\leftmark\else\@evenrunhead\fi}
        \if@center\hfill\fi}
        \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
      \let\@mkboth\@gobbletwo
      \let\sectionmark\@gobble
      \let\subsectionmark\@gobble
  }
\fi
\def\ps@draft{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{\vbox{\hsize=\textwidth
      \hbox to \textwidth{%
      {\pn@font\today\ \now\ --- {\h@font \draftname: ``\jobname''}
        \hfil\e@skip \thepage}} \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \def\@evenhead{\vbox{\hsize=\textwidth
   \hbox to \textwidth{%
       \pn@font\thepage\e@skip\hfil {\h@font \draftname: ``\jobname''} ---
       \today\ \now\ } \if@headline \vskip 1.5pt {\color{RuleColor}\hrule} \fi}}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}
\@ifundefined{option@crosshair}{}{%
  \def\clap#1{\hbox to 0pt{\hss#1\hss}} \newdimen\@crosshairrule
  \@crosshairrule=.24pt \def\@crosshairs{\vbox to
    0pt{\hsize=0pt\baselineskip=0pt\lineskip=0pt \vss \clap{\vrule
        height .125in width \@crosshairrule depth 0pt} \clap{\vrule
        width .25in height \@crosshairrule depth 0pt} \clap{\vrule
        height .125in width \@crosshairrule depth 0pt} \vss}}
 \def\ps@empty{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@oddhead{\hfill\raise\headheight\@crosshairs}
    \let\@evenhead\@oddhead}}
% Forse questa parte può essere spostata in cima al file
% in modo da usare la definizione di articletype.
\def\@subtitle{}    \def\subtitle#1{\gdef\@subtitle{#1}}
\def\@suptitle{}    \def\suptitle#1{\gdef\@suptitle{#1}}
\def\@stars{}	    \def\stars#1{\gdef\@stars{#1}}
\def\@articledescr{}    \def\articledescr#1{\gdef\@articledescr{#1}}
\def\@institution{} \def\institution#1{\gdef\@institution{#1}}
\def\@shortauthor{} \def\shortauthor#1{\gdef\@shortauthor{#1}}
\def\@shorttitle{}  \def\shorttitle#1{\let\and\andst\gdef\@shorttitle{#1}}
\def\@articletype{}  \def\articletype#1{\gdef\@articletype{\uppercase{#1}}}
% ---
\def\andft{
  \end{tabular}\hskip 1em plus.17fil
  \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
}
\if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\real@thanks\thanks
  \DeclareRobustCommand\thanks{\real@thanks}
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \if@center \begin{center} \else \begin{raggedright} \fi
     {\t@font \if@upper \uppercase\expandafter{\@title} \else
                 \@title \fi \par}%
    \vskip 3em%
     {\ifx\@subtitle\@empty\else
                  \vskip.5em \st@font \@subtitle \par \fi}
      \vskip 1.5em
     {\a@font \lineskip .75em
        \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
         \@institution \end{tabular} \par }
     {\ifx\@institution\@empty\else\vskip.5em
        \in@font\bf \lineskip .75em
        \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
         \@institution \end{tabular} \par\fi}
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \if@center \end{center} \else \end{raggedright} \fi
  \vfil\null
  \@thanks
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \let\thanks\relax\let\maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\gdef\@institution{}
  \gdef\@subtitle{}}
\else
  \newcommand\maketitle{%
  \setcounter{footnote}{0}\par
  \begingroup
    \renewcommand\thefootnote{\fnsymbol{footnote}}%
    \def\@makefnmark{\hbox to\z@{$\m@th^{\@thefnmark}$\hss}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
%      \newpage
      \global\@topnum\z@
      \@maketitle
    \fi
%    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \if@openjournal
    \typeout{Article: \@shortauthor}
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \setcounter{subparagraph}{0}%
    \setcounter{figure}{0}%
    \setcounter{table}{0}%
    \setcounter{textbox}{0}%
    \setcounter{equation}{0}%
%    \addcontentsline{jou}{titles}{%
%      {\sss@font\@shortauthor}\hfill\mbox{}\vskip\normallineskip%
%       \ifx\@shorttitle\@empty\@title\else\@shorttitle\fi}
%
%
    \ifx\incontents\inside
    \else
      \addtocontents{jou}{
%        \vfill
        \vbox{{\sffamily\bfseries{\Large\color{TitleFont}\@shorttitle}~
        \hfill\thepage}\\
        \ifx\@shortauthor\@empty
        \else
  	  {\color{AuthorContentsColor}di~\emph{\@shortauthor}}%
	  \ifx\@stars\@empty
	    \\
          \else
	    \hfill{\fsmgraphics[height=15px]{}{stellina\@stars.png}}\\
	  \fi
          {\normalfont\@articledescr}\\
        \fi
        \\
	}
      }
    \fi
%% Commands to add a list of contributors, to be ordered and uniqued
    \addtocontents{aut}{
     \ifx\@shortauthor\@empty
      \else
        \@shortauthor\\
      \fi
    }
%
%
      \if@twoside
        \ifx\@oddrunhead\@empty\ifx\@evenrunhead\@empty
        \markboth{\@shortauthor}{\@shorttitle}\else
        \markboth{}{\@shortauthor, \@shorttitle}\fi \else
        \markboth{\@shortauthor, \@shorttitle}{}\fi
      \else
        \markright{\@shortauthor, \@shorttitle}
      \fi
  \else
    \let\maketitle\relax \let\@maketitle\relax
  \fi
    \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\gdef\@institution{}
    \gdef\@subtitle{}}
% Definisce lo spazio tra il bordo superiore e il suptitle
\newlength{\beforetitlespace} \setlength{\beforetitlespace}{4em}
\newcount\hordispl
\newcount\verdispl
\newdimen\bgwidth
\bgwidth=9.0in
\def\@maketitle{%
%  \cleardoublepage
  \thispagestyle{plain}
  \null
  \let\and\andft
% Qui si definisce il sommario
  \ifx\incontents\inside
    \let\imagetype\adsimage
    \setlength\unitlength{1pt}
    \hordispl=-50
    \verdispl=-74
    \begin{picture}(0,0)
      \put(\hordispl,\verdispl){
        \fsmgraphics[width=\bgwidth]{}{ap_contents_logo.png}
      }
    \end{picture}%\clearpage
    \let\imagetype\paperimage
    \vskip 7em%
  \else
    \def\@IRR{\uppercase {Il Ricercatore Romano}}
    \def\@IRN{\uppercase {Il Resto del Neutrino}}
    \def\@AS{\uppercase {Rubriche}}
    \def\@NG{\uppercase {Le Spalle dei Giganti}}
    \def\@OL{\uppercase {Onda Lunga}}
    \def\@REC{\uppercase {Recensioni}}
    \def\@ESP{\uppercase {Esperimenti}}
    \def\@EV{\uppercase {Eventi}}
    \def\t@ue{Tr}
    \def\f@lse{Fls}
    \let\imagetype\adsimage
    \setlength\unitlength{1pt}
    \newcount\hordispl
    \newcount\verdispl
    \ifx\@articletype\@IRR
      \let\OTH\f@lse
      \hordispl=-62
      \verdispl=-60 % -202
      \begin{picture}(0,0)
        \put(\hordispl,\verdispl){
          \fsmgraphics[width=\bgwidth]{}{ap_irr_logo.png}
        }
      \end{picture}
      \definecolor{RuleColor}{cmyk}{0,0,0,1}
    \else
    \ifx\@articletype\@IRN
      \let\OTH\f@lse
      \hordispl=-62
      \verdispl=-60 % -202
      \begin{picture}(0,0)
        \put(\hordispl,\verdispl){
            \fsmgraphics[width=\bgwidth]{}{ap_irn_logo.png}
        }
      \end{picture}
    \else
    \ifx\@articletype\@AS
      \let\OTH\f@lse
      \hordispl=-62
      \verdispl=-60 % -202
      \begin{picture}(0,0)
        \put(\hordispl,\verdispl){
            \fsmgraphics[width=\bgwidth]{}{ap_as_logo.png}
        }
     \end{picture}
     \else
    \ifx\@articletype\@NG
      \let\OTH\f@lse
      \hordispl=-62
      \verdispl=-60 % -202
      \begin{picture}(0,0)
        \put(\hordispl,\verdispl){
            \fsmgraphics[width=\bgwidth]{}{ap_ng_logo.png}
        }
     \end{picture}
     \else
     \ifx\@articletype\@OL
        \let\OTH\f@lse
        \hordispl=-62
        \verdispl=-60 % -202
        \begin{picture}(0,0)
           \put(\hordispl,\verdispl){
	      \fsmgraphics[width=\bgwidth]{}{ap_ol_logo.png}
	    }
	  \end{picture}
	\else
% L'impaginazione di queste rubriche è differente e non richiede l'immagine nell'intestazione
%	  \ifx\@articletype\@REC
%            \let\OTH\f@lse
%	    \hordispl=-62
%            \verdispl=-60 % -202
%            \begin{picture}(0,0)
%              \put(\hordispl,\verdispl){
%  	        \fsmgraphics[width=\bgwidth]{}{ap_ng_logo.png}
%	      }
%	    \end{picture}
%	  \else
%	  \ifx\@articletype\@ESP
%            \let\OTH\f@lse
%	    \hordispl=-62
%            \verdispl=-60 % -202
%            \begin{picture}(0,0)
%              \put(\hordispl,\verdispl){
%  	        \fsmgraphics[width=\bgwidth]{}{ap_ng_logo.png}
%	      }
%	    \end{picture}
%	  \else
	    \ifx\@articletype\@EV
              \let\OTH\f@lse
	      \hordispl=-62
              \verdispl=-60 % -202
              \begin{picture}(0,0)
                \put(\hordispl,\verdispl){
   	          \fsmgraphics[width=\bgwidth]{}{ap_ev_logo.png}
	        }
  	      \end{picture}
	    \else
  	      \let\OTH\t@ue
	      \hordispl=-62
	      \verdispl=-60 % -202
              \begin{picture}(0,0)
                \put(\hordispl,\verdispl){
	          \fsmgraphics[width=\bgwidth]{}{fsm_fictionworld.jpg}
	        }
	      \end{picture}
	    \fi
          \fi
        \fi
       \fi
 %     \fi
    \fi
   \fi
    \vskip -2\beforetitlespace%
    \let\imagetype\paperimage
  \fi
  \ifx\incontents\inside
    \if@center \begin{center} \else \begin{raggedright} \fi
    {\p@font \if@upper \uppercase\expandafter{\@title} \else
              \@title \fi \par}%
    \vskip 1em 
    {\ifx\@subtitle\@empty\else
               \vskip.5em \pst@font \@subtitle \par \fi}
    \vskip 3em
    {\a@font \lineskip .5em
     \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
     \@author \end{tabular} \par}
    {\ifx\@institution\@empty\else\vskip.5em
     \in@font\bf \lineskip .75em
     \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
     {\color{InstitutionColor}\@institution} \end{tabular} \par\fi}
    \if@center \end{center} \else \end{raggedright} \fi
    \par \vskip 2.5em
  \else
    \ifx\OTH\f@lse
      \vbox to 160pt{ % 265pt
        \if@center \begin{center} \else \begin{raggedright} \fi
        {\ifx\@suptitle\@empty\else
                   \pst@font \@suptitle \par \fi}
	\vfil
        {\pj@font \if@upper \uppercase\expandafter{\@title} \else
                  \@title \fi \par}%
        \vfil
        {\ifx\@subtitle\@empty\else
                   \vskip.8em \pst@font \@subtitle \par \fi}
        \vfil
        \vskip.8em
        {\a@font %\lineskip .5em
         \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
         {\color{AuthorFont}\@author} \end{tabular} \par}
        {\ifx\@institution\@empty\else%\vskip.5em
         \a@font \lineskip .5em % \in@font
         \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
         {\color{InstitutionColor}(\@institution)} \end{tabular} \par\fi}
        \if@center \end{center} \else \end{raggedright} \fi
        \par \vskip 5.5em % 5.5em
      }
    \else
      \vbox to 120pt{
        \if@center \begin{center} \else \begin{raggedright} \fi
        {\pj@font \if@upper \uppercase\expandafter{\@title} \else
                  \@title \fi \par}%
%	\vskip 1em 
        \vfil
        {\a@font \lineskip .5em
         \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
         \@author \end{tabular} \par}
%        {\ifx\@institution\@empty\else\vskip.5em
%         \in@font\bf \lineskip .75em
%         \if@center\begin{tabular}[t]{c}\else\begin{tabular}[t]{@{}l@{}}\fi
%         \@institution \end{tabular} \par\fi}
        \if@center \end{center} \else \end{raggedright} \fi
        \par \vskip 2.5em % 5.5em
      }
    \fi
  \fi
}
\fi
\setcounter{secnumdepth}{3}
\newcounter {part}
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand\thepart          {\Roman{part}}
\renewcommand\thesection       {\arabic{section}}
\renewcommand\thesubsection    {\thesection.\arabic{subsection}}
\renewcommand\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\renewcommand\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\renewcommand\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
\newcommand\part{\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@part\@spart}
\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >\m@ne
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    {\parindent \z@ \if@center\centering\else\raggedright\fi
     \interlinepenalty \@M
     \reset@font
     \ifnum \c@secnumdepth >\m@ne
       \p@font \partname~\thepart.\
     \fi
     \if@upper\uppercase{#2}\else#2\fi%
     \if@openjournal\else\markboth{}{}\fi\par}%
    \nobreak
    \vskip 3ex
    \@afterheading}
\def\@spart#1{%
    {\parindent \z@
     \if@center\centering\else\raggedright\fi
     \interlinepenalty \@M
     \reset@font
     \p@font\if@upper\uppercase{#1}\else#1\fi\par}
     \nobreak
     \vskip 3ex
     \@afterheading}
\def\@endpart{\vfil\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\if@openjournal
\newcommand\journalpart{\par
   \addvspace{4ex}%
   \@afterindentfalse
   \secdef\@journalpart\@sjournalpart}
%%---------Original command-------------
%\def\@journalpart[#1]#2{}{\addcontentsline{jou}{part}{\hfill{\color{green}\sffamily#1\hfill}}}{}
%%--------------------------------------
\def\base@part{}
\def\@journalpart[#1]#2{
  \def\curr@part{#1}
  \typeout{(\base@part, \curr@part)}
  \ifx\base@part\curr@part
    \typeout{Nth paper within the same part}
    \addtocontents{jou}{\vfill}
  \else
    \typeout{1st paper within the same part}
    \addtocontents{jou}{
     %% \penalty-100
      \vfill
      \hbox{{\sffamily\bfseries\color{SubjectColor}\uppercase{#1}}}\vskip 1ex
    }
    \def\base@part{#1}
  \fi
}
%   {\parindent \z@ \if@center\centering\else\raggedright\fi
%    \interlinepenalty \@M
%    \reset@font
%    \t@font
%    \if@upper\uppercase{#2}\else#2\fi%
%    \markboth{#1}{#1}\par}%
%    \nobreak
%    \vskip 3ex
%    \@afterheading}
\def\@sjournalpart#1{{\parindent \z@
     \if@center\centering\else\raggedright\fi
     \interlinepenalty \@M
     \reset@font
     \t@font\if@upper\uppercase{#1}\else#1\fi
     \markboth{#1}{#1}\par}
     \nobreak
     \vskip 3ex
     \@afterheading}
\def\@endjournalpart{\vfil\newpage
              \if@twoside
                \hbox{}%
                \thispagestyle{empty}%
                \newpage
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\fi
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\if@center\centering\else\raggedright\fi
                                    \reset@font\s@font}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\if@center\centering\else\raggedright\fi
                                      \reset@font\ss@font}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\if@center\centering\else\raggedright\fi
                                      \reset@font\sss@font}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\reset@font\pg@font}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\reset@font\spg@font}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength\leftmargin    {\leftmargini}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\if@enumeration
  \renewcommand\theenumi{\arabic{enumi}}
  \renewcommand\theenumii{\alph{enumii}}
  \renewcommand\theenumiii{\roman{enumiii}}
  \renewcommand\theenumiv{\Alph{enumiv}}
  \newcommand\labelenumi{\theenumi.}
  \newcommand\labelenumii{(\theenumii)}
  \newcommand\labelenumiii{\theenumiii.}
  \newcommand\labelenumiv{\theenumiv.}
  \renewcommand\p@enumii{\theenumi}
  \renewcommand\p@enumiii{\theenumi(\theenumii)}
  \renewcommand\p@enumiv{\p@enumiii\theenumiii}
\else
  \renewcommand\theenumi{\arabic{enumi}}
  \renewcommand\theenumii{\arabic{enumii}}
  \renewcommand\theenumiii{\arabic{enumiii}}
  \renewcommand\theenumiv{\arabic{enumiv}}
  \newcommand\labelenumi{\theenumi.}
  \newcommand\labelenumii{\theenumi.\theenumii.}
  \newcommand\labelenumiii{\theenumi.\theenumii.\theenumiii.}
  \newcommand\labelenumiv{\theenumi.\theenumii.\theenumiii.\theenumiv.}
  \renewcommand\p@enumii{\theenumi}
  \renewcommand\p@enumiii{\theenumi(\theenumii)}
  \renewcommand\p@enumiv{\p@enumiii\theenumiii}
\fi
\if@titlepage
  \newenvironment{keywords}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \if@center\begin{center}\else\begin{raggedright}\fi%
        {\sss@font  \keywordname}
        \@endparpenalty\@M
      \if@center\end{center}\else\end{raggedright}\fi}%
     {\par\vfil\null\endtitlepage}
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \if@center\begin{center}\else\begin{raggedright}\fi%
        {\sss@font  \abstractname}
        \@endparpenalty\@M
      \if@center\end{center}\else\end{raggedright}\fi}%
     {\par\vfil\null\endtitlepage}
\else
   \if@center
    \def\abstract{%
       \if@twocolumn
         \small\subsubsection*{\abstractname}%
      \else
        \small
        \begin{center}
        {\sss@font \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center} \quotation
      \fi}
    \def\endabstract{\if@twocolumn\else\endquotation\fi}
    \def\keywords{\small\paragraph*{\keywordname:}}
    \let\endkeywords=\bigskip
   \else
     \def\abstract{\itshape\large}
     \let\endabstract=\bigskip
     \def\keywords{\small\paragraph*{\keywordname: }}
     \let\endkeywords\endabstract
  \fi
\fi
%%-----------------------------------------------------
%%         New commands for magazine composition
%%-----------------------------------------------------
%
% It inserts zoom, i.e., a small part of the article, magnifying it
%
\def\zoom#1{
  \vskip1em
  \vbox{
%  \begin{ezoom}
  \color{ZoomColor}
  \minusfill
  \begin{quote}
  \centering
  \vskip-1em
  \large\sffamily{#1}\\
  \end{quote}
  \vskip-1em
  \minusfill
%  \end{ezoom}
  \color{NormalText}
  }
  \vskip1em
}
%
% A "new" verbatim environment
%
\newenvironment{fsmverbatim}%
{\vskip1em
 \VerbatimEnvironment%
 \begin{fsmbox}{\columnwidth}{VerbBG}{VerbBG}
   \begin{scriptsize}
     \begin{Verbatim}}
{    \end{Verbatim}
   \end{scriptsize}
 \end{fsmbox}
 \vskip1em}
%
% Leaders according to Alan's style
%
\def\minusfill{\hbox to \columnwidth{\leaders\hbox to .6em{\hss-\hss}\hfill}}
%
% Hacked from IEEEtran.cls
%
\newdimen\tmpht%
\def\parstart#1#2{
  \setlength{\fboxsep}{3.0pt}
  \begingroup\def\par{\endgraf\endgroup\lineskiplimit=0pt}
  \setbox2=\hbox{#2 }
  \setbox3=\hbox{I}
  \tmpht\ht3
  \advance\tmpht by 3\baselineskip
  \font\hhuge=ptmr at \tmpht
  \setbox1=\hbox{{\hhuge #1}}
  \count7=\tmpht
  \count8=\ht1
  \divide\count8 by 1000
  \divide\count7 by\count8
  \tmpht=.001\tmpht
  \multiply\tmpht by \count7
  \font\hhuge=ptmr at .9\tmpht
  \setbox1=
     \hbox{\hhuge \color{InvtdText}\colorbox{InvtdBackground}#1\color{NormalText}}
  \noindent
  \hangindent=1.1\wd1
  \hangafter=-4
  {\hskip-\hangindent \lower1\ht1\hbox{\raise1.0\ht3\copy1}}%
  \setbox4=\hbox{ }%
  \ifdim\wd2=\wd4%
    \hskip.1\wd1%
  \else%
    \hskip.1\wd1%
    \copy2%
  \fi%
  \lineskiplimit=-1000pt%
}

\if@itemization
  \newcommand\labelitemi{$\m@th\bullet$}
  \newcommand\labelitemii{\normalfont\bfseries --}
  \newcommand\labelitemiii{$\m@th\ast$}
  \newcommand\labelitemiv{$\m@th\cdot$}
\else
  \newcommand\labelitemi{\bfseries --}
  \newcommand\labelitemii{\bfseries --}
  \newcommand\labelitemiii{\bfseries --}
  \newcommand\labelitemiv{\bfseries --}
\fi
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand\descriptionlabel[1]{\hspace\labelsep
                                \item@font #1}
\newenvironment{verse}
               {\let\\=\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item[]}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item[]}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item[]}
               {\endlist}
\def\@begintheorem#1#2{\reset@font\thb@font\trivlist
      \item[\hskip \labelsep{\reset@font\thh@font #1\ #2:}]}
\def\@opargbegintheorem#1#2#3{\reset@font\thb@font\trivlist
      \item[\hskip \labelsep{\reset@font\thh@font #1\ #2\ (#3):}]}
\def\@endtheorem{\endtrivlist}
\newlength{\exampleindent}    \setlength{\exampleindent}{\parindent}
\newenvironment{example}%
   {\begin{list}{}{%
    \setlength{\leftmargin}{\exampleindent}}
    \ex@font \item[]}
   {\end{list}}
\newenvironment{describe}[1][\quad]%
  {\begin{list}{}{%
    \renewcommand{\makelabel}[1]{{\item@font ##1}\hfil}%
    \settowidth{\labelwidth}{{\item@font #1}}%
    \setlength{\leftmargin}{\labelwidth}%
    \addtolength{\leftmargin}{\labelsep}}}%
  {\end{list}}
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \if@compatibility
        \setcounter{page}{0}
      \else
        \setcounter{page}{1}%
      \fi}%
    {\if@restonecol\twocolumn \else \newpage \fi
      \setcounter{page}{1}%
    }
  \def\review{\@ifstar{\@sreview[]}{%
    \@ifnextchar [{\@tempswatrue\@review}{\@tempswafalse\@review[]}}}
  \def\@review[#1]#2#3{\setcounter{footnote}{0}
    \vskip 3.25ex plus1ex minus.2ex \noindent
    {\sss@font #2}\\\emph{#3.}\@afterheading
    \if@openjournal
      \addcontentsline{jou}{titles}{%
        {\sss@font#2}\hfill\mbox{}\vskip\normallineskip#3
        \if@tempswa (#1)\fi}
%      \addtocontents{jou}{{\sss@font#2}\hfill\mbox{}\vskip\normallineskip#3
%      \if@tempswa (#1)\fi}
    \fi}
  \def\@sreview[#1]#2#3{\setcounter{footnote}{0}
     \vskip 3.25ex plus1ex minus.2ex \noindent
     {\sss@font #2}\\\emph{#3.} \@afterheading}
  \def\revauthor#1{\setcounter{footnote}{0}
    \def\thefootnote{\fnsymbol{footnote}}
    \gdef\@revauthor{#1}\@makerevauthor}
  \def\@makerevauthor{\hfill{\lineskip .5em
    \if@center \begin{tabular}[t]{c} \else \begin{tabular}[t]{@{}l@{}} \fi
    \@revauthor \end{tabular} \par}\@thanks\@afterheading
    \setcounter{footnote}{0}\def\thefootnote{\arabic{footnote}}
    \gdef\@thanks{}\gdef\@revauthor{}}
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\Alph{section}}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand{\theequation}{\arabic{equation}}
\def\marginlabel#1{\marginpar%
   {\if@twoside
       \ifodd\c@page
          \raggedright
       \else
          \raggedleft
       \fi
     \else
        \raggedright
     \fi #1}}
\def\attention{\mbox{}%
    \marginpar[\raggedleft\large\bf! $\rightarrow$]%
        {\raggedright\large\bf $\leftarrow$ !}}
\def\seealso#1{\mbox{}%
    \marginpar[\raggedleft$\rightarrow$ \small #1]%
        {\raggedright\small  #1 $\leftarrow$}\ignorespaces}
%\newenvironment{ezoom}
%               {\fig@font\@float{zoom}}
%               {\end@float}
\newcounter{textbox}
\renewcommand\thetextbox{\@arabic\c@textbox}
\def\whichbox
\def\normal{N}
\def\starred{S}
\def\fps@textbox{tbp}
\def\ftype@textbox{1}
\def\ext@textbox{lox}
\def\fnum@textbox{\textboxname~\thetextbox}
\newenvironment{textbox}
               {
                 \let\whichbox\normal
                 \fra@font\@float{textbox}
               }
               {\end@float}
\newenvironment{textbox*}
               {
                 \let\whichbox\starred
                 \fra@font\@dblfloat{textbox}
               }
               {\end@dblfloat}
\def\boxedtext{
	        \ifx\whichbox\normal
		  \begin{fsmbox}{.93\columnwidth}{BoxRule}{ListBackground}
	        \else
		  \begin{fsmbox}{.967\textwidth}{BoxRule}{ListBackground}
	        \fi
	      }
\def\endboxedtext{
		   \end{fsmbox}
                 }
\newcounter{figure}
\renewcommand\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figureshortname~\thefigure}
\newenvironment{figure}
               {\fig@font\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\fig@font\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tableshortname~\thetable}
\newenvironment{table}
               {\tab@font\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\tab@font\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{10\p@}
\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{%{\cph@font #1:} 
   {\cpb@font #2}}%
 \ifdim \wd\@tempboxa >\hsize
    \@hangfrom{}%\cph@font #1: }
      {\cpb@font #2\par}%
 \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
 \fi
 \vskip\belowcaptionskip}
\def\rb#1{\raisebox{1.5ex}[-1.5ex]{#1}}
\def\tablerule{\noalign{\ifnum0=`}\fi
   \hrule \@height \arrayrulewidth \vskip\doublerulesep
   \futurelet \@tempa\@xhline}
\def\thicktablerule{\noalign{\ifnum0=`}\fi
   \hrule \@height 2\arrayrulewidth \vskip\doublerulesep
   \futurelet \@tempa\@xhline}
\def\doubletablerule{\noalign{\ifnum0=`}\fi
   \hrule \@height \arrayrulewidth \vskip2\arrayrulewidth
   \hrule \@height \arrayrulewidth \vskip\doublerulesep
   \futurelet \@tempa\@xhline}
\def\thickhline{\noalign{\ifnum0=`}\fi
   \hrule \@height 2\arrayrulewidth\futurelet \@tempa\@xhline}
\def\doublehline{\noalign{\ifnum0=`}\fi
   \hrule \@height \arrayrulewidth\vskip2\arrayrulewidth
   \hrule \@height \arrayrulewidth \futurelet \@tempa\@xhline}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch{\relax}{\mathcal}}
\DeclareRobustCommand*{\mit}{\@fontswitch{\relax}{\mathnormal}}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg {2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{3}
\newcommand\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{\@secpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
      \setlength\@tempdima{3em}%
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       {\sss@font#1}\hfil \hbox to\@pnumwidth{\hss #2}}\par
       \nobreak
       \if@compatibility
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}
      \fi
    \endgroup
  \fi}
\if@openjournal
  \newcommand\l@titles[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode #1%
      \nobreak\leaders\hbox{%
          $\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}\hfill
      \nobreak \hbox to\@pnumwidth{\hfil\rm #2}\par
      \penalty\@highpenalty
    \endgroup}
\fi
\newcommand\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\l@subsection   {\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand\l@paragraph    {\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand\l@subparagraph {\@dottedtocline{5}{10em}{5em}}
\if@openjournal
  \let\listoffigures\relax
  \let\smalllistoffigures\relax
  \let\listoftables\relax
  \let\smalllistoftables\relax
\else
  \newcommand\listoffigures{%
      \let\smalllistoffigures\relax
      \section*{\listfigurename
        \@mkboth{\listfigurename}{\listfigurename}}%
      \@starttoc{lof}%
      }
      \let\listoffigures\relax
      \subsubsection*{\listfigurename
        \@mkboth{\listfigurename}{\listfigurename}}%
      \begin{small}
      \@starttoc{lof}%
      \end{small}
      }
  \newcommand\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
  \newcommand\listoftables{%
      \let\smalllistoftables\relax
      \section*{\listtablename
        \@mkboth{\listtablename}{\listtablename}}%
    \@starttoc{lot}%
    }
  \newcommand\smalllistoftables{%
      \let\listoftables\relax
      \subsubsection*{\listtablename
        \@mkboth{\listtablename}{\listtablename}}%
      \begin{small}
      \@starttoc{lot}%
      \end{small}
    }
  \let\l@table\l@figure\l@textbox
\fi
\newenvironment{thebiography}[1]
{
  \ifx\@special\inside
% No box when in the Editorial
    \color{InvtdText}% text of "no" color
  \else
    \bigskip
    \begin{minipage}{\columnwidth}
    \setbox1=\hbox{\large\sffamily\bfseries\bioname}
    \setbox2=\vbox{\begin{fsmbox}{\wd1}{BioBackground}{BioBackground}
      \large\sffamily\bfseries\color{InvtdText}\bioname
    \end{fsmbox}}
    \copy2
    %\setbox3=\hbox to \columnwidth{{\color{BioBackground}\rule{\columnwidth}{2pt}}}
    %\vskip-9pt
    %{\color{BioBackground}\rule{\columnwidth}{2pt}}
    %\copy3
    \color{NormalText}
    %\vskip-15pt%
    \vskip-1pt%
      \begin{fsmbox}{.93\columnwidth}{BiographyBg}{BiographyBg}%
	\ifx\relax#1\relax
	\else
		\begin{wrapfigure}[4]%
		{r}%[overhang]%
		{.14\columnwidth}
		  \vskip-12pt
		  \includegraphics[width=0.14\columnwidth]{#1}
		\end{wrapfigure}
	\fi
  \fi
}
{
  \ifx\@special\inside
% No box when in the editorial
    \color{NormalText}
  \else
      \end{fsmbox}%
    \end{minipage}%
  \fi%
}
\newdimen\bibindent
\setlength\bibindent{1.5em}
%
%
% Ambiente per le citazioni in chiusura di articolo
% Vanno impostati i colori corretti
\newenvironment{quotingbox}[1]{
  \vfill
  \begin{minipage}{\columnwidth}
  \color{RuleColor}\hrule
  \vskip5pt%
  \setbox1=\hbox{\large\sffamily\bfseries \quotename{} di}
  \setbox2=\vbox{\centering\begin{fsmbox}{\wd1}{QuoteTitleBg}{QuoteTitleBg}
    \centering\large\sffamily\bfseries\color{InvtdText} \quotename{} di \\ {#1}
  \end{fsmbox}}
  \copy2
  \color{NormalText}
  \vskip-1pt%
    \begin{fsmbox}{.93\columnwidth}{QuoteTextBg}{QuoteTextBg}%
%      \centering
%      \ruggedright\textbf{#1}\\
}
{
    \end{fsmbox}%
  \end{minipage}%
}
%
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\refname}{\refname}}%
      \list{}%\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            %\leftmargin\labelwidth
            \leftmargin\z@
            %\advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\if@openjournal
  \def\@mainbblfile{\jobname.bbl}
  \let\@bblfile=\@mainbblfile
  \def\bibliography#1{%
    \if@filesw\immediate\write\@auxout{\string\bibdata{#1}}\fi
    \@input{\@bblfile}}
  \def\@include#1 {\clearpage
    \if@filesw \immediate\write\@mainaux{\string\@input{#1.aux}}\fi
    \@tempswatrue
    \if@partsw \@tempswafalse\edef\@tempb{#1}
       \@for\@tempa:=\@partlist\do{\ifx\@tempa\@tempb\@tempswatrue\fi}
    \fi
    \if@tempswa
       \if@filesw \let\@auxout=\@partaux
           \immediate\openout\@partaux #1.aux
           \immediate\write\@partaux{\relax}
       \fi
       \def\@bblfile{#1.bbl}\@input{#1.tex}
       \let\@bblfile\@mainbblfile\clearpage
       \@writeckpt{#1}
       \if@filesw
          \immediate\closeout\@partaux
       \fi
       \let\@auxout=\@mainaux\else\@nameuse{cp@#1}
   \fi}
\fi
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\section*{\indexname}]%
                \@mkboth{\indexname}%
                        {\indexname}%
                \thispagestyle{empty}\parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem  {\par\hangindent 40\p@}
\newcommand\subitem   {\par\hangindent 40\p@ \hspace*{20\p@}}
\newcommand\subsubitem{\par\hangindent 40\p@ \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\if@noind
  \long\def\@makefntext#1{%
        \leftskip 2.0em%
        \noindent
        \hbox to 0em{\hss\@makefnmark\kern 0.25em}#1}
\else
  \long\def\@makefntext#1{%
      \parindent 1em%
      \noindent
      \hbox to 1.8em{\hss\@makefnmark\kern 0.25em}#1}
\fi
\endinput
%%
%% End of file `openpaper.cls'.

