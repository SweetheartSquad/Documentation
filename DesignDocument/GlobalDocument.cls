\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GlobalDocument}

\LoadClass{report}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{tikz}
\RequirePackage{wrapfig}

% set default font to Helvetica
\RequirePackage[scaled=1.1]{helvet}
\renewcommand\familydefault{\sfdefault} 
\RequirePackage[T1]{fontenc}
\linespread{1.15}
\RequirePackage{parskip}
\setlength{\parskip}{1.15em}

% basic colours
\definecolor{white}{rgb}{1,1,1}
\definecolor{black}{rgb}{0,0,0}

% colours from SweetHeart Squad logo
\definecolor{shs1}{RGB}{169,55,216}
\definecolor{shs2}{RGB}{255,140,205}
\definecolor{shs3}{RGB}{209,52,131}
\definecolor{shs5}{RGB}{216,128,255}


% for custom section headers
\RequirePackage{titlesec}
\RequirePackage{overpic}

\titleformat{\chapter}[block]
{\normalfont\Huge\bfseries}
{\begin{overpic}[width=1.5ex]{images/chapter-icon}
 \put (24,30) {\textcolor{white}{\normalsize\ifnum\value{chapter}<10 \hspace{0.12ex} \fi\thechapter}}
\end{overpic}}{0.5ex}{}
 
\titlespacing{\chapter}{0pt}{0pt}{-1.75ex}
\titlespacing{\section}{0pt}{0pt}{-1.75ex}
\titlespacing{\subsection}{0pt}{0pt}{-1.75ex}
\titlespacing{\subsubsection}{0pt}{0pt}{-1.75ex}
 
%\titlespacing{\section}{12pc}{1.5ex plus .1ex minus .2ex}{1pc}


% custom description lists
\RequirePackage{enumitem}
\newcommand\addcolon[1]{#1:}
\setlist{nosep}
\setlist[description]{format=\normalfont\bfseries\addcolon}

%custom footnote size
\renewcommand{\footnotesize}{\tiny}

% make cross-references clickable in order to make the document easier to read
\RequirePackage[hidelinks]{hyperref}
\RequirePackage[all]{hypcap}

% for alternating page backgrounds
\RequirePackage{everypage}
\RequirePackage{intcalc}
\RequirePackage[contents={},opacity=0.1,scale=1,angle=0]{background}

\newif\ifBgUse
\newif\ifBgPink

\AddEverypageHook{%
\ifBgUse %
\backgroundsetup{
scale=1,
color=black,
opacity=1,
angle=0,
contents={%
  \includegraphics[width=\paperwidth,height=\paperheight]{images/bg-image\intcalcMod{\thepage}{4}}
  }%
}%
\fi%
\BgMaterial %
}

% \newcommand{name}[number of args]{implementation}

\newcommand{\ourgame}{\textit{"Party, Darling?"}}
\newcommand{\ourteam}{\textit{"SweetHeart Squad"}}
\newcommand{\ourengine}{\textit{"S-Tengine2"}}

\mdfdefinestyle{mystyle}{
	leftmargin=3cm,
	rightmargin=1cm,
	linecolor=none,
    %linewidth=0.1pt,
	outerlinewidth=0pt,
	backgroundcolor=none,
	userdefinedwidth=\textwidth,
	%roundcorner=25pt,
    fontcolor=black
}


\mdfdefinestyle{mystyle2}{
	leftmargin=0cm,
	rightmargin=0cm,
	linecolor=shs1,
	outerlinewidth=1pt,
	backgroundcolor=white,
	userdefinedwidth=\textwidth,
	roundcorner=0pt
}

\newcommand{\character}[6]{
\noindent%
%\newpage
\begin{minipage}[t][0.8\paperheight]{\textwidth}
	\begin{mdframed}[style=mystyle]
    	\begin{wrapfigure}{R}{0.3\linewidth}
		    \vspace{-2cm}\colorbox{white}{\parbox[t][\paperheight][c]{1.5\linewidth}
            {\centering\includegraphics[width=\linewidth, height=0.7\paperheight, keepaspectratio=true]{images/#1}}
            }
        \end{wrapfigure}
        \hspace{-3.75cm}\parbox[t][0.7\paperheight][c]{1.25\linewidth}{
        %\color{white}
        \Huge\textbf{#2}
        
        \normalsize#3


        \Large\textbf{Personality Traits:}

        \normalsize#4

        \Large\textbf{Reason for Existing:}

        \normalsize#5

        \Large\textbf{Scenario:}

        \normalsize#6
        }
	\end{mdframed}
\end{minipage}
%\clearpage
}

\newcommand{\missingdoc}[1]{
\begin{minipage}[t][0.9\paperheight]{\textwidth}
	\Huge{File ``#1.tex'' not found.}
\end{minipage}
}