#! //bin/bash

ELEMENTS="al bp cn def env m md ms mu pa pl pn pro sn tl tmp"

rm vocabulary/term_usage/term_cnts-tl.txt 

for ELEMENT in $ELEMENTS

do 
XPATH="//$ELEMENT"
echo $ELEMENT
# xml sel -t -m '//cn' -n  -v .  *.xml | sort | uniq -c | sort -nr
xml sel -t -m "$XPATH" -n -v 'normalize-space(.)' ms-xml/tl/*.xml | sort | uniq -c | sort -nr | tr -s ' ' ' ' | cut -d' ' -f 2- | sed 's/ /|/1' > vocabulary/term_usage/"$ELEMENT"_fq-tl.csv 

wc -l vocabulary/term_usage/"$ELEMENT"_fq-tl.csv >> vocabulary/term_usage/term_cnts-tl.txt

done

