#import "src/common.typ" as _common

#let cyan = rgb("41BACB")
#let blue = rgb("044B53")
#let teal = rgb("44BCCC")
#let gray = rgb("E5E5E5")
#let red = rgb("AD1E20")
#let purple = rgb("C201C9")
#let yellow = rgb("eb996f")


#let form-factor() = if page.width != auto { page.width / 21cm } else { 1 }

#let cover(body) = context {
  set page(footer: none, header: none)
  set page(margin: 1.5cm)
  set text(
    12pt,
    font: ("Times New Roman", "Liberation Serif", "Libertinus Serif"),
    hyphenate: false,
  )

  // show regex("\b(?i)oram\b"): _ => smallcaps[oram]

  show title: block.with(width: 90%)
  show title: align.with(center)
  show title: set text(17pt)
  show title: set par(justify: false)

  // show logos a bit smaller than usual
  show image: scale.with(80% * form-factor(), reflow: true)

  set grid(inset: (bottom: 0.67em, left: 0.16em, right: 0.16em))
  set grid.hline(stroke: black + 0.5pt)

  // not really for style, but anyways
  // include cover in bookmarks
  set heading(outlined: false, bookmarked: true, numbering: none)
  show heading: hide
  show heading: place.with(center + top)
  heading[Насловна страна]

  body
}

#let form(body) = context {
  set page(footer: none, header: none)
  set text(
    10pt * form-factor(),
    font: (
      "Arial",
      // "Liberation Sans",
      "Segoe UI Symbol",
      "Noto Sans Symbols2",
    ),
  )

  set table(inset: .5em)

  body
}

#let form-heading(body) = context {
  set text(
    9pt * form-factor(),
    font: (
      "Arial",
      // "Liberation Sans",
      "Segoe UI Symbol",
      "Noto Sans Symbols2",
    ),
  )

  show image: scale.with(100% * form-factor(), reflow: true)

  body
}

#let base(body) = {
  set text(
    11pt,
    font: ("Times New Roman", "Liberation Serif", "Libertinus Serif", "Segoe UI Symbol", "Noto Sans Symbols2"),
  )
  show raw: set text(10pt, font: "Courier New")
  set raw(theme: "assets/theme/GitHub Light.tmTheme")
  show math.equation: set text(font: "Cambria Math", fallback: false)

  show outline.entry: it => {
    show repeat: set text(blue, font: ("Cambria Math", "Times New Roman")) // cambria uses squared dots

    if it.element.func() == heading {
      it
    } else {
      // figures
      link(
        it.element.location(),
        it.indented(
          text(blue, weight: "medium")[#it.prefix()],
          it.inner(),
        ),
      )
    }
  }
  show link: it => {
    if type(it.dest) == str {
      set text(blue)
      it
    } else {
      it
    }
  }
  show footnote: set text(blue)
  show footnote.entry: it => {
    show regex("^\d+\b"): set text(blue)
    it
  }

  show heading: set text(blue, hyphenate: false, number-type: "lining")
  show heading: set block(above: 2.2em, below: 1.1em)
  show heading.where(level: 1): set block(above: 3em, below: 1.5em)
  show heading.where(level: 1): upper

  show heading.where(level: 1): align.with(center)
  show heading: align.with(left)

  set par(leading: 0.65em, justify: true)

  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption: it => [
    #show strong: it => text(blue, weight: "medium")[#it.body]
    #set terms(separator: sym.colon + h(0.3em), tight: true)

    / #it.supplement #it.counter.display(): #it.body
  ]

  show figure: set block(
    above: 2em,
    below: 2em,
  )

  show table: set text(number-type: "lining", number-width: "tabular")
  set table(fill: (_, y) => if y == 0 { gray })
  show table: set align(center)

  show table.cell.where(y: 0): set text(weight: "semibold", features: ("smcp",))

  show heading.where(numbering: "1.1"): set heading(
    numbering: (..nums) => {
      numbering("1.1", ..nums)
      h(0.3em)
    },
  )

  show heading.where(numbering: _common.sr-numbering): set heading(
    numbering: (..nums) => {
      _common.sr-numbering(..nums)
      h(0.3em)
    },
  )

  body
}

#let main(body) = {
  show: base

  import "@preview/hydra:0.6.3": hydra

  set page(header: context {
    let odd = calc.odd(here().page())

    set align(if odd { right } else { left })
    set text(0.9em, style: "italic", blue.transparentize(32%))

    hydra(if odd { 1 } else { 2 })
  })

  // show heading.where(level: 1): set block(inset: (y: 0.77em), stroke: (top: blue, bottom: blue), width: 100%)

  body
}
