#import "pre.typ": *

#show: preamble

// include cover as level 1 heading toc and bookmark entry
#show heading: place.with(top + center)
#show heading: none
#heading(numbering: none)[Насловна страна] // TODO: Should there be a separate (actual) title page

#let cover() = [
  #show: style.cover

  #grid(
    columns: (auto, 1fr, auto),
    align: center + horizon,

    uns-logo,
    stack(
      dir: ttb,
      spacing: 0.77em,

      upper[Универзитет у Новом Саду],
      stack(
        dir: ttb,
        spacing: 0.5em,

        upper[*Факултет техничких наука у*],
        upper[*Новом Саду*],
      ),
    ),
    ftn-logo,
    grid.hline(),
  )

  #v(1fr)
  #pad(left: 3%)[#meta.author.name]

  #v(.7fr)
  #std.title[
    #meta.at("cover-title", default: meta.title)
  ]

  #v(1fr)
  #align(center)[
    #stack(
      dir: ttb,
      spacing: 1em,
      upper[завршни рад],
      emph[-- #meta.at("degree", default: "Основне академске студије") --],
    )
  ]

  #v(1fr)
  #align(bottom + center)[Нови Сад, #meta.year]
]

#let cover-new() = [
  #show: style.cover

  #place(top + center, float: true)[
    //dy: -1cm, float: true)[
    #grid(
      align: (left, right),
      inset: 0.1mm,
      columns: (1fr, 1fr),
      uns-logo, pad(ftn-logo-new, top: 1mm),
    )
  ]

  #place(top + center, float: false)[
    #stack(
      dir: ttb,
      spacing: 0.77em,

      upper[Универзитет у Новом Саду],
      stack(dir: ttb, spacing: 0.5em, upper[*Факултет техничких наука у*], upper[*Новом Саду*]),
    )
  ]

  #v(1fr)
  #pad(left: 3%)[#meta.author.name]

  #v(.7fr)
  #std.title[
    #meta.title
  ]

  #v(1fr)
  #align(center)[
    #stack(
      dir: ttb,
      spacing: 1em,
      upper[завршни рад],
      emph[-- #meta.degree --],
    )
  ]

  #v(1fr)
  #align(bottom + center)[Нови Сад, #meta.year]
]

#if sys.inputs.at("alt-cover", default: "false") == "true" {
  cover-new()
} else {
  cover()
}
