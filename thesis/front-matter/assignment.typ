#import "../pre.typ": *

#show: preamble

#show: style.form

// #let for_ = sys.inputs.at("for", default: none)

// #set text(size: 10pt, lang: "sr", font: "arial", fallback: true)
// #set page(footer: none) // hide page number

#let _hairline = black + 0.05pt
#let _very_thin = black + 0.5pt
#let _medium = black + 1.5pt

#section-break()
#assignment-form-heading[Задатак за завршни рад]

#set list(marker: "-", indent: 1.5em, body-indent: 1.5em)
#set table(stroke: _hairline)

#v(0.3fr)

#align(right)[#text(style: "italic")[(Податке уноси предменти професор #sym.hyph ментор)]]
#block(stroke: _medium, above: 0.67em)[
  #table(
    columns: 2,
    rows: 6,
    align: left + horizon,

    [Студијски \ програм], [#meta.program],
    [Студент],
    table.cell(inset: 0pt)[
      #table(
        rows: 1,
        columns: (1fr, .4fr, .45fr),
        // align: (left, left, center),
        stroke: (top: none, bottom: none, left: none),

        meta.author.name,
        [Број индекса:],
        text(tracking: 0.067em, size: 0.8em, fractions: false)[#upper(meta.author.id)],
      )
    ],

    [Степен и врста \ студија:], meta.degree,
    [Област:], meta.field,
    [Ментор:], meta.mentor.name,
    table.cell(
      colspan: 2,
      inset: (left: 0.69em, right: 0.01pt),
      stroke: (left: _medium, right: _medium, bottom: _medium),
      fill: gray,
    )[#text(size: 0.9em)[
      НА ОСНОВУ ПОДНЕТЕ ПРИЈАВЕ, ПРИЛОЖЕНЕ ДОКУМЕНТАЦИЈЕ И ОДРЕДБИ СТАТУТА ФАКУЛТЕТА \
      ИЗДАЈЕ СЕ ЗАДАТАК ЗА  ЗАВРШНИ РАД, СА СЛЕДЕЋИМ ЕЛЕМЕНТИМА:
      - проблем -- тема рада;
      - начин решавања проблема и начин практичне провере резултата рада, ако је таква провера неопходна;
    ]],
  )
]

#upper[
  #text(size: 1.25em)[
    #strong[Наслов завршног рада:]
  ]
]
#v(-0.8em)

#rect(width: 100%, stroke: _medium, height: 0.7fr, inset: 0.67em, outset: 0pt)[
  #align(center + horizon, strong(meta.title))
]

#upper[
  #text(size: 1.25em)[
    #strong[Текст задатка:]
  ]
]
#v(-0.8em)

#rect(width: 100%, stroke: _medium, height: 4fr, inset: 0.67em)[
  #par(justify: true)[#meta.assignment]
]

#align(bottom)[

  #box(stroke: _medium)[
    #table(
      rows: (auto, 1cm),
      columns: (1fr, 1fr),

      [Руководилац студијског програма:], [Ментор рада:],
      [], [],
    )
  ]

  #table(
    columns: (1fr,),
    stroke: _very_thin
  )[
    #stack(
      dir: ltr,
      spacing: 0.5em,

      [Примерак за:],
      [#sym.ballot #sym.hyph Студента;],
      [#sym.ballot #sym.hyph Ментора],
    )
  ]
]

#align(right)[
  #text(size: 9pt)[
    Образац *Q2.НА.04-03* - Издање 1
  ]
]
