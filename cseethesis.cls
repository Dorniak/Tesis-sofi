%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Editar tablas: https://www.tablesgenerator.com/#

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ******************************************************
% Identification
% ******************************************************
\def\classversion{3.1}
\def\classdate{September 1, 2010}

\typeout{Document class version: \classversion}
\typeout{Last modified: \classdate}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cseethesis}

\RequirePackage[version=4]{mhchem}

% ******************************************************
% Declare Options
% ******************************************************
% Do not know how to handle other options and therefore
% just pass them on to 'book'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{a4}}

% ******************************************************
% Process Options
% ******************************************************
\ProcessOptions*

% ******************************************************
% Load Used Packages and Classes
% ******************************************************
\LoadClass{book}

\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{ifthen}
\RequirePackage[spanish]{babel}
\RequirePackage{titletoc}
\RequirePackage{hyperref}
\RequirePackage[table,xcdraw,svgnames]{xcolor}
\hypersetup{
    colorlinks=true,
    linkcolor=Purple,
    filecolor=Purple,      
    urlcolor=Purple,
    citecolor=Purple,
    pdftitle={\@title},
    pdfpagemode=FullScreen,
    }
\RequirePackage{enumitem}
\RequirePackage{subcaption}
\RequirePackage{changepage}
\RequirePackage{setspace}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\newcolumntype{C}{%
    >{\centering\arraybackslash}X%
    }
\RequirePackage{geometry}
\RequirePackage{amsmath}
 
%tablas
\usepackage{multirow}
\usepackage{datetime2}
\usepackage{diagbox}

\usepackage{tocloft}
\usepackage{acronym}
\usepackage{float}

\usepackage{pdfpages}

% ******************************************************
% Start defining and redefining old book style stuff
% ******************************************************

\setlength{\topmargin}{0in}
\setlength{\textwidth}{6.25in}
\setlength{\textheight}{8.75in}
\setlength{\evensidemargin}{-4.5mm}
\setlength{\oddsidemargin}{5.5mm}
\setcounter{tocdepth}{1}
\setcounter{topnumber}{2}
\setcounter{totalnumber}{3}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\arabic{chapter}.\arabic{section}.
                              \arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{chapter}.\arabic{section}.
                                 \arabic{subsection}.\arabic{subsubsection}}
\renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\topfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.75}
\renewcommand{\jot}{.6\baselineskip}
\setlength{\intextsep}{24pt}
\setlength{\headheight}{15pt}

\newcommand{\ischapter}{1} % 1=chapters, 0=papers (used in contents page generation)

