#import "src/state.typ" as state
#import "src/common.typ": sr-numbering
#import "src/components.typ": (
  assignment-form-heading, form-heading, ftn-logo, ftn-logo-new, uns-logo,
)
#import "style.typ" as style
#import "src/pre.typ" as pre
#import "src/glossary.typ" as glossary
#let _gls = glossary

#import "src/cover.typ": cover, cover-new
#import "src/outline.typ": outline
#import "src/form/assignment.typ": assignment
#let _assignment = assignment
#import "src/form/kwd.typ": kwd
#import "src/form/conflict.typ": conflict


#let bibliography = std.bibliography.with(style: "assets/csl/ieee.xml")


#let appendices(body) = context {
  state._appendices.update(state._appendices.get() + body)
  none
}

#let show-appendices(style: style) = context {
  show: style.appendices

  counter(heading).update(0)
  set heading(
    numbering: sr-numbering,
    supplement: [Додатак],
  )

  set figure(
    numbering: n => sr-numbering(counter(heading).get().first(), n),
  )

  [
    #state._appendices.final()
  ]
}


#let thesis(
  title: [],
  author: (
    name: "Именко Презимић",
    id: "",
  ),
  mentor: (
    name: "Ранко Презимић",
  ),
  keywords: (),
  abstract: none,
  program: [],
  degree: [Основне академске студије],
  field: [],
  discipline: [],
  assignment: [],
  date: auto,
  bio: none,
  glossary: (:),
  glossary-links: false,
  glossary-all: false,

  en: (
    keywords: (),
  ),

  bibliography: none,
  paper: "a4",
  margin: (x: 2cm, y: 2.5cm),
  new-cover: false,
  duplex: false,

  style: style,
  body,
  ..args,
) = {
  set document(
    title: title,
    author: author.name,
    keywords: keywords + en.keywords,
  )

  set page(
    margin: margin,
    paper: paper,
    supplement: [стр.],
  )

  show figure.where(kind: raw): set figure(supplement: [Листинг]) // use "listing" instead of "kod"
  show figure.where(kind: "график"): set figure(supplement: [График])
  show figure.where(kind: "алгоритам"): set figure(supplement: [Алгоритам])

  set text(
    lang: "sr",
    region: "RS",
  )

  set heading(supplement: none)

  let _pagebreak(weak: true, to: if duplex { "odd" } else { none }) = {
    set page(header: none, footer: none)
    pagebreak(weak: weak, to: to)
  }

  // auto pagebreak on h1
  show heading.where(level: 1, outlined: true): h1 => {
    // quick patch up
    if h1.supplement != [Формулар] {
      _pagebreak()
    }

    h1
  }

  // reset figure counters each chapter/appendix
  show heading.where(level: 1): h1 => {
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(figure.where(kind: "график")).update(0)
    counter(figure.where(kind: "алгоритам")).update(0)

    h1
  }

  // figure numbered as <h1 count>.<count>
  // no figures shall be used outside main/appendices
  set figure(
    numbering: n => numbering("1.1", counter(heading).get().first(), n),
  )

  set page(numbering: "i")

  if new-cover {
    cover-new
  } else {
    cover
  }(
    title: title,
    author: author,
    date: date,
    degree: degree,
    style: style,
  )

  _pagebreak()
  _assignment(
    assignment,
    title: title,
    program: program,
    degree: degree,
    field: field,
    author: author,
    mentor: mentor,
    style: style,
  )

  show: _gls.init-glossary.with(glossary, term-links: glossary-links)

  {
    show: style.base

    outline()

    _gls.glossary(
      show-all: glossary-all,
    )
  }

  set page(numbering: "1")

  {
    show: style.base
    {
      _pagebreak()
      [
        #metadata("This is where front-matter ends right before page counter is reset")
        <meta:front-matter-end>
      ]
      counter(page).update(1)

      set heading(numbering: "1.1", supplement: [Потпоглавље]) // Одјељак?
      show heading.where(level: 1): set heading(supplement: [Поглавље])

      show: style.main

      body
    }

    bibliography

    show-appendices(style: style)

    if type(bio) == str [
      = Биографија
      #bio
    ] else { bio }
  }

  _pagebreak()
  kwd(
    ..args,
    lang: "sr",
    title: title,
    author: author,
    mentor: mentor,
    field: field,
    discipline: discipline,
    abstract: abstract,
    style: style,
  )

  _pagebreak()
  kwd(
    ..en,
    lang: "en",
    style: style,
  )

  _pagebreak()
  conflict(style: style)
}
