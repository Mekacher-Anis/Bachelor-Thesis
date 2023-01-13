%
% ociamthesis v2.2 (Custom Patched)
% By Keith A. Gillow <gillow@maths.ox.ac.uk>
% Version 1.0 released 26/11/1997
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ociamthesis}[2010/11/22 v2.2 OCIAM thesis class]
%-------------------------- initial code -----------------------
\LoadClass[a4paper,twoside=true]{scrreprt}
% As an alternative to the above could use next line for twosided output
%\LoadClass[a4paper,twoside,openright]{report}


\RequirePackage{graphicx} % needed for latest frontpage logo
\RequirePackage{ifthen}   % needed for option parsing for logo


\raggedbottom

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Define the default submitted text
\newcommand{\thesistype}[1]{\gdef\@thesistype{#1}}
% The year and term the thesis is submitted 
\newcommand{\degreedate}[1]{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\newcommand{\degree}[1]{\gdef\@degree{#1}}
% The name of your Oxford college (e.g. Christ Church, Pembroke)
\newcommand{\college}[1]{\gdef\@college{#1}}
% The cover logo
\newcommand{\logo}[1]{\gdef\@logo{#1}}
\newcommand{\department}[1]{\gdef\@department{#1}}
\newcommand{\firstexaminer}[1]{\gdef\@firstexaminer{#1}}
\newcommand{\secondexaminer}[1]{\gdef\@secondexaminer{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\matriculationnumber}[1]{\gdef\@matriculationnumber{#1}}
\newcommand{\place}[1]{\gdef\@place{#1}}
\newboolean{german}
\newcommand{\germancover}[0]{\setboolean{german}{true}}

%
% Define text area of page and margin offsets
%
\setlength{\topmargin}{0.0in}
\setlength{\oddsidemargin}{0.33in}
\setlength{\evensidemargin}{-0.08in}
\setlength{\textheight}{9.0in}
\setlength{\textwidth}{6.0in}

%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{}%
       
%define title page layout
\renewcommand{\maketitle}{%

    \begin{alwayssingle}
        \renewcommand{\footnotesize}{\small}
        \renewcommand{\footnoterule}{\relax}
        \thispagestyle{empty}
        %\null\vfill % ToDo: Talk to Eric about spaceing
        \null\vspace*{\stretch{1}} % Use this instead?
        \begin{center}
            {\huge{\bfseries{\@title}}\par}
            \vspace*{6ex}
            {{\@department} \par}
            \vspace*{1ex}
            {{\@college}\par}
            {
            	\vspace*{8ex}
            	{
            	    {\textbf{\LARGE \@thesistype}}\par
                	\vspace*{1ex}
                	\ifthenelse{\boolean{german}}{
                	    zur Erwerbung des Abschlusses
                	}{
                	    submitted for the degree of
                	}\par
                	\vspace*{1ex}
                	{\@degree}
            	\par}
            	\vspace*{5ex}
            	{
            	    {
                	    \large \normalsize{
                    	    \ifthenelse{\boolean{german}}{
                    	        von
                    	    }{
                    	        by
                    	    }
                	    }\\
                	    \vspace{1ex}
                	    \textbf{\LARGE \@author}\\
                	    \vspace{1ex}
                	    \normalsize{\ifthenelse{\boolean{german}}{
                	        Matrikelnummer
                	    }{
                	        Matriculation Number
                	    }: \@matriculationnumber}
            	    } 
            	    \par
            	}
            	{\large \vspace*{5ex} {\@logo \par} \vspace*{10mm}}
                \ifthenelse{\boolean{german}}{
                    {Erstprüfer: \@firstexaminer \par}\vspace*{1ex}
                    {Zweitprüfer: \@secondexaminer \par}\vspace*{1ex}
                    {Bertreuer: \@supervisor \par}
                }{
                    {First Examiner: \@firstexaminer \par}\vspace*{1ex}
                    {Second Examiner: \@secondexaminer \par}\vspace*{1ex}
                    {Supervised By: \@supervisor \par}
                }
            	\vspace*{1.5ex}
            	\vspace*{5mm}
            	{\@degreedate}
            }
      \end{center}
    \end{alwayssingle}
    \cleardoublepage
    \begin{alwayssingle}
        \thispagestyle{empty}
        \section*{Erklärung der Selbständigkeit}
        Hiermit versichere ich, dass ich diese Arbeit selbstständig verfasst habe, keine anderen als die angegebenen Quellen und Hilfsmittel benutzt wurden, alle Stellen der Arbeit, die wörtlich oder sinngemäß aus anderen Quellen übernommen wurden, als solche kenntlich gemacht sind, und die Arbeit in gleicher oder ähnlicher Form noch keiner Prüfungsbehörde vorgelegen hat.
        
        \vspace{3cm}
        
        
        \hspace{-10pt}\rule{6cm}{0.4pt} \hfill \@place, \@degreedate
        
        
        \@author
    \end{alwayssingle}
    \cleardoublepage
}
