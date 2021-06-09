%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 文件:     f:\CUSTPaper\CustGraduPaper.cls
% 项目:     f:\CUSTPaper
% 创建时间: Wednesday, April 24th 2019, 11:47:25 pm
% 创作者: ElonH
% --------------------
% 最后修改时间: Sun May 19 2019
% 修改者: ElonH
% ----------------------------------------
% MIT License
% 
% Copyright (c) 2019 ElonH
% 
% Permission is hereby granted, free of charge, to any person obtaining a copy of
% this software and associated documentation files (the "Software"), to deal in
% the Software without restriction, including without limitation the rights to
% use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
% of the Software, and to permit persons to whom the Software is furnished to do
% so, subject to the following conditions:
% 
% The above copyright notice and this permission notice shall be included in all
% copies or substantial portions of the Software.
% 
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
% ----------------------------------------
% 更改日志:
% 日期       	说明
% -----------	------------------------------------
% 2019/05/19	目录页添加页眉，Chapter标题前后距离调整
% 2019/05/19	修复每一章节无页眉页脚
% 2019/05/19	公式样式调整
% 2019/05/19	摘要格式修正及添加提示
% 2019/05/19	修正附录序号样式
% 2019/05/19	附录图片和表格引用格式
% 2019/05/18	附录公式引用格式
% 2019/05/13	英文关键词加粗
% 2019/05/13	默认引用样式改为gbt7714-2015
% 2019/05/10	修复多引用问题
% 2019/05/09	添加章节引用样式
% 2019/04/26	表格, 插图, 参考文献, 脚注, 附录, 致谢页, pdf文件信息
% 2019/04/25	中英文摘要页,目录
% 2019/04/25	封面和声明页
% 2019/04/24	初始化
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% ============= beg 定义新类 =============

\def\CGP@name{CustGraduPaper}
\def\CGP@date{2019/04/24}
\def\CGP@version{v19.04}
\def\CGP@introduction{artical for CUST Graduation Paper}
\ProvidesClass{\CGP@name}
\NeedsTeXFormat{LaTeX2e}

% ============= end 定义新类 =============


% ============= beg 类选项 =============
\RequirePackage{xstring} % 使用条件语句 
% 页脚样式
\def\CGP@footlinelength{6.7cm}
\DeclareOption{footline}{\def\CGP@footlinelength{6.7cm}} % 有页脚线
\DeclareOption{nofootline}{\def\CGP@footlinelength{0cm}} % 无页脚线
% 文献样式
\def\CGP@citebst{gbt7714-2015}% TODO: 默认样式?
\DeclareOption{gbtcite}{\def\CGP@citebst{gbt7714-2005}} % 使用GBT7714-2005样式
\DeclareOption{gbt15cite}{\def\CGP@citebst{gbt7714-2015}} % 使用GBT7714-2015样式
\DeclareOption{tsinghuacite}{\def\CGP@citebst{thuthesis}} % 使用清华样式

\ProcessOptions
\ExecuteOptions{footline,gbtcite} % 默认选项
\relax
% ============= end 类选项 =============

% ============= beg 载入ctexbook类 =============
\LoadClass[
    a4paper, % A4(210*297), 幅面白色
    zihao=-4, % 正文字号: 小四
	UTF8, 
	oneside, % 单页样式
    scheme=chinese, % 中文排版方案
    punct = quanjiao, % 标点处理格式: 全角
    linespread=1.25, % 默认 1.25 倍行距 
    heading = true, % 启用章节标题风格修改
    autoindent = true, % 自动调整段首缩进, 缩进 2 个字符
]{ctexbook}[2016/12/27]

\RequirePackage{xeCJK}[2017/08/08]

% ============= end 载入ctexbook类 =============


% ============= beg 页面布局 =============
\RequirePackage{geometry}
%  上下边距 2.54cm，左右边距 3.17cm
\geometry{left=3.17cm,right=3.17cm,top=2.54cm,bottom=2.54cm}
% \geometry{headsep=1em,footskip=2em} % TODO: 无要求?
% \geometry{headheight=1.5cm}

