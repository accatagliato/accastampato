%%
%% This is file `openjournal.cls',
%% a modified version of journal.cls
%% by Gianluca Pignalberi
%%
%% The original source files were:
%%
%% paper.dtx  (with options: `journal')
%% 
%% Original copyright (C) 1993, 1998 by wenzel_matiaske@notes.uni-paderborn.de
%% Copyright (C) 2004, 2005 by g.pignalberi@freesoftwaremagazine.com
%%
%% 
\def\filename{openjournal}
\def\fileversion{1.2}
\def\filedate{2005/04/01}
\def\docdate{}
\newcount\issuenumber
\newtoks\issuemonth
\newtoks\issuenote
\newcount\issueyear
\newtoks\issnnumber
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{color}
\ExecuteOptions{pdftex}
\RequirePackage{ucs}
\RequirePackage{colortbl}
\RequirePackage{times}
\RequirePackage{mathptm}
\RequirePackage{fancybox}
\RequirePackage{texlogos}
\RequirePackage{graphicx}
\RequirePackage{moreverb}
\RequirePackage{tabularx}
\RequirePackage{fix2col}
%\RequirePackage[abs]{overpic}
\RequirePackage{fancyhdr}
%\RequirePackage{upquote}
\RequirePackage{flushend}
\RequirePackage{picins}
\RequirePackage[binary]{SIunits}
\ProvidesClass{openjournal}[\filedate\space\fileversion\space%
       LaTeX document class (wm).]
