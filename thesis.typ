#import "thesis/pre.typ": *

#show: preamble

#set page(numbering: "i")

#include "thesis/cover.typ"
#include "thesis/front-matter/assignment.typ"
#{
  show: style.base
  include "thesis/front-matter/outline.typ"
}

#section-break()
#metadata("context counter(page).get().first()") <page-count-reset>
#counter(page).update(1)

#set page(numbering: "1")

#include "thesis/main.typ"

#{
  show: style.base

  bibliography("/thesis.bib", style: "/assets/csl/ieee.xml")
}

#include "thesis/back-matter/kwd.typ"
#include "thesis/back-matter/kwd.en.typ"
#include "thesis/back-matter/conflict.typ"
