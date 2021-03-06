\NeedsTeXFormat{LaTeX2e}

% Use via \documentclass{apnotes}
\ProvidesClass{apnotes}

\LoadClass[oneside, 9pt]{memoir}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax

\RequirePackage{calc}
\RequirePackage{algpseudocode, algorithm}
\RequirePackage{graphicx} 

% Silence some noisy warnings temporarily
\RequirePackage{silence}
\WarningFilter{fontaxes}{I don't know how to decode}
\WarningFilter{pgfplots}{running in backwards}
\WarningFilter{latex}{Marginpar}

% Math setup
\RequirePackage[fleqn]{amsmath}
\RequirePackage{amssymb, unicode-math}

% Font Setup
\RequirePackage{fontspec}
\setmainfont[Numbers = {OldStyle, Proportional}]{TeX Gyre Pagella}
\setmathfont{TeX Gyre Pagella Math}

% Typography
\RequirePackage[tracking]{microtype}

% ======================================================================
% Colors
% ======================================================================

\RequirePackage{xcolor}

\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
\definecolor{Maroon}{cmyk}{0, 0.87, 0.68, 0.32}
\definecolor{RoyalBlue}{cmyk}{1, 0.50, 0, 0}
\definecolor{Black}{cmyk}{0, 0, 0, 0}
\definecolor{shadecolor}{gray}{0.9}
\definecolor{sred}{HTML}{DC322F}

%pgf/TikZ
\RequirePackage{pgfplots}
\usetikzlibrary{arrows, graphdrawing,graphs,trees,
graphs.standard, babel, quotes}
\usegdlibrary{trees}

% Externalize PGF plots and TikZ diagrams
\usepgfplotslibrary{external}
\RequirePackage{shellesc}
\immediate\write18{mkdir -p build}
\tikzexternalize[prefix=build/]

% =====================================================================
% Set up hyperlinks
% =====================================================================

\PassOptionsToPackage{pdftex,hyperfootnotes=false,pdfpagelabels=true}{hyperref}
    \RequirePackage{hyperref}  % backref linktocpage pagebackref
\pdfcompresslevel=9
\pdfadjustspacing=1 

\hypersetup{%
    colorlinks=true, linktocpage=true, pdfstartpage=3,
    pdfstartview=FitV, breaklinks=true, pdfpagemode=UseNone,
    pageanchor=true, pdfpagemode=UseOutlines, plainpages=false,
    bookmarksnumbered, bookmarksopen=true, bookmarksopenlevel=1,
    hypertexnames=true, pdfhighlight=/O, urlcolor=webbrown,
    linkcolor=RoyalBlue, citecolor=webgreen,
    pdfsubject={},
    pdfkeywords={},
}   

\def\equationautorefname{equation}
\def\sectionautorefname{§}
\def\equationautorefname{equation}
\def\figureautorefname{figure}
\def\tableautorefname{table}

\providecommand{\listingautorefname}{listing}

\floatname{algorithm}{\color{Maroon} Algorithm}
\floatname{listing}{\color{Maroon} Listing}

% ======================================================================
% Memoir package - layout and styling
% ======================================================================

% Here we set typeblock widths for the main body and the footnotes
\setlxvchars[\normalfont\normalsize] % about 66 characters per column
\setxlvchars[\normalfont\footnotesize] % about 45 characters per column

% Set outer and spine margins (designed for TeX Gyre Pagella 9pt, change
% accordingly for different fonts. A wide margin is chosen both for
% legibility of the typeblock and for tight integration of marginfigures
% and margin footnotes.

\setlrmarginsandblock{1.15in}{3.5in}{*} 

% Set upper and lower margins
%\setulmarginsandblock{1.22in}{1.22in}{*}
%\setulmarginsandblock{1.1in}{1.1in}{*}

% Set properties of margin notes, sidecaptioned floats, and footnotes in
% the margin.

\setmarginnotes{0.2in}{2.15in}{2\onelineskip}
\setsidecaps{0.2in}{2.15in}
\sidecapmargin{outer}
\renewcommand*{\sidecapstyle}{\normalfont\footnotesize}
\setsidecappos{c}

% Set footnotes in the margin rather than at the foot of the page
\footnotesinmargin
\setsidefeet{\marginparsep}{1.9in}{0.2in}{0pt}{\flushleftright\footnotesize}{*}

% Integrate the counters of the sidefootnotes and footnotes in margin.
\letcountercounter{sidefootnote}{footnote}
\setlength{\footmarkwidth}{0em}
\setlength{\footmarksep}{-\footmarkwidth}
\setlength{\footparindent}{1em}
\sideparmargin{outer}

\renewcommand*{\sideparfont}{\color{Maroon}\emphshape}
\renewcommand*{\sideparvshift}{2\baselineskip}
\marginparmargin{outer}

% Style the entries in the Table of Contents
\renewcommand*{\cftchapterfont}{\scshape\MakeTextLowercase}
\renewcommand*{\cftpartfont}{\color{Maroon}\scshape\MakeTextLowercase}
\captionstyle[\centering]{\footnotesize}
\captionnamefont{\footnotesize\color{Maroon}}

% Reduce spacing between list items
\tightlists

% Headers and footers - page numbers, section headings, etc.
\makepagestyle{tufte}
\createmark{section}{left}{nonumber}{}{}
\makeoddhead{tufte}{}{}{\scshape\MakeTextLowercase{\leftmark}~~|~~\thepage}
\makeevenhead{tufte}{\thepage~~|~~\scshape\MakeTextLowercase{\rightmark}}{}{}
 \makerunningwidth{tufte}[8in]{8in}
\aliaspagestyle{chapter}{empty}
\nouppercaseheads
\pagestyle{tufte}


% Make marginfigures centered by default
\setfloatadjustment{marginfigure}{\centering}

%% Bringhurst chapter and head styles with a pedersen-type Chapter number
\makechapterstyle{bringhurst}{%
	\renewcommand{\chapterheadstart}{} 
	\renewcommand{\printchaptername}{} 
	\renewcommand{\chapternamenum}{} 
	\setlength{\midchapskip}{15mm}
	\renewcommand*{\printchapternum}{%
        \begin{marginfigure}[0pt]
          \resizebox{!}{\midchapskip}{\color{Maroon}\emph{\thechapter}}
        \end{marginfigure}
      }
	\renewcommand{\afterchapternum}{} 
	\renewcommand{\printchaptertitle}[1]{%
	  \raggedright\Large\scshape\MakeLowercase{##1}}
	\renewcommand{\afterchaptertitle}{%
	  \vskip\onelineskip \hrule\vskip\onelineskip}
}

\setlength{\cftsubsectionindent}{0.6in}
\chapterstyle{bringhurst}
\headstyles{bringhurst}
% Setting up figures to allow subfloats
\newsubfloat{figure}

\checkandfixthelayout

% =====================================================================
% Misc layout commands
% =====================================================================

\linespread{1.2}

% =====================================================================
% User-defined macros
% =====================================================================

\def\Z{\mathbb{Z}}
\def\R{\mathbb{R}}
\def\Pois{\text{Pois}}
\newcommand{\p}[1]{\left(#1\right)}
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\Sum}[2]{\sum\limits_{#1}^{#2}}
\let\f\frac
\renewcommand{\i}{\emphem}
\let\bar\overline
\newcommand{\eq}[2]{\begin{align} #1 \label{eq:#2} \end{align}} 
\newcommand{\mfig}[3]{%
  \begin{marginfigure} 
    \includegraphics[width=\textwidth]{#1} 
    \label{fig:#2} 
    \caption{#3}
  \end{marginfigure} 
} 
\newcommand{\tab}[1]{\begin{table} #1 \end{table}}
\let\tt\texttt

\newcommand{\maroon}[1]{{\color{Maroon}#1}}
\newcommand{\evalat}[2]{\left. #2 \right|_{#1}}
\newcommand{\pmat}[1]{\begin{pmatrix} #1 \end{pmatrix}}
\def\({\left(}
\def\){\right)}

% ======================================================================
% Bibliography management
% ======================================================================

\RequirePackage[
  backend=biber, 
  backref,
  language=auto,
  style=numeric-comp,
  sorting=none,
  maxbibnames=10,
  arxiv=pdf,
  url=false,
  natbib=true,
  doi=false
]{biblatex}

% Set up back references
\DefineBibliographyStrings{english}{%
    backrefpage  = {cited on page},
    backrefpages = {cited on pages},
}

\DeclareBibliographyDriver{set}{%
  \entryset
    {%
     $\cdot$~\setunit*{\addnbspace}}
    {}%
  \finentry
}

\DeclareFieldFormat[phdthesis]{title}{\mkbibemph{#1}\isdot}
\DeclareFieldFormat[thesis]{title}{\mkbibemph{#1}\isdot}
\DeclareFieldFormat[article]{title}{\mkbibemph{#1}\isdot}
\DeclareFieldFormat[article]{journaltitle}{#1\isdot}
\DeclareFieldFormat[article]{volume}{\mkbibbold{#1}\isdot}
\DeclareFieldFormat[article]{number}{}
\DeclareFieldFormat[report]{number}{\textsc{\MakeTextLowercase{#1}}}
\DeclareFieldFormat{eprint:arxiv}{%
  \ifhyperref
    {\href{http://arxiv.org/\abx@arxivpath/#1}{%
       \nolinkurl{[arXiv: #1]}%
       \iffieldundef{eprintclass}
         {}
         {}}}
    {\nolinkurl{#1}
     \iffieldundef{eprintclass}
       {}
       {}}}
\renewcommand{\newunitpunct}{, }
\renewcommand{\entrysetpunct}{\\}
\AtEveryBibitem{\clearname{note}}
\renewbibmacro{in:}{}
