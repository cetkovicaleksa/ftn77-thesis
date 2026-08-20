
#let blue = rgb("#00E1FDBA")
#let dark-blue = rgb("#044B53")
#let light-blue = rgb("#44bccc")
#let gray = rgb("#E5E5E5")

#let cover(body) = {
  set page(footer: none, header: none)
  set page(margin: (x: 1.5cm, y: 1.2cm))
  // set page(margin: (top: 20mm, bottom: 20mm, left: 15mm, right: 15mm), footer: none)
  // set page(fill: gradient.linear(..color.map.turbo)) // uncomment when getting serious
  set text(size: 13pt, font: "times new roman", hyphenate: false)

  // show regex("\b(?i)oram\b"): _ => smallcaps[oram]

  show title: block.with(width: 90%)
  show title: align.with(center)
  show title: set text(size: 17pt)
  show title: set par(justify: false)

  // show logos a bit smaller than usual
  show image: scale.with(80%, reflow: true)

  set grid(inset: (bottom: 0.67em, left: 0.16em, right: 0.16em))
  set grid.hline(stroke: black + 0.5pt)

  body
}

#let form(body) = {
  set page(footer: none, header: none)
  set text(font: ("arial", "segoe ui symbol"), size: 10pt, fallback: false)

  body
}

#let form-heading(body) = {
  set text(font: "arial", size: 10pt, fallback: false)
  show heading: text.with(size: 14pt)

  // show image: scale.with(80%, reflow: true)

  body
}

#let base(body) = {
  set page(
    number-align: center,
  )
  set text(
    font: ("times new roman", "segoe ui symbol"),
    size: 11pt,
  )
  show raw: set text(font: "courier new", size: 10pt)
  set raw(theme: "/assets/theme/GitHub Light.tmTheme")
  show math.equation: set text(font: "cambria math", fallback: false)

  show heading: set block(above: 2.2em, below: 1.1em)
  show heading.where(level: 1): set block(above: 3em, below: 1.5em)
  show heading.where(level: 1): upper

  show heading: set text(fill: dark-blue, hyphenate: false, fractions: false)
  // show heading: h => smallcaps(lower(h))

  show heading.where(level: 1): align.with(center)
  show heading: align.with(left)

  show outline: it => {
    show repeat: set text(fill: dark-blue)
    it
  }

  body
}

#let main(body) = {
  show: base

  import "@preview/hydra:0.6.3": hydra
  set page(header: context {
    let odd = calc.odd(here().page())

    set text(style: "italic", size: 1em, number-type: "lining", fill: dark-blue.transparentize(32%))

    if odd {
      align(right)[#upper[#hydra(1)]]
    } else {
      align(left)[#hydra(2)]
    }
  })

  // set text(fractions: true)
  set par(leading: 0.65em, justify: true)
  // show par: set text(number-type: "old-style")

  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption: it => context [
    #text(fill: dark-blue, weight: "bold")[#it.supplement #it.counter.display(it.numbering)]#it.separator#it.body
  ]

  set table(fill: (_, y) => {
    if y == 0 {
      gray
    }
  })
  // show table: set text(features: (tnum: 1))
  show table.cell.where(y: 0): set text(weight: "bold")

  body
}
