#!/bin/bash
for x in c d e f g a b; do
    for y in '' is isis es eses; do
        sed "s/X/$x$y/" template.ly > tmp.ly
        lilypond --png -dpixmap-format=pngalpha tmp.ly 2>&1 | grep -q 'No glyph'
        if [ $? -eq 1 ]; then
            echo "$x$y - done"
            mv tmp-page1.png img/$x$y.png
            rm tmp.ly tmp-page*.png
        fi
    done
done
montage -label %f img/* all.png
