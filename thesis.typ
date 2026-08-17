#import "thesis/pre.typ": *

#show: preamble

#set document(
  title: [
    Систем за приватну анализу графова
    над екстерно складиштеним
    шифрованим подацима уз заштиту
    образаца приступа примјеном ORAM механизма
  ],
  author: "Алекса Ћетковић",
)

#set page(numbering: "i")

#include "thesis/front-matter/outline.typ"

#section-break()
#counter(page).update(1)

#set page(numbering: "1")

#include "thesis/main.typ"

#bibliography("/thesis.bib", full: true)
