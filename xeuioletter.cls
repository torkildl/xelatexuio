\NeedsTeXFormat{LaTeX2e}[1994/12/01] %% Any version, really.
\ProvidesPackage{xeuioletter}[2018/01/02 v3.08c UiO document class]
\RequirePackage{ifthen}
\newcommand{\xeuioletter@bokmaal}{%
  \def \xeuioletter@address@name {Postadresse}%
  \def \xeuioletter@date@name {Dato}%
  \def \xeuioletter@ouraddr@name {Postboks 1080 Blindern}%
  \def \xeuioletter@email@name {E-post}%
  \def \xeuioletter@fax@name {Faks}%
  \def \xeuioletter@phone@name {Telefon}%
  \def \xeuioletter@ourref@name {V\aa r ref}%
  \def \xeuioletter@ourzip@name {0316}%
  \def \xeuioletter@yourref@name {Deres ref}}
\xeuioletter@bokmaal
\newcommand{\xeuioletter@nynorsk}{%
  \xeuioletter@bokmaal
  \def \xeuioletter@yourref@name {Dykkar ref}}
\newcommand{\xeuioletter@english}{%
  \def \xeuioletter@address@name {Mail address}%
  \def \xeuioletter@date@name {Date}%
  \def \xeuioletter@ouraddr@name {PO box 1080 Blindern}%
  \def \xeuioletter@email@name {E-mail}%
  \def \xeuioletter@fax@name {Fax}%
  \def \xeuioletter@phone@name {Phone}%
  \def \xeuioletter@ourref@name {Our ref}%
  \def \xeuioletter@ourzip@name {NO-0316}%
  \def \xeuioletter@yourref@name {Your ref}}
\DeclareOption{geo}{\def \xeuioletter@dept{geo}%
  \def \xeuioletter@dept@bm{Institutt for geofag}%
  \def \xeuioletter@dept@nn{Institutt for geofag}%
  \def \xeuioletter@dept@eng{Department of Geosciences}%
  \def \xeuioletter@fac{mn}}%
\DeclareOption{ifi}{\def \xeuioletter@dept{ifi}%
  \def \xeuioletter@dept@bm{Institutt for informatikk}%
  \def \xeuioletter@dept@nn{Institutt for informatikk}%
  \def \xeuioletter@dept@eng{Department of Informatics}%
  \def \xeuioletter@fac{mn}}%
\DeclareOption{iln}{\def \xeuioletter@dept{iln}%
  \def \xeuioletter@dept@bm{Institutt for lingvistiske og nordiske studier}%
  \def \xeuioletter@dept@nn{Institutt for lingvistiske og nordiske studium}%
  \def \xeuioletter@dept@eng{Department of Linguistics and Scandinavian Studies}%
  \def \xeuioletter@fac{hf}}%
\DeclareOption{iss}{\def \xeuioletter@dept{iss}%
  \def \xeuioletter@dept@bm{Institutt for sosiologi og samfunnsgeografi}%
  \def \xeuioletter@dept@nn{Institutt for sosiologi og samfunnsgeografi}%
  \def \xeuioletter@dept@eng{Department of Sociology and Human Geography}%
  \def \xeuioletter@fac{sv}}%
\DeclareOption{math}{\def \xeuioletter@dept{math}%
  \def \xeuioletter@dept@bm{Matematisk institutt}%
  \def \xeuioletter@dept@nn{Matematisk institutt}%
  \def \xeuioletter@dept@eng{Department of Mathematics}%
  \def \xeuioletter@fac{mn}}
\DeclareOption{usit}{\def \xeuioletter@dept{usit}%
  \def \xeuioletter@dept@bm{Universitetets senter for informasjonsteknologi}%
  \def \xeuioletter@dept@nn{Universitetets senter for informasjonsteknologi}%
  \def \xeuioletter@dept@eng{University Center for Information Technology}%
  \def \xeuioletter@fac{none}}
\DeclareOption{american}{\ExecuteOptions{USenglish}}
\DeclareOption{english}{\ExecuteOptions{UKenglish}}
\DeclareOption{norsk}{\xeuioletter@bokmaal
  \def \xeuioletter@suffix {bm}
  \PassOptionsToPackage{norsk}{babel}}
\DeclareOption{nynorsk}{\xeuioletter@nynorsk
  \def \xeuioletter@suffix {nn}
  \PassOptionsToPackage{nynorsk}{babel}}
