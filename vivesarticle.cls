%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 	File: 			vivesarticle.cls
%	Created: 	2017/10/08
% 	Author: 	Han Verstraete <welteki@outlook.com>
%
%
% 	Article template for Vives university college
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{### vivesarticle.cls --- ver. 0.0.0 --- Han Verstraete ###}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{vivesarticle}[2017/10/08 v0.0.0 Article class for Vives]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\LoadClass[a4paper]{article}

%############################################################################
% Required packages
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{titling}
\RequirePackage{multicol}
\RequirePackage{graphicx,xcolor}
\RequirePackage{lastpage}
\RequirePackage{tikz}

%############################################################################
% Define colors
\definecolor{vivesrood}{RGB}{227,29,26}
\definecolor{grijs}{rgb}{0.25,0.25,0.25}

%############################################################################
% Define variables
\makeatletter
\newcommand\address[1]{\renewcommand\@address{#1}}
\newcommand\@address{}
\newcommand{\theaddress}{\@address{}}
\newcommand\location[1]{\renewcommand\@location{#1}}
\newcommand\@location{}
\newcommand{\thelocation}{\@location{}}
\makeatother

%############################################################################
% Page size and margins
\geometry{a4paper, top=2.5cm, left=3cm}
\footskip=1.5cm
\textwidth=16cm
\textheight=23.5cm

%############################################################################
% Header and footer style
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\setlength{\headheight}{1.5cm}

\rhead{
	\begin{tikzpicture}[inner sep=0mm]
        \fill[vivesrood] (-0.15,0) rectangle (0,1.2);
        \node[anchor=west] at ( 0.5,0.6) {\includegraphics[height=1.3cm]{lib/vivesMiniLogo}};
    \end{tikzpicture}
}

\lfoot{
	\begingroup
	\renewcommand{\arraystretch}{1}
	\begin{tabular}[b]{@{}l@{}}
	    \footnotesize{\thetitle}\\
	    \footnotesize{\theauthor}
	\end{tabular}
	\endgroup
}

\rfoot{
	\thepage/\pageref{LastPage}
}

%############################################################################
% Redefine maketitle
\renewcommand{\maketitle}{
	\begin{tikzpicture}[remember picture,overlay, shift={(current page.north west)}]
		\node[anchor=north west] at (3, -0.5) (vivesLogo) {\includegraphics[height=2.7cm]{lib/vivesLogo}};
		\node[anchor=north east] at (19, -1.35) (associatieLogo) {\includegraphics[height=0.7cm]{lib/associatieLogo}};
		\fill[vivesrood] (16.6,-1.2) rectangle (16.75, -2.4);
		\node[anchor=north east] at (16.1,-1.2) {
			\begingroup
			\renewcommand{\arraystretch}{1}
			\footnotesize\begin{tabular}{@{}r@{}}\theaddress\end{tabular}
			\endgroup
		};
		\node[anchor=south east] at (19, -5.5) {
			\begin{tabular}{@{}r@{}}
				\large\bf\thetitle\\[.5cm]
				\large\theauthor
			\end{tabular}
		};
		\node[anchor=south west, text height=1.5ex,text depth=.25ex] at (3,-5.38) {\large \thedate};
		\draw  (3,-5.5) -- ( 19,-5.5);
	\end{tikzpicture}
	\vspace{1.3cm}
	\thispagestyle{empty}
}