% ============= end 页面布局 =============

% ============= beg 字距 =============
\renewcommand{\CJKglue}{\hskip 1pt} % 字间距: 标准 1pt
% ============= end 字距 =============

% ============= beg 字体设置 =============

\RequirePackage{fontspec}

% %% 西文字体
\setmainfont{Times New Roman} % 西文默认字体

% 中文字体
% 仿宋_GB2312 % NOTE: 改为官方使用的仿宋_GB2312
\setCJKfamilyfont{custfangsong}[
	Path=Fonts/,
	AutoFakeBold=true,
	AutoFakeSlant=true,
]{FangSong_GB2312.ttf}
\renewcommand{\fangsong}{\CJKfamily{custfangsong}}

% 宋体 % OPMZ: 默认无粗体
\setCJKfamilyfont{custsongti}[
	Path=Fonts/,
	% BoldFont=simsunbd.ttf, % 太粗
    % AutoFakeBold=false,
    AutoFakeBold = {2},
	AutoFakeSlant=true,
]{simsun.ttc}
\renewcommand{\songti}{\CJKfamily{custsongti}} 
% 黑体 % OPMZ: window 系统无需改写
\setCJKfamilyfont{custheiti}[
	Path=Fonts/,
	AutoFakeBold=false,
	AutoFakeSlant=false,
]{simhei.ttf}
\renewcommand{\heiti}{\CJKfamily{custheiti}}

% ============= end 字体设置 =============