%----------------------------------------------
% Make chapter headings look nice
%----------------------------------------------
\def\@chapter[#1]#2{
	 \refstepcounter{chapter}
    {\ifthenelse{\equal{\ischapter}{1}}
       {
	          \addcontentsline{toc}{chapter}{{\sc\chaptername}\space%
                \textnormal{\thechapter\space--} \sc #1}%
       }
       {
           \addcontentsline{toc}{chapter}{{\sc\chaptername}\space%
                \textnormal{\thechapter} \sc #1}%
       }
    }
	 \chaptermark{#1}
    \@makechapterhead{#2}%
    \@afterheading%                % No indendation of first row after heading
}

\def\@makechapterhead#1{%
  {\parindent \z@ \raggedleft
    \reset@font
    \vspace*{2cm}
    \hrule
    \vspace*{8\p@}%
    \par
    \Large {\Huge{\sc\@chapapp{}}\textnormal{\space\thechapter}}
    \par\nobreak
    \vspace*{8\p@}%
    \par
    \vspace*{1\p@}%
    \hrule
    \vspace*{8\p@}
    \parbox{15.5cm}
     {
       \begin{flushright}
          \Huge \textnormal{#1}\par\nobreak
       \end{flushright}
     }
    \vskip 50\p@
  }
}

% ------------------------------------------
% Make figure captions \it and \small and \centering
% ------------------------------------------
\long\def\@makecaption#1#2{
  \vskip\abovecaptionskip
  \sbox\@tempboxa{\small{\it{#1: #2}}}
  \centering\ifdim \wd\@tempboxa >\hsize
    \small{\it{#1: #2\par}}
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}
  \fi
  \vskip\belowcaptionskip}
\addto\captionsspanish{\renewcommand{\figurename}{Figura}}
\addto\captionsspanish{\renewcommand{\tablename}{Tabla}}
\addto\captionsspanish{\renewcommand{\listtablename}{Índice de tablas}}
\addto\captionsspanish{\renewcommand{\glossaryname}{Glosario}}
\addto\captionsspanish{\renewcommand{\acronymname}{Acrónimos}}



% ------------------------------------------
% The \startpreamble command.
% Generates all the stuff before the first
% "real" chapter starts, like Abstract,
% Title page, TOC, etc..
% ------------------------------------------
\newcommand{\startpreamble}[9] %Ese 9 son los preambulos totales que se contemplan
{
  \pagestyle{plain}
  \thispagestyle{empty}
  %--- Make title page
  %Portada
  \pagenumbering{gobble}
  \input{include/portada/portada}
  \cleardoublepage
  %Portada BN
  \input{include/portada/portada_bn}
  \cleardoublepage
  %--- Make page with the \dedication string
  \setcounter{page}{1}
  \thispagestyle{plain}
  \vspace*{6cm} \hfill{\emph{#5}}
  %--- Include preface
  \pagenumbering{roman}
  \setcounter{secnumdepth}{-2}
  \chapter*{\hrule\medskip\hfill \sc Agradecimientos \medskip\hrule}
  \setcounter{secnumdepth}{2}
  \noindent #6 %Ese #6 es el orden de cada bloque, por eso el siguiente es 7
  \cleardoublepage
  %--- Make page with the \myquote string
  \thispagestyle{plain}
  \vspace*{6cm} \hfill{{#7}}
  %--- Make abstract page
  \setcounter{secnumdepth}{-2}
  \chapter*{\hrule\medskip\hfill \sc Resumen\medskip\hrule}
  \setcounter{secnumdepth}{2}
  \noindent #8
  \cleardoublepage

  \setcounter{secnumdepth}{-2}
  \chapter*{\hrule\medskip\hfill \sc Abstract\medskip\hrule}
  \setcounter{secnumdepth}{2}
  \noindent #9
  \cleardoublepage

  %--- Make Table of Contents
  \renewcommand{\contentsname}{\hrule\vspace*{8pt}\Huge{\hfill{\sc
                Índice general}\vspace*{8pt}\hrule\vspace*{-1cm} }}

  \setcounter{tocdepth}{3} % Mostrar secciones y subsecciones en el índice
 
  \titlecontents{chapter}[0.7cm]
    {\vspace{0.3cm}}
    {\contentslabel{1.7cm}}
    {\hspace{-0.7cm}}
    {\hfill\contentspage}
 
   \tableofcontents
   \cleardoublepage

   %--- Make List of Figure
    \renewcommand{\listfigurename}{\hrule\vspace*{8pt}\Huge{\hfill{\sc
                Índice de figuras}\vspace*{8pt}\hrule\vspace*{-1cm} }}
  
    \titlecontents{chapter}[0.7cm]
     {\vspace{0.3cm}}
     {\contentslabel{1.7cm}}
     {\hspace{-0.7cm}}
     {\hfill\contentspage}
    
     
    \listoffigures		% Índice de figuras
    \cleardoublepage

     %--- Make List of Tables
    \renewcommand{\listtablename}{\hrule\vspace*{8pt}\Huge{\hfill{\sc
                Índice de tablas}\vspace*{8pt}\hrule\vspace*{-1cm} }}
  
    \titlecontents{chapter}[0.7cm]
     {\vspace{0.3cm}}
     {\contentslabel{1.7cm}}
     {\hspace{-0.7cm}}
     {\hfill\contentspage}
    
     
    \listoftables % Índice de figuras
    \cleardoublepage

}

% ------------------------------------------
% Make \startchapters command
% ------------------------------------------
\newcommand{\startchapters}
{
 \cleardoublepage
 \renewcommand{\chaptername}{Capítulo}
 \renewcommand{\ischapter}{1}
 \pagestyle{fancy}
 \fancyhf{}
 \fancyhead[RE]{}
 \fancyhead[LO]{}
 \fancyhead[LE]{\thepage} 
 \fancyhead[RO]{\thepage}
}

% ------------------------------------------
% Make \startbib command
% ------------------------------------------
\newcommand{\startbib}
 {
  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}

  %\setcounter{secnumdepth}{3}
   
  \renewcommand{\chaptername}{Referencias}
  \renewcommand{\thechapter}{\textnormal{\Alph{chapter}}}
  \def\bibname{{\hrule\medskip\hfill \sc Referencias \medskip\hrule}}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[RE]{}
  \fancyhead[LO]{}
  \fancyhead[LE]{\thepage} 
  \fancyhead[RO]{\thepage}
  \addcontentsline{toc}{chapter}{\sc Referencias}
}

% ------------------------------------------
% Make \startpapers command
% ------------------------------------------
\newcommand{\startpapers}
 {
  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}

  %\setcounter{secnumdepth}{3}
  \renewcommand{\thesection}{\arabic{section}}
  \renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}}
  \renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.
                                   \arabic{subsubsection}}
  \renewcommand{\theequation}{\arabic{equation}}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
  \renewcommand{\chaptername}{Anexo}
  \renewcommand{\thechapter}{\textnormal{\Alph{chapter}}}
  \setcounter{chapter}{0}
  \def\bibname{Referencias}
  \renewcommand{\ischapter}{0}
  \pagestyle{fancy}
  \fancyhf{}
  \fancyhead[RE]{}
  \fancyhead[LO]{}
  \fancyhead[LE]{\thepage} 
  \fancyhead[RO]{\thepage}
}

% % ------------------------------------------
% % Make new part page
% % ------------------------------------------
% \newcommand{\makepartpage}[1]{%
%  \cleardoublepage
%  \thispagestyle{plain}
%  \vspace*{7cm}
%  {\Huge\hfill #1}
%  \addcontentsline{toc}{part}{#1}
%  \pagestyle{fancy}
%  \fancyhf{}
%  \fancyhead[RE]{}
%  \fancyhead[LO]{}
%  \fancyhead[LE]{\thepage} 
%  \fancyhead[RO]{\thepage}
%  \cleardoublepage
% }

% ------------------------------------------
% \makechapter command
% ------------------------------------------
\newcommand{\makechapter}[4][]
{
   % First argument is an abbreviated version
   % of the chapter name, used as page header
   % Second argument is the chapter name as it occurs in the TOC. 
   % The third argument is what is actually printed on the first page
   % of the chapter.

  % ------------------------------------------
  % Adjust section headings
  % ------------------------------------------
  \renewcommand\section{\@startsection {section}{1}{-1pt}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\Large\bfseries}}

  \renewcommand\subsection{\@startsection{subsection}{2}{-6pt}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\bfseries}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\bfseries}}


   \renewcommand{\thechapter}{\arabic{chapter}}
   \renewcommand{\thesection}{\arabic{chapter}.\arabic{section}} 
   \renewcommand{\thesubsection}{
                 \arabic{chapter}.\arabic{section}.\arabic{subsection}}
   \renewcommand{\theequation}{\arabic{chapter}.\arabic{equation}}
   \renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
   \renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

   \cleardoublepage
   \thispagestyle{plain}
   \chapter[#3]{#4}
   
   \vspace*{-2\baselineskip}
   \hfill\parbox[t]{.6\textwidth}{%
      \begin{flushright}
		   \textit{#1}
      \end{flushright}
   }

   \fancyhf{}
   \fancyhead[RE]{\sc{\nouppercase{#2}}}
   \fancyhead[LO]{\sc{\nouppercase{\rightmark}}}
   \fancyhead[LE]{\thepage} 
   \fancyhead[RO]{\thepage}
}

% ------------------------------------------

%Citar a lo APA, que no APAricio
% \DeclareLanguageMapping{american}{american-apa}
\RequirePackage{csquotes}
\usepackage{hyperref}
\RequirePackage[style=apa,backend=biber]{biblatex}
\DefineBibliographyStrings{spanish}{%
  andothers = {et al.,}
}
%con textcite el año se pone entre parentesis, con cite  sale todo junto

% % ------------------------------------------
% % \appendix command
% % ------------------------------------------
% \renewcommand{\appendix}%
% {
%   \cleardoublepage%
%   \setcounter{section}{0} 
%   % ------------------------------------------
%   % Adjust section headings
%   % ------------------------------------------
%   \renewcommand\section{\@startsection {section}{1}{-1pt}%
%                                    {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                    {2.3ex \@plus.2ex}%
%                                    {\Large\bfseries}}

%   \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
%                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                      {1.5ex \@plus .2ex}%
%                                      {\large\bfseries}}
%   \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
%                                      {-3.25ex\@plus -1ex \@minus -.2ex}%
%                                      {1.5ex \@plus .2ex}%
%                                      {\normalsize\bfseries}}
%   \renewcommand{\thesection}{\arabic{chapter}\Alph{section}}%
%   \renewcommand{\thesubsection}{%
%                 \arabic{chapter}\Alph{section}.\arabic{subsection}}%
%   \renewcommand{\theequation}{\arabic{chapter}\Alph{section}.\arabic{equation}}
% }

% % ------------------------------------------
% % \paperappendix command
% % ------------------------------------------
% \newcommand{\paperappendix}%
% {
%   \setcounter{section}{0}%
%   \renewcommand{\thesection}{\Alph{section}}%
%   \renewcommand{\thesubsection}{\Alph{section}.\arabic{subsection}}%
%   \renewcommand{\thesubsubsection}{%
%                 \Alph{section}.\arabic{subsection}.\arabic{\thesubsubsection}}%
%   \renewcommand{\theequation}{\Alph{section}.\arabic{equation}}
% }

% No indentation and extra space between paragraphs
\RequirePackage{parskip}


%%%%%%%%%%%%%%%%%%%%%%%% 
% COMANDOS AÑADIDOS %Heredado de Miguel
%%%%%%%%%%%%%%%%%%%%%%%%
% Para mostrar la fecha actual (mes año) con \Hoy
\newcommand{\MES}{%
  \ifcase\month% 0
    \or Enero% 1
    \or Febrero% 2
    \or Marzo% 3
    \or Abril% 4
    \or Mayo% 5
    \or Junio% 6
    \or Julio% 7
    \or Agosto% 8
    \or Septiembre% 9
    \or Octubre% 10
    \or Noviembre% 11
    \or Diciembre% 12
  \fi}
\newcommand{\ANYO}{\number\year}
\newcommand{\Hoy}{\MES\ \ANYO}

%%%%%%%%%%%%%%%%%%%%%%%% 
% GLOSARIOS
%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\RequirePackage[acronym,section,nowarn]{glossaries}
\renewcommand*{\glsclearpage}{}
\renewcommand{\glossarysection}[2][]{}

\makeglossaries

