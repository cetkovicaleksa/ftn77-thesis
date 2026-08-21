#import "src/state.typ" as state
#import "src/pre.typ" as pre
#import "src/common.typ": assignment-form-heading, form-heading, ftn-logo, ftn-logo-new, section-break, uns-logo
#import "style.typ" as style

#import "src/cover.typ": cover, cover-new
#import "src/outline.typ": outline
#import "src/form/assignment.typ": assignment
#import "src/form/kwd.typ": kwd, kwd-en
#import "src/form/conflict.typ": conflict


#let bibliography = std.bibliography.with(style: "assets/csl/ieee.xml")


#let main(body) = {
  show: style.main

  section-break()
  [
    #metadata("This is where front-matter ends right before page counter is reset") <meta:front-matter-end>
  ]
  counter(page).update(1)

  set heading(numbering: "1.1", supplement: [Потпоглавље]) // Одјељак?
  show heading.where(level: 1): set heading(supplement: [Поглавље])

  show: style.main

  body

  // [
  //   #metadata("This is where main content ends") <meta:main-end>
  // ]
}

#let appendices(body) = context {
  state._appendices.update(state._appendices.get() + body)
  none
}

#let show-appendices() = context {
  counter(heading).update(0)
  set heading(
    numbering: "A.1",
    supplement: [Додатак],
  )

  [
    #state._appendices.final()
  ]
}


#let thesis(
  title: [],
  author: (
    name: "Именко Презимић",
  ),
  mentor: (
    name: "Ранко Презимић",
  ),
  keywords: (),
  program: [],
  degree: [Основне академске студије],
  field: [],
  discipline: [],
  assignment-text: lorem(50),
  date: auto,
  bio: none,

  en: (
    keywords: (),
  ),

  bibliography: none,
  paper: "a4",
  margin: 2cm,
  new-cover: false,

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

  set text(
    lang: "sr",
    region: "RS",
  )

  set heading(supplement: none)

  // auto pagebreak on h1
  show heading.where(level: 1, outlined: true): h1 => {
    // quick patch up
    if h1.supplement != [Формулар] {
      section-break()
    }
    h1
  }

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
  )

  assignment(
    title: title,
    text_: assignment-text,
    program: program,
    degree: degree,
    field: field,
    author: author,
    mentor: mentor,
  )

  {
    show: style.base

    outline()
  }

  set page(numbering: "1")

  {
    show: style.base
    {
      show: main
      body
    }

    bibliography

    show-appendices()

    if bio != none [
      = Биографија
      #bio
    ]
  }

  kwd(
    title: title,
    author: author,
    mentor: mentor,
    field: field,
    discipline: discipline,
    program: program,
    ..args,
  )

  kwd-en(..en)

  conflict()
}
