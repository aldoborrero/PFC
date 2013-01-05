%% -----------------------------------------------------------------------------------------------------
%% Estilos para el PFC de Aldo Borrero
%%
%% Inspirado en UiO LaTeX Thesis Class creado por Eivind Uggedal
%% y éste a su vez en Robert Bringhurst
%% -----------------------------------------------------------------------------------------------------

	\ProvidesClass{UAHMemoir}
	\NeedsTeXFormat{LaTeX2e}

	% Documento base del que partimos: Memoria
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
	\ProcessOptions
	\LoadClass{memoir}
	
%% -----------------------------------------------------------------------------------------------------
%% Disposición de los elementos
%% -----------------------------------------------------------------------------------------------------
	% Geometria (para modificar los márgenes)
	\RequirePackage[a4paper, centering]{geometry}
	
	% Con el comando \layout nos muestra los márgenes que estamos usando
	%\RequirePackage{layout} 
	
%% -----------------------------------------------------------------------------------------------------
%% Estilo del documento (lo bonito del asunto)
%% -----------------------------------------------------------------------------------------------------
	% Estilo del Título
	\RequirePackage{datetime}
	\newdateformat{fechapersonalizada}{\monthname[\THEMONTH] \THEYEAR}

	\RequirePackage{pdfpages}
	\renewcommand{\maketitle}{
  	\includepdf[pages={1,{}}]{Portada}

  	\begin{titlingpage}
    		\begin{center}

        			{\LARGE\color{title}\seclclu{Gestión dinámica de grupos}} \\
        			\vspace{2pc}
        			{\LARGE\textit{{en una plataforma virtual}}} \\
        			\vspace{2pc}
        			{\LARGE\color{title} \seclclu{basada en TikiWiki}} \\

        			\vspace{3pc}
        			\includegraphics[width=\linewidth]{../graphics/johnny_automatic_Jack_and_King_Arthur.eps}
        			\vspace{3pc}

			\vfill\null
	
        			{\large \@author} \\

        			\vspace{1pc}

        			{\large \textsc{\fechapersonalizada\today}} \\

        			\vfill\null

        			\textit{
        			Proyecto Fin de Carrera redactado \\ 
        			para la obtención del título de \\
        			Ingeniería Técnica en Informática de Sistemas
        			}
        
         			\vfill\null
         
         			\textit{Versión 1.2}
         
     		\end{center}
    	\clearpage
  	\end{titlingpage}
	}


	% Estilo de las partes
	\renewcommand{\partnamefont}{\centering\LARGE\scshape\MakeUppercase}
	\renewcommand{\partnumfont}{\LARGE\scshape\MakeUppercase}
	\renewcommand{\parttitlefont}{\centering\color{partnum}\LARGE\scshape}
	\renewcommand{\printparttitle}[1]{\parttitlefont\seclclu{#1}}

	% Estilo del capítulo
	\makechapterstyle{UAHChapter}{
		\renewcommand{\chaptername}{}
  		\renewcommand{\chapnamefont}{\centering\large\MakeUppercase}
  		\renewcommand{\chapnumfont}{\HUGE}
  		\renewcommand{\printchaptertitle}[1]{%
  			\color{azul}\centering\titlefont\LARGE\seclclu{##1}
   		}
	}
	
	\chapterstyle{UAHChapter}
	
	% Truco para conseguir espaciado de letras en los titulos (http://tex.stackexchange.com/questions/52872/kerning-titles-with-lualatex/52935)
	\def\seclcls#1{\textls*[80]{\MakeLowercase{#1}}}
	\def\seclclu#1{\textls*[80]{\MakeUppercase{#1}}}
	
	% Estilos de los titulos de las secciones
	\setsecheadstyle{\scshape\raggedright\Large\addfontfeatures{Renderer=Basic}\seclcls}
	\setsubsecheadstyle{\raggedright\large\itshape}
	\setsubsubsecheadstyle{\raggedright\itshape}

	% Estilo de la cabecera y pie de página
	\usepackage[automark,nouppercase]{scrpage2}
	
	%\clearscrheadfoot

	\renewcommand*{\headfont}{\scshape\MakeUppercase}
	%\renewcommand*{\chaptermarkformat}{\thechapter\autodot\enskip}

	%\chead[]{\chaptermark}
	%\cfoot[\pagemark]{\pagemark}
	
	%\renewcommand{\thechapter}{}
	\renewcommand{\chaptername}{}
	%\renewcommand{\chaptermark}{}
	
	\deftripstyle{UAHMemoirStyle}%
		{}{\headmark}{}%
		{}{\pagemark}{}
	
	\pagestyle{UAHMemoirStyle}
	
	% Empty part page style
	\aliaspagestyle{part}{empty}

	% Indice de contenidos
	\maxtocdepth{section}

	\renewcommand{\cftpartfont}{\large}
	\renewcommand{\cftpartleader}{}
	\renewcommand{\cftpartafterpnum}{\cftparfillskip}
	\cftsetindents{part}{1.5em}{0em}
	\renewcommand{\partnumberline}[1]{}
	\cftpagenumbersoff{part}

	\renewcommand{\cftchapterfont}{\normalsize}
	\renewcommand{\cftchapterpagefont}{\normalsize}
	\renewcommand{\cftchapterpresnum}{\hspace*{-1.5em}\color{tocchapnum}}
	\cftsetindents{chapter}{1.5em}{0em}
	\renewcommand{\cftchapterleader}{}
	\renewcommand{\cftchapterafterpnum}{\cftparfillskip}

	\renewcommand{\cftsectionfont}{\small}
	\renewcommand{\cftsectionpagefont}{\small}
	\cftsetindents{section}{1.5em}{2.3em}
	\renewcommand{\cftsectionleader}{}
	\renewcommand{\cftsectionafterpnum}{\cftparfillskip}

	% Lista de Figuras
	\renewcommand{\cftfigureleader}{ }
	\renewcommand{\cftfigureafterpnum}{\cftparfillskip}

	% Lista de Tablas
	\renewcommand{\cfttableleader}{ }
	\renewcommand{\cfttableafterpnum}{\cftparfillskip}
	
	% Paragraph break
	\newcommand{\parabreak}{%
  		\fancybreak{%
    		\vspace{\baselineskip}
    		\Large\char"0E0C9
    		\vspace{\baselineskip}
  	}
}

%% -----------------------------------------------------------------------------------------------------
%% Tipografías 
%% -----------------------------------------------------------------------------------------------------
	% Tipografías
	\RequirePackage{fontspec} 
	\RequirePackage{xunicode}
	\RequirePackage{setspace}

	\defaultfontfeatures{
		Ligatures={TeX},
		Numbers=OldStyle,
	}
	
	\setmainfont{Minion Pro}	
	\setsansfont{Linux Biolinum O}
	\setmonofont[Scale=MatchLowercase]{Droid Sans Mono Slashed}
	
	\newfontfamily\titlefont[Style=TitlingCaps, Kerning=Uppercase]{Minion Pro}
	\newfontface\codefont[Scale=MatchLowercase]{Droid Sans Mono Slashed}
	\newfontfamily\workfont[Ligatures={Rare}, Numbers={OldStyle}, Contextuals={Swash, WordInitial, WordFinal}, Style={Alternate}]{Minion Pro}
	
	% Tamaño de la rejilla: 12/14 pt -> 12 * 1.25 = 15
	\linespread{1.25}
	
	% Microtipografía
	\RequirePackage[final=true, step=1]{microtype} 
	\RequirePackage{ragged2e}
	
	% Drop Caps (Letras capitales)
	\RequirePackage{lettrine} 
	\setcounter{DefaultLines}{3}
	\setlength{\DefaultNindent}{0.6em}
	\setlength{\DefaultFindent}{-2pt}
	
	% Tamaño de la indentación del párrafo
	\setlength{\parindent}{1.25em}
	
	% Penalización de lineas viudas (widow lines)
	% Intentamos que TeX las evite al máximo posible
	\widowpenalty=10000
	\clubpenalty=10000
	
%% -----------------------------------------------------------------------------------------------------
%% Lenguaje (traducción al español de los diferentes elementos)
%% -----------------------------------------------------------------------------------------------------
	% Eliminamos que los párrafos se indenten al principio de cada sección.
	% Eliminamos los puntos extras en cada sección: 2.1. -> 2.1
	\RequirePackage[spanish, es-nosectiondot, es-noindentfirst]{babel}
	
	%\addto\captionsspanish{
	%	\def\tablename{Tabla}
	%	\def\listtablename{Lista de tablas}
		%\def\listfigurename{Lista de figuras}
	%	\def\lstlistingname{Listado}
	%}
	
	%\listofpyglistingsname{Listado de Código Fuente}
	\renewcommand{\appendixtocname}{Apéndices}
	\renewcommand{\appendixpagename}{Apéndices}
	
	% Eliminamos el titulo de Capitulo 2 y nos quedamos solo con el numero
	\addto\captionsspanish{%
		 \renewcommand\chaptername{}
		 \renewcommand\appendixname{}
		 \renewcommand\partname{}}
		
%% -----------------------------------------------------------------------------------------------------
%% Colores
%% -----------------------------------------------------------------------------------------------------
	\RequirePackage{xcolor}

	\definecolor{azul}{HTML}{005AAA}
	\definecolor{gris}{HTML}{EFEFEF}
	\definecolor{gris-oscuro}{HTML}{CCCCCC}

	\colorlet{title}{azul}
	\colorlet{tocchapnum}{azul}
	\colorlet{urlcolor}{azul}
	\colorlet{partnum}{azul}
	
%% -----------------------------------------------------------------------------------------------------
%% Gráficos (imágenes)
%% -----------------------------------------------------------------------------------------------------
	\RequirePackage{graphicx}

%% -----------------------------------------------------------------------------------------------------
%% Listados genéricos
%% -----------------------------------------------------------------------------------------------------
	%\RequirePackage[bf, SL, BF] {subfigure}
	\RequirePackage{caption} 
	\captionsetup[figure]{font={footnotesize,sf}}
	\captionsetup[table]{font={footnotesize,sf}}

%% -----------------------------------------------------------------------------------------------------
%% Listados de código
%% -----------------------------------------------------------------------------------------------------
	\RequirePackage{fancyvrb}
	\RequirePackage{verbments}
		
	\plset {
		fontsize=\footnotesize,
		texcl=false, % Codigo LaTeX dentro de los comentarios
		style=pastie,
		fvset={
			frame=leftline,
		},
		numbers=left,
		listingname=Código,
		listingnamefont=\sffamily,
		captionfont=\sffamily,
	}
	
%% -----------------------------------------------------------------------------------------------------
%% Bibliografía
%% -----------------------------------------------------------------------------------------------------
	\RequirePackage[natbib=true, backend=biber, sortlocale=es]{biblatex}
	
%% -----------------------------------------------------------------------------------------------------
%% PDF y URLs
%% -----------------------------------------------------------------------------------------------------
	% PDF
	\RequirePackage{hyperref} 

	% Metadatos del PDF
	\hypersetup{
		pdfauthor={Aldo Borrero González},
		pdftitle={Gestión dinámica de grupos en una plataforma de aprendizaje virtual basada en TikiWiki},
		pdfsubject={Proyecto Fin de Carrera de Aldo Borrero González para la UAH},
		pdfkeywords={YAML} {PFC} {UAH} {Aldo Borrero} {TikiWiki} {Profiles},
		pdfproducer={LuaLaTeX with Hyperref package},
		pdfcreator={LuaLaTeX}
	}

	% Urls
	\hypersetup{
		colorlinks=true,
		linkcolor=black,
		anchorcolor=black,
		citecolor=black,
		urlcolor=urlcolor,
		breaklinks,
		pdfborder=0 0 0,
	}

	\urlstyle{sf}
	
%% -----------------------------------------------------------------------------------------------------
%% Glosario (puesto al final por dependencias con el paquete hyperref)
%% -----------------------------------------------------------------------------------------------------
% Acrónimos y glosario
	\RequirePackage[acronym, toc, nomain]{glossaries}
	
	% Quitamos el punto al final de las descripciones del glosario
	\renewcommand*{\glspostdescription}{}