% ============= beg 设置 CUST 论文封面 =============
%用于解析参数
\RequirePackage{kvsetkeys}
%添加图需要的库
\RequirePackage{graphicx}
%添加几个新的文档属性
\def \@author {} 												% 作者
\def \@cntitle {毕业论文中文题目}								 % 中文题目
\def \@entitle {The Subject of Graduation Project} 				% 英文题目
\def \@academy {} 												% 学院
\def \@department {} 											% 专业
\def \@stunum {} 												% 学号
\def \@instructor {} 											% 导师
\def \@date {\zhdigits{\the\year{}}年 \zhdigits{\the\month} 月} % 时间
\newcommand{\cntitle}[1]    {\def \@cntitle {#1}}
\newcommand{\entitle}[1]    {\def \@entitle {#1}}
\newcommand{\academy}[1]    {\def \@academy {#1}}
\newcommand{\department}[1] {\def \@department {#1}}
\newcommand{\stunum}[1]     {\def \@stunum {#1}}
\newcommand{\instructor}[1] {\def \@instructor {#1}}

% 设置 makecover 参数解析
\newcommand{\arg@cover@numbering}[2]{ % 解析左上角的编号设置参数
	\IfStrEqCase{#1}{
		{name}{\def\CGP@numbering@name{#2}} % 编号名字
		{format}{\def\CGP@numbering@format{#2}} % 编号的风格(设置字体,字号,...)
		{length}{\def\CGP@numbering@length{#2}} % 下划线长度
		{sep}{\def\CGP@numbering@sep{#2}} % 编号与下划线之间的间隔(额外添加空格,冒号之类的)
	}[\ClassWarning{\CGP@name}{There's no such numbering property (#1)}]
}
\newcommand{\arg@cover@logo}[2]{% 解析 CUST Logo参数设置
	\IfStrEqCase{#1}{
		{color}{ % logo颜色
            \IfStrEqCase{#2}{
                {black}{\def\CGP@logo@file{CustTitle.png}} % OPMZ: find eps?
                {blue}{\def\CGP@logo@file{CustTitle.png}} % TODO: find blue logo
			}[\ClassWarning{\CGP@name}{There's no such logo color (#1)}]
		}
		{height}{\def\CGP@logo@height{#2}} % Logo 高度
		{weight}{\def\CGP@logo@weight{#2}} % Logo 宽度

	}[\ClassWarning{\CGP@name}{There's no such logo property (#1)}]
}
\newcommand{\arg@cover@CGPtitle}[2]{% 解析 本科生毕业论文 参数设置
	\IfStrEqCase{#1}{
		{name}{\def\CGP@CGPtitle@name{#2}} % 默认: 本科生毕业论文
		{format}{\def\CGP@CGPtitle@format{#2}} % 修改字号,字体,加粗...
	}[\ClassWarning{\CGP@name}{There's no such CGPtitle property (#1)}]
}
\newcommand{\arg@cover@cntitle}[2]{% 解析 毕业论文中文题目 参数设置
	\IfStrEqCase{#1}{
		{name}{\def\CGP@cntitle@name{#2}} % 默认: 毕业论文中文题目(与\cntitle绑定)
		{format}{\def\CGP@cntitle@format{#2}} % 修改字号,字体,加粗...
	}[\ClassWarning{\CGP@name}{There's no such chinese thesis title property (#1)}]
}
\newcommand{\arg@cover@entitle}[2]{% 解析 The Subject of Graduation Project 参数设置
	\IfStrEqCase{#1}{
		{name}{\def\CGP@entitle@name{#2}} % 默认: The Subject of Graduation Project(与\entitle绑定)
		{format}{\def\CGP@entitle@format{#2}} % 修改字号,字体,加粗...
	}[\ClassWarning{\CGP@name}{There's no such english thesis title property (#1)}]
}
\newcommand{\arg@cover@item}[2]{% 解析 信息项目 参数设置
	% 学生姓名 ________
	% 专业 ______
	% 指导教师 ______
	% .....
	\IfStrEqCase{#1}{
		{height}{\def\CGP@item@height{#2}} % 每一个项目的高度
		{leftwidth}{\def\CGP@item@left@width{#2}} % 左部宽度
		{rightwidth}{\def\CGP@item@right@width{#2}} % 右部宽度
		{leftformat}{\def\CGP@item@left@format{#2}} % 左部风格
		{rightformat}{\def\CGP@item@right@format{#2}} % 右部风格
	}[\ClassWarning{\CGP@name}{There's no such item property (#1)}]
}

\newcommand{\arg@makecover}[2]{ % 解析所有有关封面的参数
	\IfStrEqCase{#1}{
		{numbering}{\kv@parse{#2}{\arg@cover@numbering}}
		{logo}{\kv@parse{#2}{\arg@cover@logo}}
		{CGPtitle}{\kv@parse{#2}{\arg@cover@CGPtitle}}
		{cntitle}{\kv@parse{#2}{\arg@cover@cntitle}}
		{entitle}{\kv@parse{#2}{\arg@cover@entitle}}
		{item}{\kv@parse{#2}{\arg@cover@item}}
		{date}{\def\CGP@date{#2}}
		
	}[\ClassWarning{\CGP@name}{There's no such argument (#1) for makecover}]
}
\newcommand{\makecoverarg}[1]{
	\kv@parse{ % 默认设置
		numbering = {
			name = {编号},
			format = {\songti \bfseries \zihao{-4}},
			length = {3.5em},
			sep = {},
		},
		logo = {
			color = black,
			height = 2.48cm,
			weight = 11.16cm,
		},
		CGPtitle = {
			name = {本科生毕业论文},
			format = {\zihao{1} \heiti },
		},
		cntitle = {
			name = {\@cntitle},
			format = {\heiti \zihao{2}},
		},
		entitle = {
			name = {\@entitle},
			format = {\zihao{3}},
		},
		item = {
			height = {1.5},
			leftwidth = {7em},
			leftformat = {\zihao{-3} \heiti},
			rightwidth = {15em},
			rightformat = {\zihao{-3} \heiti},
		},
		date = {\songti \zihao{-2} \@date},
    }{\arg@makecover}
    \IfEq{#1}{0}{
        % 0,使用默认设置,跳过
    }{
		\kv@parse{#1}{\arg@makecover} % 自定义设置
	}
}
% 制作封面命令
\newcommand{\makecover}[1][0]{
	\makecoverarg{#1} % 处理参数(默认设置和自定义设置)
	\begin{titlepage}
		\vfill
		{
			\CGP@numbering@format{
				\CGP@numbering@name \CGP@numbering@sep 
				\underline{\makebox[\CGP@numbering@length]{}} 
				}
		}
		\begin{center}
			% \vspace*{2em}
			\vfill
			\includegraphics[height=\CGP@logo@height,width=\CGP@logo@weight]{\CGP@logo@file}\\
			% \vspace*{4em}
			\vfill
			\vfill
			{
				\CGP@CGPtitle@format{
					\CGP@CGPtitle@name
				} 
			}\\
			% \vspace{4em}
			\vfill
			\vfill
			{
				\CGP@cntitle@format{
					\CGP@cntitle@name
				}
			}\\
			% \vspace{2em}
			\vfill
			{
				\CGP@entitle@format{
					\CGP@entitle@name
				}
			}\\
			% \vspace{4em}
			\vfill
			\vfill
			{
				\renewcommand\arraystretch{\CGP@item@height}
				\begin{tabular}{lc}
					\makebox[\CGP@item@left@width][s]{\CGP@item@left@format 学生姓名} &
					\underline{\makebox[\CGP@item@right@width]{
						\CGP@item@right@format{
							\@author
						}
					}} \\
					\makebox[\CGP@item@left@width][s]{\CGP@item@left@format 专 \hfill 业} &
					\underline{\makebox[\CGP@item@right@width]{
						\CGP@item@right@format{
							\@department
						}
					}} \\
					\makebox[\CGP@item@left@width][s]{\CGP@item@left@format 学 \hfill 号} &
					\underline{\makebox[\CGP@item@right@width]{
						\CGP@item@right@format{
							\@stunum
						}
					}} \\
					\makebox[\CGP@item@left@width][s]{\CGP@item@left@format 指导教师} &
					\underline{\makebox[\CGP@item@right@width]{
						\CGP@item@right@format{
							\@instructor
						}
					}} \\
					\makebox[\CGP@item@left@width][s]{\CGP@item@left@format 学 \hfill 院} &
					\underline{\makebox[\CGP@item@right@width]{
						\CGP@item@right@format{
							\@academy
						}
					}} \\
				\end{tabular}
			}\\
			% \vspace{2em}
			\vfill
			{
				\CGP@date
			}\\
		\end{center}
		\vfill
	\end{titlepage}
}
% 覆写 maketitle
% \let \oldmaketitle \maketitle
\let \maketitle \makecover
% ============= end 设置 CUST 论文封面 =============

% ============= beg 页眉页脚样式 =============
% 使用fancyhdr库
\RequirePackage{fancyhdr}
% 设置页眉样式
\newcommand{\custheadstyle}{
    % 设计（论文）除封皮外，各页均应加页眉，
    % 单线上居中打印页眉文字，页眉文字均为宋体五号
    % “长春理工大学本科毕业设计” 或“长春理工大学本科毕业论文”。
	\fancyhead[C]{\songti \zihao{5} 长春理工大学本科生毕业设计 } % 计算机学院使用
}
\newcommand{\custfootstyle}{
    % 页脚设定为各部分的页码。
    % 设计（论文）页码：宋体，小五，页面底端居中。
	\fancyfoot[C]{\songti \zihao{-5} \thepage}
	% \fancyfoot[L]{\rule[5pt]{\CGP@footlinelength}{0.4pt}}% OPMZ:remove?
	% \fancyfoot[R]{\rule[5pt]{\CGP@footlinelength}{0.4pt}}% OPMZ: remove?
}

% 默认执行一次
\pagestyle{fancy}
\fancyhf{} %清空原有样式
\custheadstyle
\custfootstyle

%定义一种新的格式叫做main
\fancypagestyle{main}{%
	\fancyhf{} %清空原有样式
	\custheadstyle
	\custfootstyle
}
\fancypagestyle{head}{
	\fancyhf{}
	\custheadstyle{}
}

% 修复 chapter 首页无样式
\fancypagestyle{plain}{
	\fancyhf{} %清空原有样式
	\custheadstyle
	\custfootstyle
}
% ============= end 页眉页脚样式 =============

% ============= beg 论文声明页 =============
%使用特殊符号
\RequirePackage{amssymb}

%设置命令
\newcommand{\statement}[1][asdf=falsd]{
	\clearpage
	\pagestyle{head}
	\begin{center}
		\fangsong \zihao{3} \bfseries
		毕业设计（论文）原创承诺书
	\end{center}
	\vspace{1em}
	\fangsong \zihao{4} 
	\setlength{\baselineskip}{1.6\baselineskip} % 两倍行距
	\indent\indent 1．本人承诺：所呈交的毕业设计（论文）《\@cntitle》，是
	认真学习理解学校的《长春理工大学本科毕业设计（论文）工作条例》后，
	在教师的指导下，保质保量独立地完成了任务书中规定的内容，不弄虚作
	假，不抄袭别人的工作内容。\\
	\indent 2．本人在毕业设计（论文）中引用他人的观点和研究成果，均在文中
	加以注释或以参考文献形式列出，对本文的研究工作做出重要贡献的个人
	和集体均已在文中注明。\\
	\indent 3．在毕业设计（论文）中对侵犯任何方面知识产权的行为，由本人承
	担相应的法律责任。\\
	\indent 4．本人完全了解学校关于保存、使用毕业设计（论文）的规定，即：
	按照学校要求提交论文和相关材料的印刷本和电子版本；同意学校保留毕
	业设计（论文）的复印件和电子版本，允许被查阅和借阅；学校可以采用
	影印、缩印或其他复制手段保存毕业设计（论文），可以公布其中的全部或
	部分内容。\\
	\\
	\indent 以上承诺的法律结果将完全由本人承担！\\
	\\
	\rightline{作者签名：\hspace{6em} 年 \hspace{2em} 月 \hspace{2em} 日}
	% \vspace{4em}
	
	\clearpage
	
	\setlength{\baselineskip}{0.625\baselineskip} % 还原行距
}
%旧的命令
\newcommand{\makestatement}[1]{\statement[#1]}

% ============= end 论文声明页 =============

% ============= beg 中文摘要页 =============

% 重新设置目录等级，支持hyperref宏包
\RequirePackage{hyperref}
%设置目录样式
\RequirePackage{tocloft}
\RequirePackage{titlesec}
\RequirePackage{titletoc}


\newenvironment{cnabstract}[1]{
	\def \cnkeyword {#1} % 关键词事先从参数中读入,请注意使用两个空格(\quad)分割关键词！
	\clearpage 
	\pagestyle{main}
	\pagenumbering{Roman}
	\phantomsection % 保证链接正确
	\addcontentsline{toc}{chapter}{摘要} % 加入到目录中
	\begin{center} % 宋体，居中，三号，加粗；多倍行距1.25，段前0行，段后1行，取消网格对齐
		\songti \bfseries \zihao{3}
		摘要
	\end{center}
	\vspace{1em}
	\songti \zihao{-4} % 摘要正文，段落首行缩进2个字符，宋体，小四；多倍行距1.25，段前、段后均为0行，取消网格对齐。
	\par\indent
}{
	\vspace{1em} % 关键词与摘要之间空一行
	\par\noindent { % 黑体小四顶格书写
		\heiti \zihao{-4} 
		关键词： \cnkeyword
	}
	\clearpage
}

% ============= end 中文摘要页 =============

% ============= beg 英文摘要页 =============
\newenvironment{enabstract}[1]{
	\def \enkeyword {#1} % 关键词事先从参数中读入,请注意使用分号加空格(; )分割关键词！
	\clearpage 
	\pagestyle{main}
	\phantomsection
	\addcontentsline{toc}{chapter}{Abstract}
	\begin{center} % 居中；Times New Roman，居中，三号，加粗；多倍行距1.25，段前0行，段后1行，取消网格对齐。
		\bfseries \zihao{3}
		Abstract 
	\end{center}
	\vspace{1em} % 段后空一行
	\zihao{-4} % Abstract正文设置：段落首行缩进2字；Times New Roman，小四；多倍行距1.25，段前、段后均为0行，取消网格对齐。
	\par\indent
}{
	\vspace{1em} % Key words与Abstract正文之间空一行。
	\par\noindent {% Times New Roman，小四，顶格书写
		\zihao{-4}
		\bfseries 
		Key Words: \enkeyword
		}
	\clearpage
}

% ============= end 英文摘要页 =============

% ============= beg 目录页 =============
\hypersetup{
	%colorlinks = true,
	%linkcolor  = black,
	pdfborder = 000,%去掉链接红框
	pdfstartview=FitH%打开页面以窗口宽度显示
} 


\renewcommand{\cftbeforeloftitleskip}{0.5em}
\renewcommand{\cfttoctitlefont}{\hfill \songti \zihao{3} \bfseries} % 目录标题: 三号,宋体,加粗,居中 
\renewcommand{\contentsname}{目\hspace{2em}录}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cftafterloftitleskip}{0.5em}

% 目录深度
\setcounter{tocdepth}{3} % (支持到 subsubsection)
\setcounter{secnumdepth}{3}

% 目录定制
\def\CGP@toc@format{\songti \zihao{-4}}
\def\CGP@toc@connector{\quad\titlerule*[0.5pc]{$\cdot$}}
% \titlecontents{标题名}[左间距]{标题格式}{标题标志}{无序号标题}{指引线与页码}[下间距]
 % TODO: 找不到明确要求,暂时随意发挥
\titlecontents{chapter} % 标题名
				[3.5em] % 左间距(标题开始位置,=间隔+序号空间)
				{\CGP@toc@format} % 标题格式
				{\contentslabel{3.5em}} % 标题标志(序号空间)
				{\hspace*{-3.5em}} % 无序号标题
				{\CGP@toc@connector\contentspage} % 指引线与页码
\titlecontents{section}
				[5.0em]
				{\CGP@toc@format}
				{\contentslabel{2em}}
				{\hspace*{-2em}}
				{\CGP@toc@connector\contentspage}
\titlecontents{subsection}
				[7.0em]
				{\CGP@toc@format}
				{\contentslabel{2.5em}}
				{\hspace*{-2.5em}}
				{\CGP@toc@connector\contentspage}
\titlecontents{subsubsection}
				[9.0em]
				{\CGP@toc@format}
				{\contentslabel{3.5em}}
				{\hspace*{-3.5em}}
				{\CGP@toc@connector\contentspage}
% 创建目录页
\let \oldtableofcontents \tableofcontents
\renewcommand{\tableofcontents}{
	\clearpage
	\pagestyle{main}
	\oldtableofcontents
	\clearpage
	\pagestyle{main} % 恢复正文样式
	\pagenumbering{arabic} % 阿拉伯数字重新计数
	\songti\zihao{-4}
}
\let \makecontents \tableofcontents
% ============= end 目录页 =============

% ============= beg 各级标题样式 =============
% HACK: 适配
\ctexset{
    chapter={ 
		numbering = true,% 一级标题格式 第 1 章, 第 2 章 ....
		number = {\arabic{chapter}},
		name={第,章},
		% aftername = {\quad}, % 标题编号之间一个空格 TODO: 是否需要清除空格?
		format={\centering \songti \bfseries \zihao{3}}, %一级标题, 宋体,三号,加粗,居中
		% break = {},  %新的一级标题从新的一页开始 TODO: remove? 或者 下面格式 HACK: 无法起效
		% break = {\Needspace{0.5\textheight}}, % 当前页剩余高度小于正文高度的一半时，则另起一页输出
		beforeskip={-1em},
		afterskip={2em},
	},	
	section={ 
		numbering = true, % 二级标题 1.1, 1.2, 2.1 ....
		number = {\arabic{section}},
		name = {\arabic{chapter}.},
		indent={2em},
		format={ \songti \bfseries \zihao{4}},% 二级标题, 宋体,四号,加粗,缩进2字符
	},
	subsection={
		indent={2em}, % 三级标题, 类似二级标题 1.1.1, 1.1.2, 2.1.1 ....
		numbering = true,
		number = {\arabic{subsection}},
		name = {\thesection.},
		format={\songti \bfseries \zihao{-4}}, % 三级标题, 宋体,小四,加粗,缩进2字符
	},
	subsubsection={
		indent={2em}, % 四级标题, 类似四级标题 1.1.1, 1.1.2, 2.1.1 ....
		numbering = true,
		number = {\arabic{subsubsection}},
		name = {\thesubsection.},
		format={\songti \bfseries \zihao{-4}}, % 四级标题, 宋体,小四,加粗,缩进2字符
	},
}
% ============= end 各级标题样式 =============

% ============= beg 章节引用样式 =============
% 参考 https://tex.stackexchange.com/a/66150/82731
\def\chapterautorefname~#1\null{
	第~#1~章\null
}

\def\sectionautorefname~#1\null{
	~\thesection~节
}

\def\subsectionautorefname~#1\null{
	~\thesubsection~节
}

\def\subsubsectionautorefname~#1\null{
	~\thesubsubsection~节
}
% ============= end 章节引用样式 =============

% ============= beg 带圈数字 =============
\RequirePackage{pifont}
% \RequirePackage{tcolorbox}

% 画带圈数字 [url]https://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers
\let \oldtextcircled \textcircled
\renewcommand{\textcircled}[1]{
	% \oldtextcircled{\small #1}
	\ding{\numexpr171+#1\relax}
	% \raisebox{0.05em}{\oldtextcircled{\raisebox{-0.05em}{#1}}}
	% \raisebox{.9pt}{\oldtextcircled{\raisebox{-.9pt}{#1}}}%
	% {\ooalign{\hfil\lower.1ex\hbox{#1}\hfil\crcr\Orb}}
	% \ding{\numexpr171+#1\relax}
}

% ============= end 带圈数字 =============

% ============= beg 设置图表样式 =============
% 图题,标题和引用格式
% \renewcommand{\thefigure}{\ifnum \c@section>\z@ \arabic{chapter}-\fi \@arabic\c@figure}
% \renewcommand{\thetable}{\ifnum \c@section>\z@ \arabic{chapter}-\fi \@arabic\c@table}

\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}

% 设置图表标题的计数方式
\@addtoreset{figure}{chapter}
\@addtoreset{table}{chapter}

%设置标题的样式
\RequirePackage{caption}
\DeclareCaptionFont{custCaption}{\songti \zihao{5}} % 宋体 五号
\captionsetup{labelsep=quad} 
\captionsetup{font={custCaption,singlespacing}}
\captionsetup[figure]{position=bottom,skip={0pt}} % 图题置于图下
\captionsetup[table]{position=top,skip={0pt}} % 表题置于表上
\setlength{\textfloatsep}{6pt}
\setlength{\floatsep}{0pt}
\setlength{\intextsep}{6pt}
\setlength{\abovecaptionskip}{0pt}
\setlength{\belowcaptionskip}{0pt}

%重新设置图表autoref
%\newcommand{\figureautorefname}{图}
\def\figureautorefname~#1\null{%
	图~#1~\null
}
%\newcommand{\tableautorefname}{表}
\def\tableautorefname~#1\null{%
	表~#1~\null
}

%使用tabularx库并定义新的左右中格式
\RequirePackage{tabularx}
\RequirePackage{makecell}
\newcolumntype{L}{X}
\newcolumntype{C}{>{\centering \arraybackslash}X}
\newcolumntype{R}{>{\raggedright \arraybackslash}X}

%添加复杂的表格需求库
\RequirePackage{booktabs}
%设置三线表格式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\aboverulesep}{0pt}
\setlength{\belowrulesep}{0pt}
\setlength{\abovetopsep}{0pt}
\setlength{\belowbottomsep}{0pt}

%添加图需要的库
\RequirePackage{graphicx}

%重新定义图和表的浮动环境，使其方便使用
\newenvironment{generalfig}[3][htbp]{
	\def \figcaption {#2}
	\def \figlabel {#3}
	\begin{figure}[#1]
		\centering
	}{
		\caption{\figcaption} \label{\figlabel}
	\end{figure}
}
\newenvironment{generaltab}[3][htbp]{
	\def \tabcaption {#2}
	\def \tablabel {#3}
	\begin{table}[#1]
		\caption{\tabcaption} \label{\tablabel}
		\zihao{5}
		\centering
	}{
	\end{table}
}

% ============= end 设置图标样式 =============

% ============= beg 设置公式样式 =============
%使用ams的数学库
\RequirePackage{amsmath}

% 每一章节重新计数
\@addtoreset{equation}{chapter}

% 重设样式
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}} 

%设置公式间距为零
% \AtBeginDocument{
% 	\setlength{\abovedisplayskip}{6pt}
% 	\setlength{\belowdisplayskip}{6pt}
% 	\setlength{\abovedisplayshortskip}{0pt}
% 	\setlength{\belowdisplayshortskip}{0pt} 
% }

%重新设置公式autoref
%\newcommand{\equationautorefname}{等式}
\def\equationautorefname~#1\null{%
	式~(#1)~\null
}

% ============= end 设置公式样式 =============

% ============= beg 设置脚注样式 =============
\@addtoreset{footnote}{page} % 脚注每页重新计数

% ============= end 设置脚注样式 =============

% ============= beg 设置附录页 =============

\RequirePackage{appendix}
\RequirePackage{etoolbox}

\AtBeginEnvironment{appendices}{%
	\ctexset{
		chapter={
			number = {\arabic{chapter}},
			name = {附录},
		},
		section={
			number = {\arabic{section}},
			name = {\arabic{chapter}.},
		},
		subsection={
			number = {\arabic{subsection}},
			name = {\arabic{chapter}.\arabic{section}.},
		},
		subsubsection={
			number = {\arabic{subsection}},
			name = {\arabic{chapter}.\arabic{section}.\arabic{subsection}.},
		},
	}
	% 重设引用格式
	\renewcommand\theequation{\textcircled{\arabic{chapter}}-\arabic{equation}}
	\renewcommand\thefigure{\textcircled{\arabic{chapter}}-\arabic{figure}}
	\renewcommand\thetable{\textcircled{\arabic{chapter}}-\arabic{table}}
}

% ============= end 设置附录页 =============

% ============= beg 致谢页 =============
\newenvironment{thankpage}{
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{致谢}
	\chapter*{致谢}
}{
	\clearpage
}

% ============= end 致谢页 =============

% ============= beg 参考文献页 =============
%	\cite 	正常引用
%	\upcite	上标引用 

%设置参考文献
\RequirePackage{chapterbib}
\RequirePackage[square,numbers,sort&compress]{natbib} % 方括号,阿拉伯数字,第一次引用顺序编号
\ctexset{bibname={参考文献}}

\newcommand{\upcite}[2][]{
	\unskip
	\def\CGP@temp{#1}
	\ifx\CGP@temp\empty{\unskip\textsuperscript{\cite{#2}}}
	\else{\unskip\textsuperscript{\cite[#1]{#2}}}\fi
}

%设置参考文献样式
\IfStrEqCase{\CGP@citebst}{
	{gbt7714-2005}{\bibliographystyle{gbt7714-2005}}
	{gbt7714-2015}{\bibliographystyle{gbt7714-2015}}
	{thuthesis}{
		\bibliographystyle{thuthesis-numeric}
		\def\thudot{\unskip.}
	}
}


\renewcommand{\bibfont}{\songti \zihao{5}}%文献列表的字体: 宋体, 五号

%设置新的参考文献
\let \oldbibliography \bibliography
\renewcommand{\bibliography}[1]{
	%添加到目录
	\clearpage
	\phantomsection
	\addcontentsline{toc}{chapter}{参考文献}% TODO: 需要 section number 吗?
	{
		\oldbibliography{#1}
	}
	% \oldbibliography{#1}
}

% ============= end 参考文献页 =============

% ============= beg pdf文件信息 =============
\AtBeginDocument{
	\hypersetup{
		pdfinfo={
			Title={\@cntitle},
			Author={\@author},
			Subject={长春理工大学本科生毕业设计}
		}
	}
}

% ============= end pdf文件信息 =============
