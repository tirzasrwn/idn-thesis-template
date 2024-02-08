% idn_thesis_template.cls
% LaTeX class for thesis templates
% Author: tirzasrwn
% Version: 1.0

% Specify the document class and version
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{idn_thesis_template}

% Load the standard report class with specific options
\LoadClass[a4paper,12pt]{report}

% Load necessary packages
\RequirePackage[english,indonesian]{babel}
\RequirePackage{indentfirst}
\RequirePackage{setspace}
\RequirePackage[T1]{fontenc}
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[table]{xcolor}
\RequirePackage{multirow}
\RequirePackage{float}
\RequirePackage{verbatim,enumerate}
\RequirePackage{geometry}

% Set page dimensions using the geometry package
\geometry{
  top=2.5cm,
  bottom=2.5cm,
  left=2.5cm,
  right=2.5cm,
}

% Define document options
\newif\if@msthesis
\newif\if@msproposal
\DeclareOption{thesis}{\@msthesistrue\@msproposalfalse}
\DeclareOption{proposal}{\@msthesisfalse\@msproposaltrue}

\newif\if@singlesp
\newif\if@doublesp
\newif\if@onehalfsp
\DeclareOption{singlesp}{\@singlesptrue\@onehalfspfalse\@doublespfalse}
\DeclareOption{doublesp}{\@singlespfalse\@onehalfspfalse\@doublesptrue}
\DeclareOption{onehalfsp}{\@singlespfalse\@onehalfsptrue\@doublespfalse}

\newif\if@langidn
\newif\if@langeng
\DeclareOption{indonesian}{\@langidntrue\@langengfalse}
\DeclareOption{english}{\@langidnfalse\@langengtrue}

% Pass options to the underlying report class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ExecuteOptions{thesis, onehalfsp, indonesian}
\ProcessOptions\relax

% Set additional layout dimensions
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

% Set the form of page numbering
\pagestyle{myheadings}
\markright{}

% Define page numbering in the first chapter
\def\ps@chapterheading{%
	\let\@evenhead\@empty\let\@oddhead\@empty
	\def\@oddfoot{\hfil\thepage\hfil}%
	\def\@evenfoot{\hfil\thepage\hfil}
}

% Redefine chapter and sections
% Set section numbering depth to 3 (e.g., 1.2.3)
\setcounter{secnumdepth}{3}

% Redefine part and chapter numbering style
\renewcommand\thepart{\@Roman\c@part}
\renewcommand\thechapter{\@Roman\c@chapter}

% Redefine section numbering style (e.g., 1.2)
\renewcommand\thesection{\@arabic\c@chapter.\@arabic\c@section}

% Redefine subsection numbering style (e.g., 1.2.3)
\renewcommand\thesubsection{\@arabic\c@chapter.\@arabic\c@section.\@arabic\c@subsection}

% Redefine appendix numbering and format
\renewcommand\appendix{\par
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \gdef\@chapapp{\appendixname}%
    \gdef\thechapter{\@Alph\c@chapter}
}

% Redefine chapter format
\renewcommand{\chapter}{\clearpage\thispagestyle{chapterheading}%
    \global\@topnum\z@ % Prevent figures from going at the top of the page
    \@afterindenttrue % Indent the 1st paragraph
    \secdef\@chapter\@schapter
}

% Redefine chapter heading style
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
    }
}

% Redefine unnumbered chapter heading style
\renewcommand{\@makeschapterhead}[1]{%
    {\parindent \z@ \centering \normalfont
        \interlinepenalty\@M \large \bfseries #1\par\nobreak \vskip 20\p@
    }
}

% Redefine section format
\renewcommand{\section}{\@startsection{section}{1}{\z@}%
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus.2ex}%
    {\normalfont\normalsize\bfseries}
}

% Redefine subsection format
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}
}

% Redefine subsubsection format
\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
    {-3.25ex\@plus -1ex \@minus -.2ex}%
    {1.5ex \@plus .2ex}%
    {\normalfont\normalsize\bfseries}
}

% Redefine paragraph format
\renewcommand{\paragraph}{\subparagraph}

% Reset equation numbering at the beginning of each chapter
\@addtoreset{equation}{chapter}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@equation}

% Reset figure numbering at the beginning of each chapter
\renewcommand\thefigure{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@figure}

% Reset table numbering at the beginning of each chapter
\renewcommand\thetable{\ifnum \c@chapter>\z@ \@arabic\c@chapter.\fi \@arabic\c@table}

% Redefine caption names
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

% Define thesis's inputs
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

% Define Surat Perintah TA
\def\suratperintahta{%
	\clearpage
	\chapter*{\suratperintahtaname}
	\addcontentsline{toc}{chapter}{\suratperintahtaname}
}

% Nomenclature
\def\singkatan{%
	\chapter*{\nomenclaturename}
	\thispagestyle{plain}
	\addcontentsline{toc}{chapter}{\nomenclaturename}
}

% Tabularization
\newcommand{\itab}[1]{\hspace{0em}\rlap{#1}}
\newcommand{\tab}[1]{\hspace{.2\textwidth}\rlap{#1}}

% Adjust spacing and language at the beginning of the document
\AtBeginDocument{%
	\if@doublesp
		\doublespacing
	\else
		\if@singlesp
			\singlespacing
		\else
			\onehalfspacing
		\fi
	\fi
}

\AtBeginDocument{%
	\if@langidn
		\selectlanguage{indonesian}
	\else
		\selectlanguage{english}
	\fi
}

% End the class definition
\endinput

