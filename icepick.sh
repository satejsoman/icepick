#!/bin/bash 

# override pip command if set before calling script 
pip=${pip:=pip} 

grep -f \
<(  find . -type f \( -iname \*.py -o -iname \*.py3 \) -exec grep "\(\^import \(.*\)\)\|\(^from \(.*\) import\)" {} \; | 
    sed -e "s/.*from \(.*\) import/\1/p" -e "s/.*import \(.*\)/\1/p" | 
    cut -d. -f1                                                      | 
    cut -d' ' -f1                                                    | 
    sort -f                                                          | 
    uniq | sed -e "s/^/\^/g") \
<( $pip freeze "${@}" )