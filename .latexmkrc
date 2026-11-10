#!/usr/bin/env perl
# ===== エンジン: LuaLaTeX（日本語は luatexja / ltjsarticle 系） =====
$pdf_mode = 4;  # 4 = lualatex
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %O %S';

# ===== upLaTeX + dvipdfmx を使いたい場合は上2行を消して以下を有効化 =====
# $pdf_mode  = 3;  # 3 = latex -> dvipdfmx
# $latex     = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error -halt-on-error %O %S';
# $bibtex    = 'upbibtex %O %S';
# $dvipdf    = 'dvipdfmx %O -o %D %S';
# $makeindex = 'upmendex %O -o %D %S';

# ===== 文献・索引 =====
$biber     = 'biber %O %S';      # biblatex 用
$bibtex_use = 2;                  # .bbl も clean 対象にする
$makeindex = 'upmendex %O -o %D %S';

# ===== 出力 =====
$out_dir    = 'out';
$max_repeat = 5;
@default_files = ('main.tex');