\newif\if@openbib
\@openbibfalse
\if@compatibility\else
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\fi
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{openpaper}}
\ProcessOptions
\LoadClass[openjournal]{openpaper}
% Forse in fsmcolor è già definito articletype,
% in questo caso si possono personalizzare i colori
% in base ad articletype direttamente in fsmcolor.
\RequirePackage{fsmcolor}
%%-----------------------------------------------------
%%         New commands for magazine composition
%%-----------------------------------------------------
\def\andst{\unskip, }
%
% Flags to cluster the images: advertisements / rest of the world
%
\def\adsimage{ADS}
\def\paperimage{IMG}
\let\imagetype\paperimage
% 
% An equivalent of \include{}
%
\def\inputpaper#1{\input{#1}\clearpage}
%
% wrapper for the includegraphics
%
\newcommand{\fsmgraphics}[3][]{%
  \ifprinted%
    \includegraphics[#1]{#2#3}%
  \else%
    \ifsubscriber%
      \ifx\imagetype\adsimage%
        \includegraphics[#1]{#2medres_#3}%
      \else%
        \includegraphics[#1]{#2medres_#3}%
      \fi%
    \else%
      \ifelectronic%
        \includegraphics[#1]{#2lores_#3}%
      \fi
    \fi%
  \fi%
}
%
% A command to add empty page
%
\def\dummypage#1{
  \onecolumn
  \thispagestyle{empty}
  \begin{center}
  \Huge\textbf{\textsf{#1}}
  \end{center}
  \twocolumn
  \newpage
}
%
% Seconda di copertina con le informazioni di copyright
%
\def\secover#1{
  \onecolumn
  \thispagestyle{empty}
  \begin{center}
  \phantom{x}
  \vfill
  \begin{minipage}{9.4cm}
  \input{#1}
  \end{minipage}
  \end{center}
  \twocolumn
  \newpage
}
%
% Terza di copertina con qualsiasi altra cosa
%
\def\thirdcover#1{
  \onecolumn
  \thispagestyle{empty}
  \begin{center}
  \phantom{x}
  \vfill
  \begin{minipage}{9.4cm}
  \input{#1}
  \end{minipage}
  \end{center}
  \twocolumn
  \newpage
}
%
% A fsmbox command, hacked from comp.text.tex
% #1 is the box width, #2 is the border color, #3 is the background color
%
\setlength{\fboxrule}{0.9pt}    % Thickness of the boundary line around the box
%\renewcommand{\shadowsize}{2.0pt} % Thickness of shadow
\newtoks\fsmboxfgcolor
\newtoks\fsmboxbgcolor
\newenvironment{fsmbox}[3]{%
  \setlength{\fboxsep}{8.0pt} % Space between box border and inner text/image
  \fsmboxbgcolor={#3}
  \fsmboxfgcolor={#2}
  \begin{Sbox}%
    \begin{minipage}{#1}%
}{
    \end{minipage}%
  \end{Sbox}%
  \fcolorbox{\the\fsmboxfgcolor}{\the\fsmboxbgcolor}{\TheSbox}%
}
%
% Inserts a half a page advertisement image after a paper
% Unstable (it inserts immediately after, but should insert in the bottom half
% page)
%
\newcount\hordispl
\newcount\verdispl
\newdimen\wdad
\def\halfad#1#2{%#1 is the ad file name #2 is the vertical shift
  \let\imagetype\adsimage
  \thispagestyle{halfadpg}%
  \setlength\unitlength{1pt}
  \hordispl=0
  \verdispl=0
  \wdad=9.250in
\if@twocolumn
  \advance\hordispl by -\columnwidth
  \advance\hordispl by -\columnsep
  \divide\hordispl by \unitlength
  \advance\hordispl by -62

  \advance\verdispl by -\textheight
  \divide\verdispl by \unitlength
  \advance\verdispl by -#2
  \typeout{HALFAD CON DUE COLONNE: (\the\hordispl, \the\verdispl)}
\else
  %\advance\hordispl by -\textwidth
  %\advance\hordispl by -\rightmargin
  %\divide\hordispl by 2
  \divide\hordispl by \unitlength
  \advance\hordispl by -56

  %\advance\verdispl by -\textheight
  \advance\verdispl by 1
  \divide\verdispl by \unitlength
  \advance\verdispl by -#2
  \typeout{HALFAD CON UNA COLONNA: (\the\hordispl, \the\verdispl)}
\fi
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){\fsmgraphics[width=\wdad]{}{#1}}
  \end{picture}\clearpage
  \let\imagetype\paperimage
}
%
% Inserts a half a page fsmbox after a paper
% Unstable (it inserts immediately after, but should insert in the bottom half
% page)
%
\newcount\hordispl
\newcount\verdispl
\def\halfbox#1{%#1 is the ad file name
  \let\imagetype\adsimage
  \thispagestyle{halfadpg}%
  \setlength\unitlength{1pt}
  \hordispl=0
  \verdispl=0
  \advance\hordispl by -\columnwidth
  \advance\hordispl by -\columnsep
  \divide\hordispl by \unitlength
%  \advance\hordispl by -62
  \advance\verdispl by -\textheight
  \divide\verdispl by 2
  \advance\verdispl by 100
  \divide\verdispl by \unitlength
  \typeout{(\the\hordispl, \the\verdispl)}
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){
      \begin{fsmbox}{\columnwidth}{black}{red}
         \input{#1}
      \end{fsmbox}
    }
  \end{picture}\clearpage
  \let\imagetype\paperimage
}
% Inserts a full page advertisement (value optimized for 2580x3649 px)
%
\def\fullad#1{%#1 is the ad file name
  \let\imagetype\adsimage
  \clearpage\thispagestyle{empty}%
  \setlength\unitlength{1pt}
  \hordispl=-30%-62
%  \hordispl=-68 %-40%-62
  \verdispl=-\paperheight
  \divide\verdispl by \unitlength
  \advance\verdispl by 100
%  \advance\verdispl by 70 %110%50
  \wdad=8.3in %8.75in % Un A4 è largo 8.26in
%  \wdad=9.25in %8.5in%9.250in
  \typeout{(\the\hordispl, \the\verdispl)}
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){\fsmgraphics[width=\wdad]{}{#1}}
  \end{picture}\clearpage
  \let\imagetype\paperimage
}
%
% Inserts a column advertisement after a paper
% Unstable
%
\def\columnad#1{%#1 is the ad file name
  \setlength{\fboxsep}{3.0pt}
  \let\imagetype\adsimage
  \newpage\thispagestyle{coladpg}
  \setlength\unitlength{1pt}
  \hordispl=0
  \verdispl=-\paperheight
  \divide\hordispl by \unitlength
  \divide\verdispl by \unitlength
  \advance\hordispl by 8
  \advance\verdispl by 70
  \typeout{(\the\hordispl, \the\verdispl)}
  \wdad=4.375in
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){\fsmgraphics[width=\wdad]{}{#1}}
  \end{picture}\clearpage
  \let\imagetype\paperimage
}
%
% Inserts the front cover image and the shout (maybe useless)
%
\newenvironment{frontcover}[2]{%#1 is the cover path, #2 is the cover file name
% ATTENZIONE: i seguenti valori sono adeguati per un A4
  \thispagestyle{empty}%
  \let\imagetype\adsimage
  \setlength\unitlength{1pt}

  \hordispl=-40%-50%-62

  \verdispl=-\paperheight
  \divide\verdispl by \unitlength
  \advance\verdispl by 85%65

  \wdad=8.6in %9.00in %8.75in % Un A4 è largo 8.26in
  \typeout{(\the\hordispl, \the\verdispl)}
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){\fsmgraphics[width=\wdad]{#1}{#2}}
%    \put(412,-673){%
%      \begin{minipage}{5cm}
%        \centering
%	\setlength{\fboxsep}{3\p@}
%        \begin{fsmbox}{3.58cm}{InvtdText}{InvtdText}%
%	  \hfill\textsf{ISSN \the\issnnumber}\hfill
%	\end{fsmbox}\vskip-.9ex
%        \fsmgraphics[width=4.2cm]{#1}{issn_code.jpg}
%      \end{minipage}
%    }
}
{
  \end{picture}\clearpage
%  \setlength\unitlength{1pt}
%  \newcount\vertpos
%  \newcount\vert
%  \newcount\hor
%  \newcount\x
%  \newcount\y
%  \vert=0
%  \hor=0
%  \x=5\unitlength
%  \y=5\unitlength
%  \divide\x by \unitlength
%  \divide\y by \unitlength
%  \def\map{covermap}
%  \ifx#3\map
%    \typeout{Inserisco gli urli...}
%    \vertpos=5
%    \newcommand\shout[2]{%#1 is the title, #2 the subject
%    \Huge\bfseries\sffamily
%    \put(0,\vertpos){\colorbox{red}{\color{yellow}#1}}
%    \advance\vertpos by -28
%    \put(0,\vertpos){\color{blue}#2}
%    \advance\vertpos by -48
%    \let\imagetype\paperimage
%  \else
%    \typeout{Entro nei cicli...}
%    \loop
%      \advance\vert by \y
%      \hor=0
%      \loop
%        \advance\hor by \y
%\typeout{(\the\hor,\the\vert)}
%        \put(\hor,\vert){\colorbox{red}{\color{yellow}(\hor,\vert)}}
%      \ifnum\hor<\paperwidth \repeat
%    \ifnum\vert<\paperheight \repeat 
%  \fi
}
%
% The \editorial command puts the editorial on the page, putting the subsequent
% editorial board
%
\def\@special{}
\def\inside{In}
\def\outside{Out}
\def\editorial#1{%#1 is the file name
  \clearpage
  \thispagestyle{editorialpg}
  \def\@special{In}
  \let\orig@maketitle\maketitle
  \let\orig@section\section
  \def\maketitle{
    {
      \sffamily\bfseries
      \Large\textcolor{TitleFont}\@title\\
      \large\textcolor{TitleFont}\@subtitle\vskip.5em
    }
  }
  \def\section*{
    \vskip1em
    \tiny
  }
  \begin{picture}(0,0)
    \verdispl=\textheight
    \divide \verdispl by \unitlength
    \put(0,-\verdispl){
      \vbox to \textheight{
        \begin{minipage}{.75\textwidth}
          \input{#1}
          \addtocontents{jou}{
            \sffamily\bfseries{\Large\color{TitleFont}\@shorttitle}~
              \hfill\thepage
     
              {\normalfont\@articledescr \newline \newline }
          }
          \let\imagetype\adsimage
          %\hfill\fsmgraphics[width=80mm]{}{sign_tm.jpg}
          \let\imagetype\paperimage
        \end{minipage}
      }
    }
    \board
  \end{picture}
  \let\maketitle\orig@maketitle
  \let\section\orig@section
  \def\@special{Out}
  \clearpage
}
%
% Inserts the editorial board (used by \editorial)
% It can add the list of contributors (uncomment \@starttoc{aut})
%
\newcount\tmpcnt
\newdimen\tmpdim
\newdimen\tmpboardht
\newdimen\boardht
\boardht=\paperheight
\advance\boardht by .75in%bleeding
\advance\boardht by 3pt%some padding correction
\tmpdim=3.5cm%1.640cm
\def\board{
  \verdispl=\textheight
  \advance\verdispl by \tmpdim
  \divide\verdispl by \unitlength
  \put(416,-\verdispl){
    \vbox to \boardht{%
      %\begin{minipage}{5cm}
      \begin{minipage}{6cm}
        \footnotesize
	\setbox0=\vbox{%
        \input{irr_board}}
	\setbox1=\vbox{%
        %\begin{fsmbox}{5cm}{ListBackground}{ListBackground}
        \begin{fsmbox}{6cm}{ListBackground}{ListBackground}
          \begin{minipage}{4.7cm}
	  \vskip.1em
          \textsf{\textbf{\textsc{Contributors}}}
          \@starttoc{aut}
	  %\vskip.1em
	  \end{minipage}
        \end{fsmbox}}
	\setbox2=\vbox{%
        \input{irr_patrocinio}}
	\tmpcnt=0
        \loop
          \advance\tmpboardht by \ht\tmpcnt
          \advance\tmpboardht by \dp\tmpcnt
          \advance\tmpcnt by 1
        \ifnum\tmpcnt<3 \repeat
	\advance\tmpboardht by 6pt
	\tmpdim=\paperheight
	\advance\tmpdim by .75in%bleeding
	\advance\tmpdim by -\tmpboardht
	\copy0
        \vskip-2pt
	\copy1
        \vskip-1pt
        %\begin{fsmbox}{5cm}{ListBackground}{ListBackground}
        \begin{fsmbox}{6cm}{ListBackground}{ListBackground}
	  \vbox to \the\tmpdim{\hbox to 6cm{}}
	\end{fsmbox}
        \vskip-1pt
	\copy2
        \normalsize
      \end{minipage}
    }
  }
}
%
% The \review command puts the reviews on the page, putting the subsequent
% global information board
%
%\def\@special{}
%\def\inside{In}
%\def\outside{Out}
\def\review#1{%#1 is the file name
  \clearpage
  \thispagestyle{editorialpg}
  \def\@special{In}
  \let\orig@maketitle\maketitle
  \let\orig@section\section
  \def\maketitle{
    {
      \sffamily\bfseries
      \Large\textcolor{TitleFont}\@title\\
      \large\textcolor{TitleFont}\@subtitle\vskip.5em
    }
  }
  \def\section*{
    \vskip1em
    \tiny
  }
  \begin{picture}(0,0)
    \verdispl=\textheight
    \divide \verdispl by \unitlength
    \put(0,-\verdispl){
      \vbox to \textheight{
        \begin{minipage}{.75\textwidth}
          \input{#1}
          \addtocontents{jou}{
            {\sffamily\bfseries{\Large\color{TitleFont}\@title}~
              \hfill\thepage}\newline
		\ifx\@shortauthor\@empty
		\else
     		{\color{AuthorContentsColor}di~\emph{\@shortauthor}}
	          \ifx\@stars\@empty
        	    \newline
	          \else
        	    \hfill{\fsmgraphics[height=15px]{}{stellina\@stars.png}}\newline
	          \fi
		\fi
              {\normalfont\@articledescr \newline \newline }
          }
          \let\imagetype\adsimage
          %\hfill\fsmgraphics[width=80mm]{}{sign_tm.jpg}
          \let\imagetype\paperimage
        \end{minipage}
      }
    }
    \boardrev{#1_board}
  \end{picture}
  \let\maketitle\orig@maketitle
  \let\section\orig@section
  \def\@special{Out}
  \clearpage
}
%
% Inserts the reviews board (used by \review)
%
\newcount\tmpcntrev
\newdimen\tmpdimrev
\newdimen\tmpbrdhtrev
\newdimen\brdhtrev
\brdhtrev=\paperheight
\advance\brdhtrev by .75in%bleeding
\advance\brdhtrev by 3pt%some padding correction
\tmpdimrev=7.8cm%7.8cm
\def\boardrev#1{%1 è il nome del file della board per la review
  \verdispl=\textheight
  \advance\verdispl by \tmpdimrev
  \divide\verdispl by \unitlength
  \put(416,-\verdispl){
    \vbox to \brdhtrev{%
      %\begin{minipage}{5cm}
      \begin{minipage}{6cm}
        \footnotesize
	\setbox0=\vbox{%
        \input{#1}}
%	\setbox1=\vbox{%
%        \begin{fsmbox}{5cm}{ListBackground}{ListBackground}
%        \begin{fsmbox}{6cm}{ListBackground}{ListBackground}
%          \begin{minipage}{5cm}
%	  \vskip1em
%          \textsf{\textbf{\textsc{Hanno contribuito}}}
%          \@starttoc{aut}
%	  \vskip1em
%	  \end{minipage}
%        \end{fsmbox}}
%	\setbox2=\vbox{%
%        \input{irr_patrocinio}}
	\tmpcntrev=0
        \loop
          \advance\tmpbrdhtrev by \ht\tmpcntrev
          \advance\tmpbrdhtrev by \dp\tmpcntrev
          \advance\tmpcntrev by 1
        \ifnum\tmpcntrev<3 \repeat
	\advance\tmpbrdhtrev by 6pt
	\tmpdimrev=\paperheight
	\advance\tmpdimrev by .75in%bleeding
	\advance\tmpdimrev by -\tmpbrdhtrev
	\copy0
%        \vskip-2pt
%	\copy1
%        \vskip-1pt
        %\begin{fsmbox}{5cm}{ListBackground}{ListBackground}
%        \begin{fsmbox}{6cm}{ListBackground}{ListBackground}
%	  \vbox to \the\tmpdimrev{\hbox to 6cm{}}
%	\end{fsmbox}
%        \vskip-1pt
%	\copy2
        \normalsize
      \end{minipage}
    }
  }
}
%
% The \calendar command, utile per una lista di appuntamenti, con una colonna laterale
% in cui mettere i loghi dei partner delle iniziative
%
%\def\@special{}
%\def\inside{In}
%\def\outside{Out}
\def\calendar#1{%#1 is the file name
  \clearpage
  \thispagestyle{editorialpg}
  \def\@special{In}
  \let\orig@maketitle\maketitle
  \let\orig@section\section
  \def\maketitle{
    {
      \sffamily\bfseries
      \Large\textcolor{TitleFont}\@title\\
      \large\textcolor{TitleFont}\@subtitle\vskip.5em
    }
  }
  \def\section*{
    \vskip1em
    \linespread{0.8}
    %\tiny
  }
  \begin{picture}(0,0)
    \verdispl=\textheight
    \divide \verdispl by \unitlength
    \put(0,-\verdispl){
      \vbox to \textheight{
        \begin{minipage}{.75\textwidth}
          \input{#1}
%          \addtocontents{jou}{
%            \sffamily{\bfseries{\Large\color{TitleFont}\@title}~
%              \hfill\thepage}\newline
%		\ifx\@shortauthor\@empty
%		\else
%     		{\color{AuthorContentsColor}di~\emph{\@shortauthor}}
%	          \ifx\@stars\@empty
%        	    \newline
%	          \else
%        	    \hfill{\fsmgraphics[scale=0.1]{}{stellina\@stars.png}}\newline
%	          \fi
%		\fi
%              {\normalfont\@articledescr \newline \newline }
%          }
          \let\imagetype\adsimage
          %\hfill\fsmgraphics[width=80mm]{}{sign_tm.jpg}
          \let\imagetype\paperimage
        \end{minipage}
      }
    }
    \boardrev{#1_board}
  \end{picture}
  \let\maketitle\orig@maketitle
  \let\section\orig@section
  \def\@special{Out}
  \clearpage
}
%
% Includes and colors the Table of Contents
%
\def\tovtoc{
  \journalcontents
  \clearpage
}
\def\tovtocwithad{
  \journalcontents
}
% Includes a pill, i.e., a small paper (a page filler)
%
\newcount\hordispl
\newcount\verdispl
\newcount\wdpill
\newcount\wdpilltext
\def\spec{In}
\def\pill#1#2#3{%#1 is the article name #2 is the pill title #3 is the vertical offsets
  \let\orig@title\@shorttitle
  \let\orig@author\@shortauthor
  \let\orig@type\@articletype
  \let\maketitle\orig@maketitle
  \let\and\andft
  \def\maketitle{
    {\pt@font\@title\vskip.5em}
    {\pa@font\@author\vskip1em}
  }
  \setlength\unitlength{1pt}
  \hordispl=0
  \verdispl=0
  \wdpill=0
  \wdpilltext=0

  \ifx\@special\spec
	\advance\hordispl by -8
	\typeout{UNA COLONNA!}
  \else
	\advance\hordispl by -\columnwidth
	\advance\hordispl by -\columnsep
	\divide\hordispl by \unitlength
	\advance\hordispl by -8
	\typeout{DUE COLONNE!}
  \fi

  \advance\verdispl by -\textheight
  \divide\verdispl by 2
  \divide\verdispl by \unitlength
  \advance\verdispl by -#3

  \ifx\@special\spec
	\advance\wdpill by \textwidth
	%\advance\wdpill by \oddsidemargin
	\divide\wdpill by \unitlength
	\advance\wdpill by -5
	\typeout{UNA COLONNA!}
  \else
	\advance\wdpill by \columnsep
	\divide\wdpill by 2
	\advance\wdpill by \columnwidth
	\advance\wdpill by \columnwidth
	\divide\wdpill by \unitlength
	\typeout{DUE COLONNE!}
  \fi

  \advance\wdpilltext by \wdpill
  \advance\wdpilltext by -10

  \typeout{PILL ---> (H: \the\hordispl, V: \the\verdispl, W: \the\wdpill, OSM: \the\oddsidemargin, ESM: \the\evensidemargin, CW: \the\columnwidth, CS: \the\columnsep)}
  \begin{picture}(0,0)
    \put(\hordispl,\verdispl){
    \fsmboxbgcolor={ListBackground}
    \fsmboxfgcolor={black}
    \begin{minipage}{\wdpill}%
%    \begin{Sbox}%
      \begin{fsmbox}{\wdpilltext}{PillTitleBg}{PillTitleBg}%
%      \footnotesize
      \color{white}\textbf{#2}
      \end{fsmbox}
      \vskip-.2em
      \begin{fsmbox}{\wdpilltext}{PillTextBg}{PillTextBg}%
      \input{#1}
%      \addtocontents{jou}{
%        \vskip.5em
%        {\color{AuthorFont}{\sffamily\Large\pillname}}\vskip.25em
%	{\sffamily\@title\hfill\thepage\vskip0em
%        di~{\@shortauthor}}\vskip2em
%      }
%      \normalsize
      \end{fsmbox}%
%      \end{Sbox}%
%      \fcolorbox{\the\fsmboxfgcolor}{\the\fsmboxbgcolor}{\TheSbox}
      \end{minipage}%
}
  \end{picture}
  \let\@shorttitle\orig@title
  \let\@shortauthor\orig@author
  \let\@articletype\orig@type
  \let\maketitle\orig@maketitle
}
%
% header and footer stuff
%
\pagestyle{fancy}
\fancyhf{}
%\fancyhead[RO,LE]{\sffamily\bfseries\footnotesize\thepage}
\fancyhead[C]{
	\ifx\@articletype\@empty
	  \relax
	\else
	  \sffamily\bfseries\footnotesize{\color{SubjectHeadColor}\@articletype}
	\fi
}
\fancyfoot[C]{\sffamily\bfseries\footnotesize accastampato num.~\the\issuenumber,~\the\issuenote~\the\issuemonth~\the\issueyear}
\fancyfoot[RO,LE]{\sffamily\bfseries\footnotesize\thepage}
\renewcommand{\headrule}{\vskip-2pt\color{RuleColor}\hrule}
\renewcommand{\footrule}{\vbox to 0pt{\hbox to \headwidth{\color{RuleColor}\hrulefill}\vss}}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
%
% header and footer stuff for title pages and pages with half ads
%
\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\sffamily\bfseries\footnotesize accastampato num.~\the\issuenumber,~\the\issuenote~\the\issuemonth~\the\issueyear}
  \fancyfoot[RO,LE]{\sffamily\bfseries\footnotesize\thepage}
  \renewcommand{\headrule}{\relax}
}
\fancypagestyle{halfadpg}{
  \fancyfoot{}
  \renewcommand{\footrule}{\relax}
}
\fancypagestyle{coladpg}{
  \newdimen\col@space
  \advance\col@space by \columnwidth
  \advance\col@space by \columnsep
  \fancyhead{}
  \fancyfoot{}
  \fancyfoot[LE]{\sffamily\bfseries\footnotesize\thepage}
  \renewcommand{\headrule}{%
    \vskip-1em
    \hbox to \col@space{\color{RuleColor}\leaders\hrule\hfil}}
  \renewcommand{\footrule}{%
    \hbox to \col@space{\color{RuleColor}\leaders\hrule\hfil}}
}
\fancypagestyle{editorialpg}{
  \fancyfoot[RO]{}
  \renewcommand{\headrule}{%
    \vskip-1em
    \hbox to .78\textwidth{\color{RuleColor}\leaders\hrule\hfil}}
  \renewcommand{\footrule}{%
    \hbox to .78\textwidth{\color{RuleColor}\leaders\hrule\hfil}}
}
\def\incontents{}
\if@openjournal
   \let\tableofcontents\relax
   \let\smalltableofcontents\relax
   \def\journalcontents{
     \def\incontents{In}
     \articletype{\contentsname}
%      \journalpart*{\contentsname}
     \title{\color{NormalText}\Huge\bfseries\sffamily\contentsname
            \hfill\normalsize\bfseries\sffamily
            num.~\the\issuenumber, \the\issuenote~\the\issuemonth~\the\issueyear\\
	    {\color{RuleColor}\hrule}
	    \vskip-3em % Distanza tra la riga rossa superiore dell'indice e la lista degli articoli
     }
     \maketitle
     \@starttoc{jou}
     \def\incontents{Out}
   }
\else
   \newcommand\tableofcontents{%
       \let\smalltableofcontents\relax
       \section*{\contentsname
           \@mkboth{\contentsname}{\contentsname}}%
       \@starttoc{toc}%
       }
   \newcommand\smalltableofcontents{%
      \let\tableofcontents\relax
       \subsubsection*{\contentsname
           \@mkboth{\contentsname}{\contentsname}}%
       \begin{small}
       \@starttoc{toc}%
       \end{small}}
\fi

% Inserimento QR code (2d barcode) per l'url degli articoli
\newcommand{\qrcode}[1]{%
 \begin{wrapfigure}[5]%
 {r}%[overhang]%
 {.2\columnwidth}
  \vskip-13pt
  \includegraphics[width=.2\columnwidth]{#1}
 \end{wrapfigure}
}

\newcommand\editorialname{Editorial}
\newcommand\boardname{Organigramma}
\newcommand\contentsname{Contenuti}
\newcommand\listfigurename{Lista delle Immagini}
\newcommand\listtablename{Lista delle Tabelle}
%\newcommand\refname{References}
\newcommand\refname{Bibliografia}
\newcommand\bioname{About the author}
\newcommand\quotename{ECCitazioni}
\newcommand\indexname{Indice}
\newcommand\figurename{Figura}
\newcommand\tablename{Tabella}
\newcommand\textboxname{Casella di testo}
\newcommand\partname{Parte}
\newcommand\pillname{Pillola}
\newcommand\appendixname{Appendice}
\newcommand\abstractname{Sommario}
\newcommand\figureshortname{Fig.}                      % <-- paper
\newcommand\tableshortname{Tab.}                       % <-- paper
\newcommand\keywordname{Parole chiave}                 % <-- paper
\newcommand\draftname{bozza preliminare}               % <-- paper
\newcommand\today{\ifcase\month\or
  Gennaio\or Febbraio\or Marzo\or Aprile\or Maggio\or Giugno\or
  Luglio\or Agosto\or Settembre\or Ottobre\or Novembre\or Dicembre\fi
  \space\number\day, \number\year}
\setlength\columnsep{20\p@}
\setlength\columnseprule{0\p@}
%\iffinal
%  \if@openjournal
%    \ps@openjournal
%  \else
%    \ps@headings
%  \fi
%\else
%  \ps@draft
%\fi
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\endinput
%%
%% End of file `openjournal.cls'.
