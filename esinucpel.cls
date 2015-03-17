%==============================================================================
% Identificação
%==============================================================================
\def\currversion{14/12/2006}

\typeout{^^J^^J
--------------------------------------------------^^J
CLASSE esinucpel^^J
Formatação de Documentos da ESIN^^J
--------------------------------------------------^^J
Desenvolvida a partir da Classe IIUFRGS^^J
por Marilton S. de Aguiar (marilton@ucpel.tche.br)^^J
--------------------------------------------------^^J
Versão: \currversion^^J
--------------------------------------------------^^J^^J}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esinucpel}[\currversion]
\RequirePackage{eso-pic}

\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\pesquisa}[1]{\gdef\@pesquisa{#1}}
\newcommand{\mestrado}[1]{\gdef\@mestrado{#1}}
\newcommand{\complementares}[1]{\gdef\@complementares{#1}}
\newcommand{\planodopep}[1]{\gdef\@planodopep{#1}}

%==============================================================================
% Declaração de opções
%==============================================================================
\newcommand{\eiu@novodoc}[1]{\DeclareOption{#1}{\AtEndOfClass{\input{#1.def}}}}
\eiu@novodoc{pg}
\eiu@novodoc{pg1}
\eiu@novodoc{pg2}
\eiu@novodoc{ap}
\eiu@novodoc{ranual}
\eiu@novodoc{rparcial}
\eiu@novodoc{rfinal}
\eiu@novodoc{racompl}
\eiu@novodoc{ti}
\eiu@novodoc{pep}

\DeclareOption{ccc}{\course{\ccc}}
\DeclareOption{cas}{\course{\cas}}
\DeclareOption{tpd}{\course{\tpd}}
\DeclareOption{ppginf}{\mestrado{\ppginf}}

\DeclareOption{english}{\@englishtrue\OptionNotUsed}\newif\if@english
\DeclareOption{oneside}{\AtEndOfClass{\@twosidefalse}\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%==============================================================================
% Herança da classe `report' e inclusão de pacotes e arquivos necessários
%==============================================================================
\LoadClass[12pt,a4paper,twoside]{report}
\RequirePackage[english,brazilian]{babel}

\newcommand{\periodo}[2]{
        \gdef\@inicio{#1}
        \gdef\@fim{#2}
}

\newcommand{\horas}[1]{
        \gdef\@horas{#1}
}

\newcommand{\modalidade}[1]{
        \gdef\@modalidade{#1}
}

%
% definições para textos em português
%
\@namedef{captionsbrazilian}{%
        \def\bibname{Refer{\^e}ncias}%
        \def\abstractname{Resumo}%
        \def\appendixname{Ap{\^e}ndice}%
        \def\contentsname{Sum{\'a}rio}%
        \def\listfigurename{Lista de Figuras}%
        \def\listtablename{Lista de Tabelas}%
        \def\figurename{Figura}%
        \def\tablename{Tabela}%
        \def\advisorname{Orientador}%
        \def\coadvisorname{Co-orientador}%
        \def\collaboratorname{Colaborador}%
        \def\listabbrvname{Lista de Abreviaturas e Siglas}%
        \def\listsymbolname{Lista de S{\'\i}mbolos}%
        \def\annexname{Anexo}%
        \def\keywordsname{Palavras-chave}%
        \def\byname{por}%
        \def\pgname{Projeto de Gradua\c c\~ao}%
        \def\tiname{Trabalho Individual}%
        \def\pepname{PEP -- Plano de Estudo e Pesquisa}%
        \def\pepspecificinfo{%
                \hfill PEP -- Plano de Estudo e Pesquisa
        }%
        \def\tispecificinfo{%
                \hfill Trabalho Individual
        }%
        \def\pgspecificinfo{%
                Projeto de Gradua\c c\~ao submetido como requisito parcial
                \`a obten{\c{c}}{\~a}o do grau de Bacharel em \@course
        }%
        \def\pgumspecificinfo{%
                Monografia submetida como requisito parcial
                \`a aprova{\c{c}}{\~a}o em Projeto~de~Gradua\c c\~ao~I
}% 
        \def\apname{Anteprojeto de Gradua\c c\~ao}%
        \def\apspecificinfo{%
                Anteprojeto de Gradua\c c\~ao submetido como requisito parcial
                \`a obten{\c{c}}{\~a}o do grau de Bacharel em \@course
        }%
        \def\ranualname{Relat\'orio Anual de Projeto de Pesquisa}%
        \def\ranualspecificinfo{Relat\'orio Anual de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%

        \def\rparcialname{Relat\'orio Parcial}%
        \def\rparcialspecificinfo{Relat\'orio Parcial de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
        \def\rfinalname{Relat\'orio Final}%
        \def\rfinalspecificinfo{Relat\'orio Final de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalide}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
        \def\racomplname{Relat\'orio das Atividades Complementares}%
        \def\racomplspecificinfo{Relat\'orio de Trabalho de Inicia\c c\~ao Cient\'{i}fica\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
}
\@namedef{datebrazilian}{%
        \def\monthname{%
                \ifcase\month\or%
                        janeiro\or fevereiro\or mar{\c{c}}o\or abril\or%
                        maio\or junho\or julho\or agosto\or setembro\or%
                        outubro\or novembro\or dezembro%
                \fi%
        }%
        \def\ei@date{\@publmonth\ de~\@publyear}%
}

%
% definições para textos em inglês
%
\@namedef{captionsenglish}{%
        \def\bibname{References}%
        \def\abstractname{Abstract}%
        \def\appendixname{Appendix}%
        \def\contentsname{Contents}%
        \def\listfigurename{List of Figures}%
        \def\listtablename{List of Tables}%
        \def\figurename{Figure}%
        \def\tablename{Table}%
        \def\advisorname{Advisor}%
        \def\coadvisorname{Coadvisor}%
        \def\collaboratorname{Collaborator}%
        \def\listabbrvname{List of Abbreviations and Acronyms}%
        \def\listsymbolname{List of Symbols}%
        \def\annexname{Annex}%
        \def\keywordsname{Keywords}%
        \def\byname{by}%
        \def\pgname{Projeto de Gradua\c c\~ao}%
        \def\tiname{Trabalho Individual}%
        %\def\pepname{PEP -- Plano de Estudo e Pesquisa}%
        %\def\pepspecificinfo{%
        %        \hfill PEP -- Plano de Estudo e Pesquisa
        %}%
        \def\tispecificinfo{%
                \hfill Trabalho Individual
        }%
        \def\pgspecificinfo{%
                Projeto de Gradua\c c\~ao submetido como requisito parcial
                \`a obten{\c{c}}{\~a}o do grau de Bacharel em \@course
        }%
        \def\pgumspecificinfo{%
                Monografia submetida como requisito parcial
                \`a aprova{\c{c}}{\~a}o em Projeto~de~Gradua\c c\~ao~I
        }% 
        \def\apname{Anteprojeto de Gradua\c c\~ao}%
        \def\apspecificinfo{%
                Anteprojeto de Gradua\c c\~ao submetido como requisito parcial
                \`a obten{\c{c}}{\~a}o do grau de Bacharel em \@course
        }%
        \def\ranualname{Relat\'orio Anual de Projeto de Pesquisa}%
        \def\ranualspecificinfo{Relat\'orio Anual de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%

        \def\rparcialname{Relat\'orio Parcial}%
        \def\rparcialspecificinfo{Relat\'orio Parcial de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
        \def\rfinalname{Relat\'orio Final}%
        \def\rfinalspecificinfo{Relat\'orio Final de Projeto de Pesquisa\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
        \def\racomplname{Relat\'orio das Atividades Complementares}%
        \def\racomplspecificinfo{Relat\'orio de Trabalho de Inicia\c c\~ao Cient\'{i}fica\\Per\'{i}odo: \@inicio\ --\ \@fim\@ifundefined{@modalidade}{}{\\Bolsa: \@modalidade}\@ifundefined{@horas}{}{\\Horas Semanais: \@horas h}}%
}
\@namedef{dateenglish}{%
        \def\monthname{%
                \ifcase\month\or%
                        January\or February\or March\or April\or%
                        May\or June\or July\or August\or September\or%
                        October\or November\or December%
                \fi%
        }%
        \def\ei@date{\@publmonth~\@publyear}%
}


\if@english
        \selectlanguage{english}
        \AtBeginDocument{\selectlanguage{english}}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{esindefs}
\RequirePackage{natbib}
\RequirePackage{times}
\RequirePackage{setspace}

%==============================================================================
% Margens do texto
%==============================================================================
\newlength{\ei@topmargin}\setlength{\ei@topmargin}{30mm}
\newlength{\ei@pagenummargin}\setlength{\ei@pagenummargin}{25mm}
\newlength{\ei@bottommargin}\setlength{\ei@bottommargin}{25mm}
\newlength{\ei@sidemargin}\setlength{\ei@sidemargin}{30mm}

% ajuste das medidas verticais
\setlength{\topmargin}{\ei@pagenummargin}
        \addtolength{\topmargin}{-1em} % isto é +- a altura do núm. da página
        \addtolength{\topmargin}{-1in}
\setlength{\headheight}{1em}
\setlength{\headsep}{\ei@topmargin}
        \addtolength{\headsep}{-\ei@pagenummargin}
\setlength{\textheight}{\paperheight}
        \addtolength{\textheight}{-\ei@topmargin}
        \addtolength{\textheight}{-\ei@bottommargin}
\setlength{\footskip}{\ei@bottommargin}

% ajuste das medidas horizontais
\setlength{\oddsidemargin}{\ei@sidemargin}
        \addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\textwidth}{\paperwidth}
        \addtolength{\textwidth}{-2\ei@sidemargin}

%==============================================================================
% Numeração das páginas
%==============================================================================
\def\ps@esinucpel{
        \let\@oddfoot\@empty
        \let\@evenfoot\@empty
        \def\@evenhead{\hspace*{\fill}{\small\thepage}\hspace*{\fill}}
        \def\@oddhead{\hspace*{\fill}{\small\thepage}\hspace*{\fill}}
}
\pagestyle{empty}
\let\ps@plain\ps@empty

%==============================================================================
% Definição de autor(es), orientador e co-orientador
%==============================================================================
\newcounter{ei@authorcount}
\renewcommand{\author}[2]{
        \addtocounter{ei@authorcount}{1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}last\endcsname{#1}
        \expandafter\gdef\csname @author\alph{ei@authorcount}first\endcsname{#2}
        \expandafter\gdef\csname @author\alph{ei@authorcount}\endcsname{#2 #1}
}

\newcounter{ei@advisorcount}
\DeclareRobustCommand{\advisor}[3][]{
        \addtocounter{ei@advisorcount}{1}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @advisor\alph{ei@advisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@coadvisorcount}
\DeclareRobustCommand{\coadvisor}[3][]{
        \addtocounter{ei@coadvisorcount}{1}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}last\endcsname{#2}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}first\endcsname{#3}
        \expandafter\gdef\csname @coadvisor\alph{ei@coadvisorcount}\endcsname{#1~#3 #2}
}

\newcounter{ei@collaboratorcount}
\DeclareRobustCommand{\collaborator}[3][]{
        \addtocounter{ei@collaboratorcount}{1}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}last\endcsname{#2}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}first\endcsname{#3}
        \expandafter\gdef\csname @collaborator\alph{ei@collaboratorcount}\endcsname{#1~#3 #2}
}


%==============================================================================
% Definição das palavras-chave (máx. 10)
%==============================================================================
\newcounter{kwcounter}
\newcommand{\keyword}[1]{
        \addtocounter{kwcounter}{1}
        \expandafter\gdef\csname keyw\alph{kwcounter}\endcsname{#1}
}

\newcommand{\@abstractkw}{%
        \@ifundefined{keywa}{}{\expandafter\MakeUppercase\keywa}%
        \@ifundefined{keywb}{}{, \keywb}%
        \@ifundefined{keywc}{}{, \keywc}%
        \@ifundefined{keywd}{}{, \keywd}%
        \@ifundefined{keywe}{}{, \keywe}%
        \@ifundefined{keywf}{}{, \keywf}%
        \@ifundefined{keywg}{}{, \keywg}%
        \@ifundefined{keywh}{}{, \keywh}%
        \@ifundefined{keywi}{}{, \keywi}%
        \@ifundefined{keywj}{}{, \keywj}%
}

%==============================================================================
% Redefinição da data (para ter mês e ano separados)
%==============================================================================
\renewcommand{\date}[2]{
        \gdef\@publmonth{#1}
        \gdef\@publyear{#2}
}
\date{\monthname}{\number\year}

%==============================================================================
% Definição padrão da folha de rosto.
% Os dados específicos do tipo de trabalho (dissertação, tese, etc.) são
% informados definindo-se o comando \titlepagespecificinfo. Veja os
% arquivos .def incluídos com a classe.
%==============================================================================
\newlength{\titlepagewinwidth}\setlength{\titlepagewinwidth}{130mm}
\newlength{\titlepagewinheight}\setlength{\titlepagewinheight}{40mm}
\newlength{\titlepagewinvoffset}\setlength{\titlepagewinvoffset}{130mm}

\newcommand{\location}[2]{
        \gdef\@city{#1}
        \gdef\@state{#2}
}


\location{Pelotas}{RS}

\renewcommand{\maketitle}{%
        \begin{titlepage}
          \thetitlepage
        \end{titlepage}% 
        \clearpage 
        \setcounter{page}{2}%
}

\newcommand{\thetitlepage}{%
        \noindent\@topbox\\[1.5cm]
        %\vfill
        \@ifundefined{titlepagespecificinfo}{}{
                \hspace*{\fill}\makebox[.6\textwidth][l]{%
                        \parbox[b]{10cm}{\large\raggedright\titlepagespecificinfo}%
                }
                \vfill
        }
        \@ifundefined{@advisora}{}{
                \@ifundefined{@planodopep}{%
                \hspace*{3cm}\parbox[b]{.6\textwidth}{%
                        {\large\titlepageadvisorinfo}}}
                        {%
                        \begin{center}
			\large\titlepageadvisorinfo
			\end{center}
			\vskip 2.5cm 
                        }
                \vfill
        }
        {\large\centerline{\@city, \ei@date}}
}

\def\@topbox{%
        \parbox[t]{\textwidth}{%
                \centering%
                \vbox to \titlepagewinvoffset{%
                        \titlepagetopinfo
                        \vfill
                        \@ifundefined{@complementares}{}{\large\bfseries\MakeUppercase{ATIVIDADES COMPLEMENTARES}\\\MakeUppercase{PARA O CURSO DE \@course}\vfill}
                        \@ifundefined{@planodopep}{}{\large\bfseries\MakeUppercase{PLANO DE ESTUDO E PESQUISA}\vfill} % TODO replace this with author name
                        \@winbox
                }
        }
}
\def\@winbox{%
        \parbox[b]{\titlepagewinwidth}{%
        \centering\vbox to \titlepagewinheight{%
                %\vspace*{\fill}
                {\LARGE\textbf{\@title}\par}
                %\vspace{\stretch{4}}
                \vfill
                \@ifundefined{@planodopep}{%
                {\large por\\\@authora}\\
                \@ifundefined{@authorb}{}{\large\@authorb\\}%
                \@ifundefined{@authorc}{}{\large\@authorc\\}%
                \@ifundefined{@authord}{}{\large\@authord\\}%
		}{{\vskip 2.5cm \large \@authora}}
                \vfill
        }}%
}

\newcommand{\titlepagetopinfo}{%
        \MakeUppercase{\large\university}\\[.2cm]
        % \MakeUppercase{\large\esin}\\[.2cm]
        \@ifundefined{@pesquisa}%
	{%
	\@ifundefined{@mestrado}
	{%
	\MakeUppercase{\large Curso de \@course}\\%
	}%
	{%
	\MakeUppercase{\large \@mestrado}\\%
	}%
	}%
	{%
	\MakeUppercase{\large \@pesquisa}\\[.2cm]%
        \MakeUppercase{\large Curso de \@course}\\%
	}%
}


\newcommand{\titlepageadvisorinfo}{%
\vfill
        \@ifundefined{@planodopep}{%
        \begin{tabular}{rp{9cm}}
        \@ifundefined{@advisora}{}{
        \@ifundefined{@advisorb}{\advisorname:}{\advisorname es:} &
        \@ifundefined{@advisora}{}{\@advisora\\}
        \@ifundefined{@advisorb}{}{\ &} 
        \@ifundefined{@advisorb}{}{\@advisorb\\}
        \@ifundefined{@advisorc}{}{\ &} 
        \@ifundefined{@advisorc}{}{\@advisorc\\}
        \@ifundefined{@advisord}{}{\ &} 
        \@ifundefined{@advisord}{}{\@advisord\\}}
        \@ifundefined{@coadvisora}{}{
        \@ifundefined{@coadvisorb}{\coadvisorname:}{\coadvisorname es:} &
        \@ifundefined{@coadvisora}{}{\@coadvisora\\}
        \@ifundefined{@coadvisorb}{}{\ &} 
        \@ifundefined{@coadvisorb}{}{\@coadvisorb\\}
        \@ifundefined{@coadvisorc}{}{\ &} 
        \@ifundefined{@coadvisorc}{}{\@coadvisorc\\}
        \@ifundefined{@coadvisord}{}{\ &} 
        \@ifundefined{@coadvisord}{}{\@coadvisord\\}}
        \@ifundefined{@collaboratora}{}{
        \@ifundefined{@collaboratorb}{\collaboratorname:}{\collaboratorname es:} &
        \@ifundefined{@collaboratora}{}{\@collaboratora\\}
        \@ifundefined{@collaboratorb}{}{\ &} 
        \@ifundefined{@collaboratorb}{}{\@collaboratorb\\}
        \@ifundefined{@collaboratorc}{}{\ &} 
        \@ifundefined{@collaboratorc}{}{\@collaboratorc\\}
        \@ifundefined{@collaboratord}{}{\ &} 
        \@ifundefined{@collaboratord}{}{\@collaboratord\\}}
        \end{tabular}}{%
        \begin{tabular}{c}
        \@ifundefined{@advisora}{}{
        \@ifundefined{@advisora}{}{\@advisora\\}
        \@ifundefined{@advisorb}{}{\@advisorb\\}
        \@ifundefined{@advisorc}{}{\@advisorc\\}
        \@ifundefined{@advisord}{}{\@advisord\\}
        \@ifundefined{@advisorb}{\advisorname\\}{\advisorname es\\}}
        \@ifundefined{@coadvisora}{}{
        \@ifundefined{@coadvisora}{}{\@coadvisora\\}
        \@ifundefined{@coadvisorb}{}{\@coadvisorb\\}
        \@ifundefined{@coadvisorc}{}{\@coadvisorc\\}
        \@ifundefined{@coadvisord}{}{\@coadvisord\\}
        \@ifundefined{@coadvisorb}{\coadvisorname\\}{\coadvisorname es\\}}
        \@ifundefined{@collaboratora}{}{
        \@ifundefined{@collaboratora}{}{\@collaboratora\\}
        \@ifundefined{@collaboratorb}{}{\@collaboratorb\\}
        \@ifundefined{@collaboratorc}{}{\@collaboratorc\\}
        \@ifundefined{@collaboratord}{}{\@collaboratord\\}
        \@ifundefined{@collaboratorb}{\collaboratorname\\}{\collaboratorname es\\}}
        \end{tabular}}
}
%}

%==============================================================================
% Ajuste do sumário (nada indentado) 
%==============================================================================
\newlength{\ei@chapnumindent}\setlength{\ei@chapnumindent}{1.8em}
\renewcommand*{\l@chapter}[2]{
        \addpenalty{-\@highpenalty}
        \vskip -1ex \@plus\p@
        \setlength\@tempdima{1.5em}
        \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode\bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        \@dottedtocline{0}{0em}{\ei@chapnumindent}{\MakeUppercase{#1}}{#2}
        \penalty\@highpenalty
        \endgroup
}
\renewcommand*{\l@section}[2]{\@dottedtocline{1}{0em}{2.8em}{\textbf{#1}}{#2}}
\renewcommand*{\l@subsection}{\@dottedtocline{2}{0em}{3.7em}}
\newif\if@aftertoc
\@aftertocfalse
\renewcommand{\tableofcontents}{%
        \chapter*{\contentsname}
        \@starttoc{toc}\@aftertoctrue%
}

%==============================================================================
% Definição das listas de abreviaturas e siglas e de símbolos
%==============================================================================
\newenvironment{listofabbrv}[1]{
        \chapter*{\listabbrvname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}
\newenvironment{listofsymbols}[1]{
        \chapter*{\listsymbolname}
        \begin{list}{\textbf{??}}{
                \settowidth{\labelwidth}{#1}
                \setlength{\labelsep}{1em}
                \setlength{\itemindent}{0mm}
                \setlength{\leftmargin}{\labelwidth}
                \addtolength{\leftmargin}{\labelsep}
                \setlength{\rightmargin}{0mm}
                \setlength{\itemsep}{.1\baselineskip}
                \renewcommand{\makelabel}[1]{\makebox[\labelwidth][l]{##1}}
        }
}{
        \end{list}
}

%==============================================================================
% Resumo (abstract) e Abstract (englishabstract)
%==============================================================================
\renewenvironment{abstract}{%
        \chapter*{\abstractname}
}{%
        \par\vfill
        \noindent\textbf{\keywordsname:} \@abstractkw.
}
\newenvironment{englishabstract}[2]{%
        \if@openright\cleardoublepage\else\clearpage\fi%
        \gdef\@englishkeywords{#2}%
        \iflanguage{english}{
                \begin{otherlanguage}{brazilian}
        }{
                \begin{otherlanguage}{english}
        }
                \chapter*{\abstractname}
                % os 22ex abaixo fazem o título em inglês iniciar a
                % aproximadamente 5cm da borda superior
                \noindent\raisebox{22ex}[0pt][0pt]{%
                       \parbox[t]{\textwidth}{{\bf TITLE:} ``\MakeUppercase{#1}''}
                }\vspace{-\baselineskip}\par
}{
        \par\vfill
        \noindent\textbf{\keywordsname:} \@englishkeywords.
        \end{otherlanguage}
}

%==============================================================================
% Formatação dos capítulos.
% Os comandos \@chapter e \@schapter são redefinidos para que a
% numeração de páginas seja correta (deve aparecer somente a partir do
% primeiro capítulo do texto, mas não nas páginas iniciais de
% capítulos).
% Os comandos \@makechapterhead e \@makeschapterhead fazem a
% formatação dos títulos propriamente ditos.
%==============================================================================
\newcommand{\ei@chapterfont}{\@setfontsize\Large{16}{20}}
\def\@chapapp{}
\def\@chapter[#1]#2{%
        \refstepcounter{chapter}%
        \addcontentsline{toc}{chapter}{\protect\numberline{\@chapapp\thechapter}#1}%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
        \pagestyle{esinucpel}\let\ps@plain\ps@esinucpel%
        \@makechapterhead{#2}\@afterheading
}
\def\@makechapterhead#1{%
        \vspace*{90pt}
        \reset@font\noindent{\ei@chapterfont\LARGE\textbf{\@chapapp\thechapter\hspace{1em}\MakeUppercase{#1}}\par}
        \addvspace{42pt}
}
\def\@schapter#1{%
        \if@aftertoc\addcontentsline{toc}{chapter}{#1}\fi%
        \addtocontents{lof}{\protect\addvspace{10\p@}}%
        \addtocontents{lot}{\protect\addvspace{10\p@}}%
        \@makeschapterhead{#1}\@afterheading
}
\def\@makeschapterhead#1{%
        \vspace*{90pt}
        \reset@font\centerline{\ei@chapterfont\LARGE\textbf{\MakeUppercase{#1}}}
        \addvspace{42pt}
}
\renewcommand{\appendix}[1][\appendixname]{%
        \setcounter{chapter}{0}%
        \renewcommand{\thechapter}{\Alph{chapter}}%
        \setcounter{tocdepth}{0}%
        \@captionlistingfalse%
        \gdef\@chapapp{\MakeUppercase{#1}\space}%
        \addtocontents{toc}{%
          \settowidth{\ei@chapnumindent}{{\LARGE\textbf{\@chapapp}}}
          \addtolength{\ei@chapnumindent}{1.8em}
        }%
}
\newcommand{\annex}{\appendix[\annexname]}

%==============================================================================
% Formatação das seções
%==============================================================================
\setcounter{secnumdepth}{4}
\renewcommand{\section}{%
        \@startsection{section}{1}{0pt}{18pt}{9pt}{\reset@font\Large\bfseries}
}
\renewcommand{\subsection}{%
        \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\reset@font\large\bfseries}
}
\renewcommand{\subsubsection}{%
        \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\reset@font\bfseries}
}
\renewcommand{\paragraph}{%
        \@startsection{paragraph}{4}{0pt}{12pt}{6pt}{\reset@font}
}
\renewcommand{\subparagraph}{%
        \@startsection{subparagraph}{5}{0pt}{1ex}{-1em}{\reset@font\bfseries}
}

%==============================================================================
% Redefinição do conteúdo das listas de figuras e tabelas
%==============================================================================
\newif\if@captionlisting\@captionlistingtrue
\long\def\@caption#1[#2]#3{%
  \par
  \if@captionlisting%
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {\protect\numberline{\csname fnum@#1\endcsname}{\ignorespaces #2}}%
  \fi%
  \begingroup
    \@parboxrestore
    \if@minipage
      \@setminipage
    \fi
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup%
}
\renewcommand*{\l@figure}{\@dottedtocline{1}{0em}{5.5em}}
\let\l@table\l@figure

%==============================================================================
% Redefinição do formato de citações longas
%==============================================================================
\renewenvironment{quote}{%
        \small%
        \begin{list}{}{\setlength{\leftmargin}{40mm}\item\relax}
}{%
        \end{list}
}

%==============================================================================
% Ajuste do formato das citações e referências
%==============================================================================
\setlength{\bibhang}{0pt}
\let\cite\citep

% Indentação de Parágrafo
\parindent 1.25cm

% Espaço 1.5 entre linhas

\@ifundefined{@mestrado}{\onehalfspacing}{\singlespacing}

\newenvironment{dedicatoria}{%
        \clearpage%
        \em\itshape
        \mbox{}\vfill\begin{flushright}
}{
        \end{flushright}
}

\newenvironment{agradecimentos}{\chapter*{Agradecimentos}}{}

\newenvironment{epigrafe}{%
        \clearpage%
        \sffamily\itshape
        \mbox{}\vfill\begin{flushright}
}{
        \end{flushright}
}


