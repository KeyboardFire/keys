\version "2.19.82"
#(set! paper-alist (cons '("tiny" . (cons (* 42 mm) (* 17 mm))) paper-alist))
#(set-default-paper-size "tiny")
\header { tagline = ##f }
\new Staff {
  \omit Staff.TimeSignature
  \omit Staff.BarLine
  \omit NoteHead
  \override Stem.transparent = ##t
  \key X \major
  c c c c c c c c c c c c c c c c c c c c c c c c c c
}
