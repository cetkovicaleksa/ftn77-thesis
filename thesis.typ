#import "template/lib.typ": appendices, bibliography, ftn-logo-new, pre, thesis

#import pre: *

#import "metadata.typ": meta

#show: thesis.with(
  ..meta,
  new-cover: "new-cover" in sys.inputs,
  bibliography: bibliography("thesis.bib", full: true),
)

= Увод

#lorem(10)

#ен[Some text in English] @goldreich_software_1996

#figure(
  caption: [Нови ФТН лого],
)[
  #ftn-logo-new
]
<fig:ftn-logo-new>

#lorem(100)

#show: appendices

= Додатак

#lorem(100)
