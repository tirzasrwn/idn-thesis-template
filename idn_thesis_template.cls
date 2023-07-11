\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idn_thesis_template}

\RequirePackage[english,indonesian]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx,latexsym}
\usepackage{booktabs}
\usepackage[table]{xcolor}
\usepackage{multirow}
\usepackage{float}
\usepackage{indentfirst}
\usepackage[pass]{geometry}
\usepackage{verbatim,enumerate}

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}

\newif\if@msthesis
\newif\if@msproposal
\DeclareOption{laporantugasakhir}{\@msthesistrue\@msproposalfalse}
\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\DeclareOption{satuspasi}{\@singlesptrue\@doublespfalse}
\DeclareOption{duaspasi}{\@singlespfalse\@doublesptrue}
\newif\if@onehalfsp
\@onehalfspfalse
\DeclareOption{satusetengahspasi}{\@onehalfsptrue}

\newif\if@langidn
\newif\if@langeng
\DeclareOption{indonesian}{\@langidntrue\@langengfalse}
\DeclareOption{english}{\@langidnfalse\@langengtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{dtedita,satusetengahspasi,indonesian}
\ProcessOptions
\LoadClass[a4paper,12pt]{report}

%------------------------------------------------------------
%Layout
%------------------------------------------------------------
\setlength{\topmargin}{-0.9cm}
\setlength{\headheight}{12pt}
\setlength{\headsep}{2.3cm}
\setlength{\topskip}{1ex}
\setlength{\oddsidemargin}{1.46cm}
\setlength{\evensidemargin}{1.46cm}
\setlength{\textwidth}{14.3cm}
\setlength{\textheight}{22cm}
\setlength{\footskip}{1.5cm}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}

\setlength{\parindent}{3em}

%------------------------------------------------------------
%The form of page numbering
%------------------------------------------------------------
\pagestyle{myheadings}
\markright{}

%------------------------------------------------------------
%Define page numbering in the first chapter
%------------------------------------------------------------
\def\ps@chapterheading{%
	\let\@evenhead\@empty\let\@oddhead\@empty
	\def\@oddfoot{\hfil\thepage\hfil}%
	\def\@evenfoot{\hfil\thepage\hfil}
}

%------------------------------------------------------------
%Redefine chapter and sections
%------------------------------------------------------------
\setcounter{secnumdepth}{3}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@Roman\c@chapter}
%\renewcommand \thesection {\@arabic\c@section.}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
%\renewcommand\thesubsection {\@alph\c@subsection.}
\renewcommand\thesubsection {\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}
%\renewcommand\thesubsubsection{\@roman\c@subsubsection.}
%\renewcommand\thesubsubsection{}
\renewcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\gdef\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}}
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
	\global\@topnum\z@ %Prevents figures from going at top of page
	\@afterindenttrue %Indent the 1st paragraph
	\secdef\@chapter\@schapter}
\renewcommand{\@makechapterhead}[1]{%
	{\parindent \z@ \centering \normalfont
			\ifnum \c@secnumdepth >\m@ne
				\large\bfseries \@chapapp\space \thechapter
				\par\nobreak
				\vskip 5\p@
			\fi
			\interlinepenalty\@M
			\large \bfseries #1\par\nobreak
			\vskip 20\p@
		}}
\renewcommand{\@makeschapterhead}[1]{%
	{\parindent \z@ \centering \normalfont
			\interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@ }}
%\renewcommand{\section}{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\normalfont\normalsize\bfseries\centering}}
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
%\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\parindent}%
%                                    {3.25ex \@plus1ex \@minus.2ex}%
%                                    {-1em}%
%                                    {\normalfont\normalsize\bfseries}}
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
	%                                    {3.25ex \@plus1ex \@minus.2ex}%
	%                                    {-1em}%
	%                                    {\normalfont\normalsize\bfseries}}
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand{\paragraph}{\subparagraph}

