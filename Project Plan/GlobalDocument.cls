\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{GlobalDocument}

\LoadClass{report}

\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{tikz}

% set default font to Helvetica
\RequirePackage[scaled=1.1]{helvet}
\renewcommand\familydefault{\sfdefault} 
\RequirePackage[T1]{fontenc}
\linespread{1.15}
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


% for alternating page backgrounds
\RequirePackage{everypage}
\RequirePackage{intcalc}
\RequirePackage[contents={},opacity=0.1,scale=1,angle=0]{background}

\newif\ifBgUse

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
	linecolor=shs3,
	outerlinewidth=5pt,
	backgroundcolor=shs2,
	userdefinedwidth=\textwidth,
	roundcorner=5pt
}


\mdfdefinestyle{mystyle2}{
	leftmargin=0cm,
	rightmargin=0cm,
	linecolor=shs1,
	outerlinewidth=1pt,
	backgroundcolor=white,
	userdefinedwidth=0.5\textwidth,
	roundcorner=0pt
}

\newcommand{\character}[4]{
\noindent%
\clearpage
\begin{minipage}[t][0.9\paperheight]{\textwidth}
	\begin{mdframed}[style=mystyle]
		\begin{mdframed}[style=mystyle2]
			\includegraphics[width=0.5\textwidth, height=0.5\textwidth, keepaspectratio=true]{images/#1}
		\end{mdframed}
		
		Page Number: \intcalcMod{\thepage}{3}
		
		Character: #1
		
		Major Personality Trait(s): #2
		
		Reason for being at party: #3
		
		Possible Interactions: #4
%		  \parbox[t][5cm][t]{\textwidth}{#2}
	
	\end{mdframed}
\end{minipage}
\clearpage
}

\newcommand{\missingdoc}[1]{
\begin{minipage}[t][0.9\paperheight]{\textwidth}
	\Huge{File ``#1.tex'' not found.}
\end{minipage}
}