#import "../lib.typ": appendices, bibliography, ftn-logo-new, thesis

#import "metadata.typ": meta
#import "style.typ" as style

#show: thesis.with(
  ..meta,
  paper: "a4",
  // margin: 2cm,
  duplex: true,
  bibliography: bibliography("thesis.bib"), // uses ieee with custom serbian cyrl translations by default
  style: style,
)

= Увод

#lorem(100)

#lorem(20) @fig:logo #lorem(10) @cetkovic2026oram

#figure(
  caption: [Лого ФТН-а],
  ftn-logo-new,
) <fig:logo>

#lorem(1000)

== Дио увода

#lorem(200)

#show: appendices

= Додатак

#lorem(50)

#figure(
  caption: [Опет Лого ФТН-а],
  ftn-logo-new,
)

#lorem(100)
