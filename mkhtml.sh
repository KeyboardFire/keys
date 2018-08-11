#!/bin/bash
notes=()
for b in eses es '' is isis; do
    for a in f c g d a e b; do
        notes+=($a$b)
    done
done
n=${#notes[@]}
f() {
    if [ $1 -ge 0 -a $1 -lt $n ]; then
        sed 's/eses/𝄫/; s/es/♭/; s/isis/𝄪/; s/is/♯/' <<<${notes[$1]} | tr a-g A-G
    else
        echo -
    fi
}
cat <<x
<!doctype html>
<html lang='en'>
    <head>
        <title>Key signatures</title>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width'>
        <style>
        @font-face {
            font-family: FreeSerif;
            src: url(FreeSerif.ttf);
        }
        body {
            font-family: FreeSerif;
            font-size: 16px;
            background-color: #fff;
            color: #222;
            margin: 0;
            padding: 0;
        }

        td, th { padding: 0; margin: 0; border: 0; }
        table { border-spacing: 0; border-collapse: collapse; }

        td { text-align: center; }
        td span.key { font-size: 30px; display: block; }
        td, th.mode { width: 80px; }
        img.key, th.sig { width: 167px; }

        .ion { color: #b61709; font-weight: bold; }
        .aeo { color: #0f187d; font-weight: bold; }

        table#tblhead { display: none; }
        table#tblmain { margin: 20px; }
        span.name { font-weight: bold }

        @media (min-width: 959px) {
            table#tblhead { display: block; position: fixed; z-index: 1; top: 0; background-color: #fff; }
            table#tblhead { margin: 0px 20px; }
            table#tblmain { margin: 20px; margin-top: 50px; }
            table#tblhead th { padding: 20px 0px 5px; }
            span.name { display: none; }
        }

        table#tblmain tr.light { background-color: #f8f8f8; }
        table#tblmain tr.dark { background-color: #f0f0f0; }

        div#desc {
            position: fixed;
            top: 0;
            left: 0;
            width: 400px;
            padding: 20px;
            background-color: #f6fffb;
            height: 100%;
            overflow: auto;
        }
        body:target div#desc { display: none; }
        div#keys { margin-left: 420px; }
        body:target div#keys { margin-left: 0; }

        a#close, a#open {
            text-align: center;
            font-weight: bold;
            border: 1px solid black;
            text-decoration: none;
            color: #222;
        }
        a#close {
            position: absolute;
            right: 20px;
            top: 20px;
            width: 20px;
            height: 20px;
            border-radius: 20px;
            font-size: 20px;
            line-height: 20px;
        }
        a#open {
            position: fixed;
            left: 0px;
            top: 20px;
            border-left-width: 0;
            padding: 5px;
            border-top-right-radius: 20px;
            border-bottom-right-radius: 20px;
            background-color: #f6fffb;
            display: none;
            z-index: 2;
        }
        body:target a#open { display: block; }

        h1 { font-size: 30px; padding: 0; margin: 0 0 20px; }
        h2 { font-size: 20px; padding: 0; margin: 20px 0 20px; }
        p { margin: 12px 0; line-height: 1.5; }

        @media (max-width: 1199px) {
            body { font-size: 14px; }
            table { width: 620px; }
            td span.key { font-size: 22px; }
            td, th.mode { width: 70px; }
            img.key, th.sig { width: 130px; }
            table#tblmain { margin: 10px; }
            div#desc { width: 280px; padding: 10px; }
            div#keys { margin-left: 290px; }
            div#desc a#close { right: 10px; top: 10px; }
            h1 { font-size: 25px; }
            h2 { font-size: 17px; }
        }
        @media (min-width: 959px) and (max-width: 1199px) {
            table#tblhead { margin: 0px 10px; }
            table#tblmain { margin-top: 40px; }
            table#tblhead th { padding: 10px 0px 5px; }
        }
        @media (max-width: 550px) {
            div#desc { width: 200px; }
            div#keys { margin-left: 210px; }
        }
        </style>
    </head>
    <body id='hidesidebar'>
        <a id='open' href='#'>? &raquo;&nbsp;</a>
        <div id='desc'>
            <a href='#hidesidebar' id='close'>&times;</a>

            <h1>Key signatures</h1>

            <p>
            This is a list of all possible key signatures
            in traditional Western music,
            as well as the corresponding keys
            for each of the seven modes.
            It aims to be as complete as possible&mdash;<!--
            -->nonstandard keys with double flats and double sharps
            are included.
            </p>

            <h2>What's a mode?</h2>

            <p>
            If you're not familiar with modes,
            you've probably heard the terms "major" and "minor."
            Roughly speaking,
            the seven modes are a generalization of this concept;
            <span class='ion'>Ionian</span> mode
            corresponds to major,
            and <span class='aeo'>Aeolian</span> mode
            corresponds to minor.
            <a href='https://en.wikipedia.org/wiki/Mode_(music)#Modern_modes'>Wikipedia goes into greater detail.</a>
            </p>

            <h2>Why did you make this?</h2>

            <p>
            Firstly,
            because I haven't found another resource on the internet
            that gives key signatures for all seven modes
            on all possible notes,
            including double flats and double sharps.
            </p>

            <p>
            Secondly,
            because seeing all of them laid out in a chart like this
            reveals some interesting patterns.
            For example,
            it makes it obvious why the trick of reading the second-to-last flat
            to determine a major key
            works.
            And it makes it easy to come up with similar tricks&mdash;for example,
            going a half step up from the last flat
            gives the corresponding Mixolydian key.
            </p>

            <h2>Source code</h2>

            <p>
            The source code that was used to generate this page
            is <a href='https://github.com/KeyboardFire/keys'>available on Github</a>.
            </p>

            <p>&nbsp;</p> <!-- awful hack -->

        </div>
        <div id='keys'>
            <table id='tblhead'>
            <tr>
                <th class='sig'>Key signature</th>
                <th class='mode'>Lydian</th>
                <th class='mode ion'>Ionian</th>
                <th class='mode'>Mixolydian</th>
                <th class='mode'>Dorian</th>
                <th class='mode aeo'>Aeolian</th>
                <th class='mode'>Phrygian</th>
                <th class='mode'>Locrian</th>
            </tr>
            </table>
            <table id='tblmain'>
