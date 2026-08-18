#import sys.inputs.at("meta", default: "metadata.typ"): *
#import sys.inputs.at("style", default: "style.typ") as style

#let sr = text.with(lang: "sr", region: "RS")
#let ср = sr

#let en = text.with(lang: "en", region: "UK", style: "italic")
#let ен = en

#let is-print = sys.inputs.at("print", default: "false") == "true"

#let is-duplex = is-print and sys.inputs.at("duplex", default: "false") == "true"
#let _pagebreak = pagebreak.with(weak: true, ..if is-duplex {
  (to: "odd")
} else { (:) })

#let is-spiral = is-print and sys.inputs.at("spiral", default: "false") == "true"

#let section-break() = {
  set page(header: none, footer: none)
  _pagebreak()
}

#let count = (
  figures: counter(figure.where(kind: image)),
  tables: counter(figure.where(kind: table)),
  listings: counter(figure.where(kind: raw)),
  algorithms: counter(figure.where(kind: "алгоритам")),
  appendices: context query(heading.where(level: 1, supplement: [Додатак])).len(),
  citations: context query(cite).dedup().len(),
  chapters: context query(heading.where(level: 1, supplement: [Поглавље])).len(),
  pages: context {
    // come up with something more reliable
    let resets = query(<page-count-reset>)

    if resets.len() > 0 {
      (
        resets.map(it => counter(page).at(it.location()).first() - 1) + counter(page).final()
      ).sum()
    } else {
      counter(page).final().first()
    }
  },
)

#let ftn-logo = image(
  "/assets/logo/ftn-logo-light.svg",
  height: 2.4cm,
  width: auto,
  alt: "ФТН лого",
)

#let ftn-logo-new = image(
  "/assets/logo/logoftnnovi.png",
  height: 1.8cm,
  width: auto,
  alt: "ФТН лого",
)

#let uns-logo = image(
  "/assets/logo/uns-logo-light.svg",
  height: 2.28cm,
  width: auto,
  alt: "УНС лого",
)

#let blue = rgb("#00E1FDBA")
#let dark-blue = rgb("#044B53")
#let light-blue = rgb("#44bccc")
#let gray = rgb("#E5E5E5")

#let form-heading(
  body,
) = context {
  show: style.form-heading
  set heading(numbering: none, supplement: [Формулар], outlined: true, bookmarked: true)
  // set text(size: 1em)
  show heading: upper
  let inset = 1mm

  grid(
    columns: (auto, 1fr),
    rows: measure(ftn-logo).height / 2 + inset,
    align: center + horizon,
    stroke: 0.15em + black,
    inset: inset,

    grid.cell(
      ftn-logo,
      rowspan: 2,
    ),

    pdf.artifact[
      #stack(
        dir: ttb,
        spacing: 0.6em,

        ..if ("sr", "ba").contains(text.lang) {
          (
            upper[#text(weight: "light")[Универзитет у Новом Саду] *#sym.bullet Факултет техничких наука*],
            text(weight: "light", tracking: 0.1em)[2100 НОВИ САД, Трг Доситеја Обрадовића 6],
          )
        } else {
          (
            upper[#text(weight: "light")[University of Novi Sad] *#sym.bullet Faculty of technical sciences*],
            text(weight: "light", tracking: 0.1em)[21000 NOVI SAD, Trg Dositeja Obradovića 6],
          )
        },
      )
    ],
    grid.cell(
      fill: gray,
    )[
      // #body
      // add supplement just to id form headings if needed
      #heading[#body]
    ],
  )
}

#let assignment-form-heading(
  body,
) = {
  show: style.form-heading
  // TODO: Add number and date on the side
  form-heading[#body]
  // table(
  //   columns: (auto, auto),
  //   rows: if ftn-logo.height != auto { ftn-logo.height / 4 + 1.2mm } else { auto },
  //   stroke: none,
  //   inset: 0pt,

  //   form-heading(body),
  //   table(
  //     rows: (),
  //     columns: 1,
  //     stroke: 0.5mm + black,
  //     inset: (left: 3em, right: 3em, top: 1.2mm, bottom: 1.2mm),

  //     [Број:],
  //     sym.space,
  //     [Датум:],
  //     sym.space,
  //   ),
  // )
}

#let preamble(body) = {
  set document(
    title: meta.title,
    author: meta.author.name,
    keywords: meta.keywords + meta.en.keywords,
  )

  set text(lang: "sr", region: "RS")

  set page(
    paper: "a4",
    supplement: [стр.],
    margin: if is-spiral { (y: 2.5cm, inside: 2cm, outside: 1.5cm) } else { 2cm },
  ) // 2.5cm default margin

  show figure.where(kind: raw): set figure(supplement: [Листинг])
  show figure.where(kind: table): set figure.caption(position: top)

  set heading(supplement: none)

  show heading.where(level: 1, outlined: true): h1 => {
    // quick patch up
    if h1.supplement != [Формулар] {
      section-break()
    }
    h1
  }

  body
}
