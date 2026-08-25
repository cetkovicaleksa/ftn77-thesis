#import "src/common.typ" as _common

#let cyan = rgb("41BACB")
#let blue = rgb("044B53")
#let teal = rgb("44BCCC")
#let gray = rgb("E5E5E5")
#let red = rgb("AD1E20")
#let purple = rgb("C201C9")
#let yellow = rgb("eb996f")


#let form-factor() = if page.width != auto { page.width / 21cm } else { 1 }

#let cover(
  body,
  body-size: 12pt,
  title-size: 17pt,
  title-outlined: false,
  title-bookmarked: true,
  body-font: ("Times New Roman", "Liberation Serif", "Libertinus Serif"),
  sans-font: ("Arial", "Liberation Sans", "Libertinus Serif"),
  logo-scale: 80%,
  margin: 1.5cm,
) = context {
  set page(footer: none, header: none)
  set page(margin: margin)
  set text(
    body-size,
    font: body-font,
    hyphenate: false,
  )

  // show regex("\b(?i)oram\b"): _ => smallcaps[oram]

  show title: block.with(width: 90%)
  show title: align.with(center)
  show title: set text(title-size, font: sans-font)
  show title: set par(justify: false)

  // show logos a bit smaller than usual
  show image: scale.with(logo-scale * form-factor(), reflow: true)

  set grid(inset: (bottom: 0.67em, left: 0.16em, right: 0.16em))
  set grid.hline(stroke: black + 0.5pt)

  // not really for style, but anyways
  // include cover in bookmarks
  set heading(outlined: false, bookmarked: true, numbering: none)
  show heading: hide
  show heading: place.with(center + top)
  heading(
    level: 1,
    outlined: title-outlined,
    bookmarked: title-bookmarked,
    supplement: [Формулар],
  )[Насловна страна]

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

#let base(
  body,
  body-size: 11pt,
  body-font: ("Times New Roman", "Segoe UI Symbol"),
  math-size: 11pt,
  math-font: "Cambria Math",
  raw-size: 10pt,
  raw-font: "Courier New",
  accent: blue,
) = {
  set text(
    body-size,
    font: body-font,
  )
  show raw: set text(raw-size, font: raw-font)
  set raw(theme: "assets/theme/GitHub Light.tmTheme")
  show math.equation: set text(math-size, font: math-font)

  show outline.entry: it => {
    show repeat: set text(accent)
    // show repeat: set text(font: ("Cambria Math", "Times New Roman")) // cambria uses squared dots

    if it.element.func() == heading {
      it
    } else {
      // figures
      link(
        it.element.location(),
        it.indented(
          text(accent, weight: "medium")[#it.prefix()],
          it.inner(),
        ),
      )
    }
  }
  show link: it => {
    if type(it.dest) == str {
      set text(accent)
      it
    } else {
      it
    }
  }
  // show footnote: set text(blue)
  set footnote.entry(separator: line(stroke: 0.3pt + accent, length: 30%))
  // show footnote.entry: it => {
  //   show regex("^\d+\b"): set text(blue)
  //   it
  // }

  set enum(numbering: n => text(accent)[#numbering("1.", n)])
  set list(marker: lvl => text(accent)[#(
    sym.bullet,
    sym.bullet.stroked,
    sym.bullet.tri,
    sym.bullet.op,
  ).at(lvl, default: sym.hyph)])

  show heading: set text(accent, hyphenate: false, number-type: "lining")
  show heading: set block(above: 2.2em, below: 1.1em)
  show heading.where(level: 1): set block(above: 3em, below: 1.9em)
  show heading.where(level: 1): smallcaps

  show heading.where(level: 1): align.with(center)
  show heading: align.with(left)

  set par(justify: true)

  // set terms(separator: h(1fr))
  show terms.item: block.with(above: 1em, below: 1em)
  show terms: it => {
    // set repeat(gap: 1.5pt)
    show repeat: set text(accent)
    show repeat: box.with(width: 1fr)
    // show repeat: set text(blue, font: ("Cambria Math", "Times New Roman")) // cambria uses squared dots
    show link: set text(accent)
    it
  }

  show table: set text(number-type: "lining", number-width: "tabular")

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

#let _hydra(body, accent: blue) = {
  import "@preview/hydra:0.6.3": hydra

  set page(header: context {
    let odd = calc.odd(here().page())

    set align(if odd { right } else { left })
    set text(0.9em, style: "italic", weight: "thin", accent)

    hydra(if odd { 1 } else { 2 })
  })

  body
}

#let main(body, hydra: true, accent: blue) = {
  show: if hydra { _hydra.with(accent: accent) } else { body => body }

  set par(justify: true, first-line-indent: 1em)

  set figure.caption(separator: sym.colon, position: bottom)
  show figure.where(kind: table): set figure.caption(position: top)

  show figure.caption: it => [
    #text(
      fill: accent,
      weight: "medium",
      number-type: "lining",
    )[#it.supplement#sym.space.nobreak#it.counter.display()#it.separator] #it.body
  ]

  show figure
    .where(kind: table)
    .or(figure.where(kind: raw))
    .or(figure.where(kind: "алгоритам")): set block(breakable: true)
  show figure.caption: set block(sticky: true)

  show figure: set block(
    above: 2em,
    below: 2em,
  )

  // show heading.where(level: 1): set block(inset: (y: 0.77em), stroke: (top: blue, bottom: blue), width: 100%)

  body
}

#let appendices(body, accent: blue) = {
  show: main.with(accent: accent)
  body
}

#let abbr = (
  section: (title, body) => {
    heading(level: 1, title)
    body
  },

  group: (name, index, total, body) => body,

  entry: (entry, index, total) => [
    // / #entry.short: #entry.long#entry.label #box(width: 1fr)[#repeat(".")] #box[#entry.pages.join(", ")]
    / #entry.short: #entry.long#entry.label #h(1fr) #box[#entry.pages.join(", ")]
  ],
)

#let terms = (
  section: (title, body) => {
    heading(level: 1, title)
    body
  },

  group: (name, index, total, body) => body,

  entry: (entry, index, total) => {
    // Format the reference
    let reference = if entry.reference == none {
      []
    } else {
      if entry.reference.supplement == none {
        [ #cite(label(entry.reference.key))]
      } else {
        [
          #cite(
            label(entry.reference.key),
            supplement: entry.reference.supplement,
          )]
      }
    }

    let term = if entry.long != none { entry.long } else { entry.short }

    terms.item(
      term,
      [
        #entry.description#reference // #entry.label // show cross refs only for abbr, to avoid multiple label same key
        // #box(width: 1fr)[#repeat(".")]
        #h(1fr)
        #box[#entry.pages.join(", ")] // maybe mark as pdf.artifact
      ],
    )
  },
)
