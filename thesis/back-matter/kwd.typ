#import "../pre.typ": *

#show: preamble

#show: style.form

#section-break()
#form-heading[Кључна документација информација]

// #set text(size: 9pt, lang: "sr", font: "arial") // 9pt
// #set page(footer: none) // hide page number
#set par(justify: true)

#let _dashed = (dash: "densely-dashed", thickness: 0.11em, paint: black)
#let _solid = 0.15em + black

#set text(size: 0.9em)

#align(
  center + bottom,
)[
  #block(
    stroke: (top: _solid, bottom: _solid),
    breakable: false,
  )[
    #table(
      columns: (1fr, 1.5fr),
      align: left + top,
      stroke: (
        (bottom: _dashed, right: _dashed),
        (bottom: _dashed),
      ),

      [Редни број, *РБР*:], meta.rbr,
      [Идентификациони број, *ИБР*:], meta.ibr,
      [Тип документације, *ТД*:], meta.td,
      [Тип записа, *ТЗ*:], meta.tz,
      [Врста рада, *ВР*:], meta.vr,
      [Аутор, *АУ*:], meta.author.name,
      [Ментор, *МН*:], meta.mentor.name,
      [Наслов рада, *НР*:], par[#meta.title],
      [Језик публикације, *ЈП*:], meta.jp,
      [Језик извода, *ЈИ*:], meta.ji,
      [Земља публиковања, *ЗП*:], meta.zp,
      [Уже географско подручје, *УГП*], meta.ugp,
      [Година, *ГО*:], [#meta.year],
      [Издавач, *ИЗ*:], meta.iz,
      [Место и адреса, *МА*:], meta.ma,
      [
        #stack(
          dir: ttb,
          [Физички опис рада, *ФО*:],
          sub[
            (поглавља/страна/цитата/табела/слика/графика/прилога)
          ],
        )
      ],
      context [
        #count.chapters/#count.pages/#count.citations/#count.tables.final().first()/#count.figures.final().first()/0/#count.appendices
      ],

      [Научна област, *НО*:], meta.field,
      [Научна дисциплина, *НД*:], meta.discipline,
      [Предметна одредница/Кључне речи, *ПО*:], (meta.keywords).join(", "),
      [*УДК*], meta.udk,
      [Чува се, *ЧУ*:], meta.cu,
      [Важна напомена, *ВН*:], meta.vn,
      [Извод, *ИЗ*:], par[#meta.abstract],
      [Датум прихватања теме, *ДП*:], meta.dp,
      [Датум одбране, *ДО*:], meta.do,

      table.cell(rowspan: 4, inset: 0pt)[
        #table(
          columns: (1fr, auto),
          stroke: (none, (bottom: _dashed)),

          table.cell(rowspan: 4)[Чланови комисије, *КО*:],
          [Председник:],
          [Члан:],
          [Члан:],
          [Члан, ментор:],
        )
      ],
      meta.p,
      meta.c1,
      meta.c2,
      meta.cm,
    )

    #place(
      bottom + end,
      float: false,
      // context {
      table(
        columns: 1,
        align: center,
        stroke: _solid,

        // table.cell(stroke: (top: white, left: none, right: none, bottom: none))[#sym.space], // or page.fill with context
        pad(left: 1.5em, right: 1.5em)[Потпис ментора],
        [#sym.space],
      ),
      // },
    )
  ]
]

#align(right)[
  #text(size: 9pt)[
    Образац *Q2.НА.04-05* - Издање 1
  ]
]
