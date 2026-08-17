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

#let preamble(body) = {
  set text(lang: "sr", region: "RS")
  set page(margin: if is-spiral { (y: 2.5cm, inside: 2cm, outside: 1.5cm) } else { auto })

  show heading.where(level: 1, outlined: true): h1 => {
    section-break()
    h1
  }

  body
}
