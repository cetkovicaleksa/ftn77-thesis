#let _appendices = state("appendices", none)
#let appendices = context query(heading.where(level: 1, supplement: [Додатак])).len()

// TODO: Maybe exclude non outlined or non numbered
#let images = context query(figure.where(kind: image)).len()
#let tables = context query(figure.where(kind: table)).len()
#let listings = context query(figure.where(kind: raw)).len()
#let graphs = context query(figure.where(kind: "график")).len()
#let algorithms = context query(figure.where(kind: "алгоритам")).len()

#let citations = context query(cite).dedup().len()

#let chapters = context query(heading.where(level: 1, supplement: [Поглавље])).len()
#let pages = context (
  counter(page).at(<meta:front-matter-end>) + counter(page).final() + (-1,)
).sum()
