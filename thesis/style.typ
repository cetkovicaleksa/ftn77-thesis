
#let cover(body) = {
  set page(footer: none, header: none)
  set page(margin: (x: 1.5cm, y: 1.2cm))
  // set page(margin: (top: 20mm, bottom: 20mm, left: 15mm, right: 15mm), footer: none)
  // set page(fill: gradient.linear(..color.map.turbo)) // uncomment when getting serious
  // set text(size: 13pt, font: "minion pro", hyphenate: false)

  show title: block.with(width: 90%)
  show title: align.with(center)
  show title: text.with(size: 17pt)
  show title: set par(justify: false)

  // show logos a bit smaller than usual
  show image: scale.with(80%, reflow: true)

  set grid(inset: (bottom: 0.67em, left: 0.16em, right: 0.16em))
  set grid.hline(stroke: black + 0.5pt)

  body
}

#let form(body) = {
  set page(footer: none, header: none)
  set text(font: ("arial", "segoe ui symbol"), size: 10pt)

  body
}

#let form-heading(body) = {
  set text(font: "arial", size: 10pt)
  show heading: text.with(size: 14pt)

  // show image: scale.with(80%, reflow: true)

  body
}
