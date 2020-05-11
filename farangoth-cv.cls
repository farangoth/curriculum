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

\RequirePackage{hyperref}
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
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3.5cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont \myFirstName}{\bodyfont \myLastName}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont \cvTitle%
    };
  \end{tikzpicture}
  \vspace{2.2cm}
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
    \par\vspace{2\parskip}{\large\headingfont\color{headercolor} #1}
  }
  
  \begin{textblock}{4.4} (0.4, 4.6)
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
  \par\vspace{3\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.5\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {%
  \large\headingfont\color{headercolor} #1%
  }
  \par\vspace{.25\parskip}%
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
  \vspace{2\parskip}
  \parbox[t]{3cm}{%
    #1\\
    {\thinfont\color{lightgray}#3}
  }&%
  \parbox[t]{11.5cm}{%
    \textbf{#2}\\
    #4
  }%
  \\
}

\newcommand{\doubleentryref}[6]{%
  \vspace{2\parskip}
  \begin{tabular*}{\textwidth}{ll}
    \textbf{#1}&\textbf{#4} \\
    \emph{\href{mailto:#2}{#2}}&\emph{\href{mailto:#5}{#5}}\\
    \parbox[t]{7cm}{#3}&\parbox[t]{7cm}{#6}%
  \end{tabular*}
  \\
}

\newcommand{\doubleentry}[4]{%
  \begin{tabular*}{\textwidth}{ll}
    \textbf{#1}&\textbf{#3} \\
    \parbox[t]{7cm}{#2}&\parbox[t]{7cm}{#4}%
  \end{tabular*}
  \\
}