\DeclareOption{UKenglish}{\xeuioletter@english
  \def \xeuioletter@suffix {eng}
  \PassOptionsToPackage{UKenglish}{babel}}
\DeclareOption{USenglish}{\xeuioletter@english
  \def \xeuioletter@suffix {eng}
  \PassOptionsToPackage{USenglish}{babel}}
\xeuioletter@bokmaal
\DeclareOption{simplify}{\xeuioletter@simpletrue}
\newif \ifxeuioletter@simple
\xeuioletter@simplefalse
\ExecuteOptions{ifi}
\DeclareOption{a4paper}{}
\DeclareOption*{%
    \ClassWarning{xeuioletter}{Option '\CurrentOption' is not recognised}}
\ProcessOptions* \relax
\RequirePackage{babel}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage{tabularx}
\RequirePackage[absolute]{textpos}
\LoadClass[a4paper,11pt]{letter}
\newcommand{\countersign}[1]{\def \xeuioletter@countersign {#1}}
\def \xeuioletter@countersign {}
\newcommand{\countersigntitle}[1]{\def \xeuioletter@countertitle {#1}}
\def \xeuioletter@countertitle {}
\newcommand{\executive}[1]{\def \xeuioletter@executive {#1}}
\def \xeuioletter@executive {}
\newcommand{\execaddr}[1]{\def \xeuioletter@execaddr {#1}}
\def \xeuioletter@execaddr {}
\newcommand{\mytitle}[1]{\def \xeuioletter@mytitle {#1}}
\def \xeuioletter@mytitle {}
\newcommand{\ouraddr}[1]{\def \xeuioletter@ouraddr {#1}}
\def \xeuioletter@ouraddr {\xeuioletter@ouraddr@name}
\newcommand{\ourcity}[1]{\def \xeuioletter@ourcity {#1}}
\def \xeuioletter@ourcity {Oslo}
\newcommand{\ouremail}[1]{\def \xeuioletter@ouremail {#1}}
\def \xeuioletter@ouremail {}
\newcommand{\ourfax}[1]{\def \xeuioletter@ourfax {#1}}
\def \xeuioletter@ourfax {}
\newcommand{\ourphone}[1]{\def \xeuioletter@ourphone {#1}}
\def \xeuioletter@ourphone {}
\newcommand{\ourref}[1]{\def \xeuioletter@ourref {#1}}
\def \xeuioletter@ourref {}
\newcommand{\oursect}[1]{\def \xeuioletter@oursect {#1}}
\def \xeuioletter@oursect {}
\newcommand{\ourweb}[1]{\def \xeuioletter@ourweb {#1}}
\def \xeuioletter@ourweb {www.uio.no}
\newcommand{\ourzip}[1]{\def \xeuioletter@ourzip {#1}}
\def \xeuioletter@ourzip {\xeuioletter@ourzip@name}
\newcommand{\yourref}[1]{\def \xeuioletter@yourref {#1}}
\def \xeuioletter@yourref {}
\let \xeuioletter@orig@letter = \letter
\renewcommand{\letter}[1]{%
  \xeuioletter@orig@letter{#1}%
  \xeuioletter@addFixedElements
  \thispagestyle{empty}
  \vspace*{-1in}
\vspace*{-\topmargin}
\vspace*{-\headheight}
\vspace*{-\headsep}
\vspace*{99mm}
\vspace*{-1.5ex}
\setlength{\baselineskip}{5mm plus 1pt minus 1pt}
\raggedright
\setlength{\parindent}{0pt}%
\setlength{\parskip}{5mm plus 2pt minus 2pt}}
\newcommand{\xeuioletter@addFixedElements}{%
  \begin{textblock*}{15cm}(20mm,12mm)
  \includegraphics[height=9.3mm]{%
    \xeuioletter@fac-\xeuioletter@dept-\xeuioletter@suffix}
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,46mm)
  \footnotesize
  \toname\\
  \toaddress\null
\end{textblock*}
  \begin{textblock*}{17cm}(20mm,72mm)
  \footnotesize
  \ifthenelse{\boolean{xeuioletter@date}}
    {\makebox[45pt][l]{\xeuioletter@date@name:}\xeuioletter@date@cmd}
    {}\mbox{}
  \ifthenelse{\equal{\xeuioletter@yourref}{}}{}
    {\\ \makebox[45pt][l]{\xeuioletter@yourref@name:}\xeuioletter@yourref}%
  \ifthenelse{\equal{\xeuioletter@ourref}{}}{}
    {\\ \makebox[45pt][l]{\xeuioletter@ourref@name:}\xeuioletter@ourref}
\end{textblock*}
  \begin{textblock*}{20mm}(22.5mm,105mm)
  \includegraphics{uio-bg-colon}
\end{textblock*}
  \begin{textblock*}{19mm}(24mm,266mm)
  \includegraphics[height=19mm]{uio-off-logo}
\end{textblock*}
  \ifxeuioletter@simple
  {\def \\{,}%
   \global \setbox0 = \hbox{\scriptsize \xeuioletter@ouraddr\\
     \xeuioletter@ourzip~\xeuioletter@ourcity}}%
  \xeuioletter@simpleauthorinfo
\else
  \xeuioletter@fullauthorinfo
\fi}
\newboolean{xeuioletter@date}  \setboolean{xeuioletter@date}{false}
\def \xeuioletter@date@cmd {\@date}
\AtBeginDocument{
  \ifthenelse{\isundefined{\iso@printday}} %% Package isodate loaded?
    {}
    {\setboolean{xeuioletter@date}{true}%
     \def \xeuioletter@date@cmd {\today}}
  \ifthenelse{\equal{\@date}{}}            %% \date{} ?
    {}
    {\setboolean{xeuioletter@date}{true}}
}
\newcommand{\xeuioletter@fullauthorinfo}{%
  \begin{textblock*}{147,5mm}(62.5mm,271mm)
    \scriptsize
    \begin{tabularx}{127.5mm}[t]{@{}%
        >{\raggedright}X@{}%
        >{\raggedright}X@{}%
        >{\raggedright}X@{}}
      \csname xeuioletter@dept@\xeuioletter@suffix\endcsname&
      \ifthenelse{\equal{\xeuioletter@oursect}{}}{~}
        {\xeuioletter@oursect}\\
      \xeuioletter@ouraddr\\
      \xeuioletter@ourzip~\xeuioletter@ourcity&
      \makebox[4em][l]{\xeuioletter@phone@name:} \xeuioletter@ourphone\\
      \makebox[4em][l]{\xeuioletter@fax@name:} \xeuioletter@ourfax\\
      \makebox[4em][l]{\xeuioletter@email@name:}
        \textsf{\xeuioletter@ouremail}\\
      \makebox[4em][l]{Www:} \textsf{\xeuioletter@ourweb}\\
      \tabularnewline
    \end{tabularx}
  \end{textblock*}}
\newcommand{\xeuioletter@simpleauthorinfo}{%
  \begin{textblock*}{147,5mm}(62.5mm,271mm)
    \scriptsize
    \begin{tabular}{ll}
      \xeuioletter@address@name:& \box0\\
      \xeuioletter@email@name:& \textsf{\xeuioletter@ouremail}\\
      Www:& \textsf{\xeuioletter@ourweb}\\
    \end{tabular}
  \end{textblock*}}
\setlength{\oddsidemargin}{20mm-1in}
\setlength{\textwidth}{21cm-20mm-20mm}
\setlength{\topmargin}{46mm-1in-\headheight-\headsep}
\setlength{\textheight}{29.7cm-46mm-37mm}
\renewcommand{\opening}[1]{%
  \textbf{#1}\par \vspace{1pt}\vspace{-\baselineskip}}
\renewcommand{\closing}[1]{\par\vspace{1\baselineskip}
  \begin{minipage}{\textwidth}
    #1\par
    \vspace{3\baselineskip}
    \mbox{}\fromsig\\
    \mbox{}\xeuioletter@mytitle\\
    \leavevmode \hspace*{85mm}%
\begin{minipage}{85mm}
  \mbox{}%
  \ifthenelse{\equal{\xeuioletter@countersign}{}}{}
    {\xeuioletter@countersign\\}%
  \mbox{}%
  \ifthenelse{\equal{\xeuioletter@countertitle}{}}{}
    {\xeuioletter@countertitle}
\end{minipage}\par
    \mbox{}%
\ifthenelse{\equal{\xeuioletter@executive}{}}{}
  {\par \vspace*{\parskip}
   \mbox{}\xeuioletter@executive
   \ifthenelse{\equal{\xeuioletter@execaddr}{}}{}
     {\\ \emph{\xeuioletter@execaddr}}
  }
  \end{minipage}\par
  \vspace{\parskip}
\setlength{\parskip}{0pt}}
\endinput
