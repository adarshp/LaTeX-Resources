\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{apbeamer}
\LoadClass[aspectratio=169]{beamer}

% Customizing beamer
\usefonttheme{serif}
%\setbeamersize{text margin left=1in}
%\setbeamersize{text margin right=1in}
\setbeamercolor{caption name}{fg=Maroon}
\setbeamercolor{frametitle}{fg=Maroon}
\setbeamerfont{frametitle}{shape=\itshape}
\setbeamercolor{block title}{fg=Maroon}
\setbeamercolor{part title}{fg=Maroon}
\setbeamertemplate{frametitle}{
  \vspace{1.2em}
  \insertframetitle
}
\addtobeamertemplate{block begin}{%
  \setlength{\textwidth}{109.2mm}%
  \centering
}{}

% Customize fonts
\RequirePackage{fontspec}
\IfFontExistsTF{Arno Pro}{
\setmainfont[Numbers = {OldStyle, Proportional}]{Arno Pro}
}{
\setmainfont[Numbers = {OldStyle, Proportional}]{TeX Gyre Pagella}
}
\RequirePackage{amssymb, unicode-math}
\setmainfont[Numbers = {OldStyle, Proportional}]{Arno Pro}
\setmathfont[Numbers = {OldStyle}]{TeX Gyre Pagella Math}
\setsansfont{Gill Sans}
%pgf/TikZ

\RequirePackage{multimedia}
\RequirePackage{luatex85}

\RequirePackage{pgfplots}
\pgfplotsset{compat=1.5}
\RequirePackage{tikz}
\usetikzlibrary{arrows, graphdrawing,graphs,trees,
graphs.standard, babel, quotes}
\usegdlibrary{trees}
\usetikzlibrary{shapes}
\usetikzlibrary{fit}
\usetikzlibrary{chains}
\usetikzlibrary{arrows}


% Externalize PGF plots and TikZ diagrams
\usepgfplotslibrary{external}
\RequirePackage{shellesc}
\immediate\write18{mkdir -p build}
\tikzexternalize[prefix=build/]

\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
\definecolor{Maroon}{cmyk}{0, 0.87, 0.68, 0.32}
\definecolor{RoyalBlue}{cmyk}{1, 0.50, 0, 0}
\definecolor{Black}{cmyk}{0, 0, 0, 0}
\definecolor{shadecolor}{gray}{0.9}
\definecolor{sred}{HTML}{DC322F}

% =============================================================================
% User-defined macros
% =============================================================================

\def\Z{\mathbb{Z}}
\def\R{\mathbb{R}}
\def\Pois{\text{Pois}}
\newcommand{\p}[1]{\left(#1\right)}
\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\Sum}[2]{\sum\limits_{#1}^{#2}}
\newcommand{\Prod}[2]{\prod\limits_{#1}^{#2}}
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
\let\bar\overline
\newcommand{\maroon}[1]{{\color{Maroon}#1}}
\newcommand{\blue}[1]{{\color{RoyalBlue}#1}}
\newcommand{\gray}[1]{{\color{gray}#1}}
\newcommand{\evalat}[2]{\left. #2 \right|_{#1}}
\newcommand{\pmat}[1]{\begin{pmatrix} #1 \end{pmatrix}}
\def\({\left(}
\def\){\right)}
