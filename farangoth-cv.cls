\ProvidesClass{farangoth-cv}[200430 CV Class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption{draft}{\def\@cv@draft{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[left=5.5cm,top=1.1cm,right=1.5cm,bottom=1.5cm,nohead,nofoot]{geometry}


\RequirePackage[pdfusetitle]{hyperref}
\hypersetup{pdfborder={0,0,0},colorlinks,urlcolor=header}


%% Colors %%%%%%%%%%
\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\definecolor{linkedin}{RGB}{40,103,178}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
  \colorlet{linkedin}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
  
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

\ifdefined\@cv@draft
  \colorlet{fillheader}{lightgray}
\fi

%% Fonts %%%%%%%%%%%
\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\newfontfamily\bodyfont[Path=fonts/,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path=fonts/,]{Lato-Light.ttf}
\newfontfamily\headingfont[Path=fonts/,]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Path=fonts/,
Mapping=tex-text, Color=textcolor,
BoldFont=texgyreheros-bold.otf,
ItalicFont=texgyreheros-italic.otf,
BoldItalicFont=texgyreheros-bolditalic.otf]
{texgyreheros-regular.otf}

\setmathfont{texgyreheros-regular.otf}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\usepackage{fontawesome}
\newcommand*{\colorLinkedinLogo}{Linked.\textcolor{linkedin}{\faLinkedinSquare}}
\newcommand*{\colorGithubLogo}{Github \textcolor{black}{\faGithubSquare}}

%% variables %%%%%%%



%%%%%%%%%%%%%%%%%%%%
%%% Structure %%%%%%
%%%%%%%%%%%%%%%%%%%%

%% Header %%%%%%%%%%
\RequirePackage{parskip}
\RequirePackage{tikz}

\newcommand*{\makeheader}{%
  \begin{tikzpicture}[remember picture, overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=2.8cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{32pt}{50pt}\color{header}%
      {\thinfont \myFirstName}{\bodyfont \myLastName}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont \cvTitle%
    };
  \end{tikzpicture}
  \vspace{1.4cm}
}

\newcommand*{\makefooter}{%
  \begin{tikzpicture}[remember picture, overlay]
    \node [rectangle, fill=fillheader, anchor=south, minimum width=\paperwidth, minimum height=0.9cm] (box) at (current page.south){};
    \node [anchor=center] (name) at (box) {
      \fontsize{14pt}{24pt}\color{header}
      {\thinfont Clément Savalle \quad | \quad \href{mailto:\myMail}{\faEnvelope\,\myMail} \quad | \quad \href{tel:\myPhoneNumber}{\faMobile\,\myPhoneNumber}}
      };
  \end{tikzpicture}
}



\newcommand*{\othermakeheader}{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=west] (name) at (box.west) {%
      \begin{tabular}{l}
        \fontsize{40pt}{72pt}\color{header}%
        {\thinfont \myFirstName}{\bodyfont \myLastName}\\
        \fontsize{14pt}{24pt}\color{header}%
        {\thinfont \cvTitle}
      \end{tabular}
    };
    \node [anchor=east] (details) at (box.east) {%
      \begin{tabular}{r}
        {\color{header}\bodyfont\myPhoneNumber{}}\\
        {\color{header}\bodyfont\href{mailto:\myMail{}}{\myMail{}}}\\
        {\color{header}\bodyfont\href{\myGithub}{\colorGithubLogo}}\\
        {\color{header}\bodyfont\href{\myLinkedin}{\colorLinkedinLogo}}
      \end{tabular}
    };
  \end{tikzpicture}
  \vspace{2.2cm}
}

%% side block %%%%%%
\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
  \let\oldsection\section%
  \renewcommand{\section}[1]{%
    \par\vspace{2\parskip}
    {\Large\headingfont\color{headercolor} #1}
    %\par\vspace{0.5\parskip}
  }

  \renewcommand{\subsection}[1]{
    \par\vspace{0.5\parskip}%
    {\large\headingfont\color{headercolor} #1}
    \par\vspace{0.2\parskip}%
}
  
  \begin{textblock}{4.4} (0.4, 3.4)
    \begin{flushright}
      \obeycr%
    }{%
      \restorecr%
    \end{flushright}
  \end{textblock}

  \let\section\oldsection%
}

%% Section %%%%%%%%%
\newcounter{colorCounter}
% Colorize the first three letters of a section's name
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
      blue\or%
      red\or%
      orange\or%
      green\or%
      purple\else%
      headercolor\fi%
    } #1#2#3% 
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{1\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.4\parskip}
}


\renewcommand{\subsection}[1]{
  %\par\vspace{0.10\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{0.05\parskip}%
}

% Reset the style
\pagestyle{empty}

%% list environment 

\RequirePackage{multicol}

\setlength{\tabcolsep}{0.2cm}

\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{rr}
    }{%
  \end{tabular*}
}

\newcommand{\entry}[4]{%
  \vspace{1.8\parskip}
  \parbox[t]{2.7cm}{%
    {\thinfont\small#1}\\
%    {\thinfont\small\color{lightgray}#3}
    {\thinfont\small#3}
  }&%
  \parbox[t]{11.5cm}{%
    \textbf{#2}\\
    #4
  }%
  \\
}

\newcommand{\doubleentryref}[8]{%
  \vspace{2\parskip}
  \begin{tabular*}{\textwidth}{ll}
    \textbf{#1}&\textbf{#5} \\
    \emph{\href{mailto:#2}{#2}}&\emph{\href{mailto:#6}{#6}}\\
    \emph{#3}&\emph{#7}\\
    \parbox[t]{7cm}{#4}&\parbox[t]{7cm}{#8}%
  \end{tabular*}
  \\
}

\newcommand{\doubleentry}[4]{%
  \vspace{2\parskip}
  \begin{tabular*}{\textwidth}{ll}
    \textbf{#1}&\textbf{#3} \\
    \parbox[t]{7cm}{#2}&\parbox[t]{7cm}{#4}%
  \end{tabular*}
  \\
}