#import "pre.typ": *

#show: preamble

// Treat text that is in latin script as english this cannot be overridden per occurrence so may need to use #en everywhere
// Also applies to inline math and inline raw
// #show (
//   par.where().or(heading).or(title).or(outline).or(figure.caption)
// ): it => {
//   show regex("\b\d*[A-z_-]+\d*\b"): en
//   it
// }

#set page(
  numbering: "1",
)

#set heading(numbering: "1.a", supplement: [Потпоглавље])
#show heading.where(level: 1): set heading(supplement: [Поглавље])

#set par(justify: true)

= Увод

#lorem(10)

#lorem(100)

// #show bibliography: none
// #bibliography("/thesis.bib")
