#!/bin/sh
set -eu
cd "$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
export LANG=C.UTF-8
for tool in uplatex upbibtex dvipdfmx; do
    command -v "$tool" >/dev/null 2>&1 || { echo "Missing command: $tool (install TeX Live with Japanese support)" >&2; exit 1; }
done
uplatex -interaction=nonstopmode -halt-on-error -file-line-error 261006.tex
upbibtex 261006
uplatex -interaction=nonstopmode -halt-on-error -file-line-error 261006.tex
uplatex -interaction=nonstopmode -halt-on-error -file-line-error 261006.tex
dvipdfmx -o 2312110009.pdf 261006.dvi
echo "Built: 2312110009.pdf"