x
for i in ${!notes[@]}; do
    if [ ${notes[i]} = feses ]; then continue; fi
    cat <<x
            <tr class='$( ((i%2)) && echo dark || echo light)'>
                <th><img class='key' src='img/${notes[i]}.png'></th>
                <td><span class='key'>$(f $((i-1)))</span>$( ((i-1 >= 0)) && echo "<span class='name'>Lydian</span>"      )</td>
                <td><span class='key'>$(f $((i-0)))</span>$( ((i-0 >= 0)) && echo "<span class='name ion'>Ionian</span>"  )</td>
                <td><span class='key'>$(f $((i+1)))</span>$( ((i+1 <  n)) && echo "<span class='name'>Mixolydian</span>"  )</td>
                <td><span class='key'>$(f $((i+2)))</span>$( ((i+2 <  n)) && echo "<span class='name'>Dorian</span>"      )</td>
                <td><span class='key'>$(f $((i+3)))</span>$( ((i+3 <  n)) && echo "<span class='name aeo'>Aeolian</span>" )</td>
                <td><span class='key'>$(f $((i+4)))</span>$( ((i+4 <  n)) && echo "<span class='name'>Phrygian</span>"    )</td>
                <td><span class='key'>$(f $((i+5)))</span>$( ((i+5 <  n)) && echo "<span class='name'>Locrian</span>"     )</td>
            </tr>
x
    if [ ${notes[i]} = cisis ]; then break; fi
done
cat <<x
            </table>
        </div>
    </body>
</html>
x
