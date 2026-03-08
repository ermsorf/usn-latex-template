\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[2026/02/25 USN report class]
%% Copyright 2025 Erland Sørflaten
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% This work consists of the file(s) style.cls

% "USN-logo_black-EN" is a trademark or copyright of its respective owner.
% The logo is intended for documents and materials related to the university.
% If you are not affiliated or do not have permission, replace it and ensure
% you have usage rights for any logo you include.

\LoadClass{article}
\input{format/packages}

% -------------------------
% Font (commented options)
% -------------------------
%\usepackage{cmbright}
%\usepackage{tgheros}
%\usepackage{utopia}
%\usepackage{dejavu}
%\usepackage{palatino}
%\usepackage{mathpazo}
%\usepackage{lmodern}
%\usepackage{charter}
%\usepackage[scaled]{helvet}

% -------------------------
% Custom macros
% -------------------------
\newcommand{\shortauthor}[1]{\def\@shortauthor{#1}}
\newcommand{\coursecode}[1]{\def\@coursecode{#1}}
\newcommand{\coursename}[1]{%
  \def\@coursename{#1}% title page (keeps \\
  \def\@coursenameheader{\begingroup\let\\\relax #1\endgroup}
}
\newcommand{\subtitle}[1]{\def\@subtitle{#1}}

% -------------------------
% Header / Footer
% -------------------------

\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\@shortauthor}
\fancyhead[R]{\@coursecode}
\fancyfoot[C]{\thepage}

\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}

% -------------------------
% Line spacing
% -------------------------
\usepackage{microtype}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1em}
\renewcommand{\baselinestretch}{1.2}

% Better hyphenation and text handling for twocolumn
\emergencystretch=1em
\hyphenpenalty=50
\exhyphenpenalty=50


% -------------------------
% Title page 1
% -------------------------
\newcommand{\USNtitlepage}{
  \begin{titlepage}

    % Logo
    \includegraphics[width=8cm]{format/USN-logo_black-EN}
    \begin{tikzpicture}[remember picture, overlay]
      % Vertical line
      \draw[line width=2pt, gray]
        ([xshift=-1.5cm]current page.east|-current page.north)
        -- ([xshift=-1.5cm]current page.east|-current page.south);

      % Horizontal line
      \draw[line width=2pt, gray]
        ([yshift=-10cm]current page.north west)
        -- ([xshift=-1.5cm, yshift=-10cm]current page.east|-current page.north);

      \node[anchor=south west, yshift=25mm]
        at ([xshift=2.5cm, yshift=-10cm]current page.north west) {%
        \begin{minipage}{\paperwidth-5cm}
        \raggedright
        {\Huge \@coursecode\ - \@coursename}
        \end{minipage}
        };
      % Top content: title, subtitle
      \node[anchor=north west]
        at ([xshift=2.5cm, yshift=-12.5cm]current page.north west) {%
          \begin{minipage}{\paperwidth-5cm} % 2.5cm inset left+right
            \raggedright
            {\Huge \bfseries \@title}\\[1cm]
            {\Large \textit{\@subtitle}}
          \end{minipage}
      };

      % Bottom content: author and date
      \node[anchor=south west]
        at ([xshift=2.5cm, yshift=2.5cm]current page.south west) {%
          \begin{minipage}{\paperwidth-5cm}
            {\large \@author \hfill \@date}
          \end{minipage}
      };

    \end{tikzpicture}
  \end{titlepage}
  \newpage
}