\@addtoreset {equation}{chapter}
\renewcommand\theequation
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}
\renewcommand \thetable
{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}
%------------------------------------------------------------
%Redefine caption names
%------------------------------------------------------------
\def\captionsindonesian{%
	\def\prefacename{KATA PENGANTAR}%
	\def\contentsname{DAFTAR ISI}%
	\def\listfigurename{DAFTAR GAMBAR}%
	\def\listtablename{DAFTAR TABEL}%
	\def\listappendixname{DAFTAR LAMPIRAN}%
	\def\nomenclaturename{DAFTAR SINGKATAN}%
	\def\abstractname{Intisari}%
	\def\acknowledgmentname{HALAMAN PERSEMBAHAN}%
	\def\approvalname{HALAMAN PENGESAHAN}
	\def\partname{BAGIAN}%
	\def\chaptername{BAB}%
	\def\appendixname{LAMPIRAN}%
	\def\refname{DAFTAR PUSTAKA}%
	\def\bibname{DAFTAR PUSTAKA}%
	\def\indexname{Indek}
	\def\figurename{Gambar}
	\def\tablename{Tabel}
	\def\pagename{Halaman}
	\def\suratperintahtaname{SURAT PERINTAH TA}
}

%------------------------------------------------------------]
%Define thesis's inputs
%------------------------------------------------------------
\newcommand{\booktitle}[1]{\gdef\@booktitle{#1}}
\newcommand{\degree}[1]{\gdef\@degree{#1}}
\newcommand{\major}[1]{\gdef\@major{#1}}
\newcommand{\titlename}[1]{\gdef\@titlename{#1}}
\newcommand{\dept}[1]{\gdef\@dept{#1}}
\newcommand{\faculty}[1]{\gdef\@faculty{#1}}
\newcommand{\university}[1]{\gdef\@university{#1}}
\newcommand{\city}[1]{\gdef\@city{#1}}

\newcommand{\titleidn}[1]{\gdef\@titleidn{#1}}
\newcommand{\fullname}[1]{\gdef\@fullname{#1}}
\newcommand{\nim}[1]{\gdef\@nim{#1}}

\newcommand{\examdate}[1]{\gdef\@examdate{#1}}
\newcommand{\approvaldate}[1]{\gdef\@approvaldate{#1}}
\newcommand{\yearsubmit}[1]{\gdef\@yearsubmit{#1}}

\newcommand{\headprogram}[1]{\gdef\@headprogram{#1}}
\newcommand{\firstsupervisor}[1]{\gdef\@firstsupervisor{#1}}
\newcommand{\secondsupervisor}[1]{\gdef\@secondsupervisor{#1}}
\newcommand{\firstnip}[1]{\gdef\@firstnip{#1}}
\newcommand{\secondnip}[1]{\gdef\@secondnip{#1}}
\newcommand{\headnip}[1]{\gdef\@headnip{#1}}

%------------------------------------------------------------
%Define Surat Perintah TA
%------------------------------------------------------------
\def\suratperintahta{%
	\clearpage%\thispagestyle{chapterheading}
	\chapter*{\suratperintahtaname}
	%\includepdf[pages=-]{pdf/suratperintah.pdf}
	\addcontentsline{toc}{chapter}{\suratperintahtaname}
}



%------------------------------------------------------------
%Nomenclature
%------------------------------------------------------------
\def\singkatan{%
	\chapter*{\nomenclaturename}%
	\thispagestyle{plain}
	%\chapter*{\nomenclaturename}%
	%\printglossary
	\addcontentsline{toc}{chapter}{\nomenclaturename}
}

%Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}


\AtBeginDocument{%
	\if@doublesp%
		\doublespacing%
	\else\if@singlesp%
			\singlespacing%
		\else
			\onehalfspacing%
		\fi%
	\fi
}

\AtBeginDocument{%
	\if@langidn
		\selectlanguage{indonesian}%
	\else
		\selectlanguage{english}%
	\fi
}

\endinput
