#let _appendices = state("appendices", none)
#let appendices = context query(heading.where(level: 1, supplement: [Додатак])).len()

#let figures = counter(figure.where(kind: image))
#let tables = counter(figure.where(kind: table))
#let listings = counter(figure.where(kind: raw))
#let algorithms = counter(figure.where(kind: "алгоритам"))

#let citations = context query(cite).dedup().len()

#let chapters = context query(heading.where(level: 1, supplement: [Поглавље])).filter(h1 => h1.numbering != none).len()
#let pages = context (
  counter(page).at(<meta:front-matter-end>) + counter(page).final() + (-1,)
).sum()
