#import "../pre.typ": *

#show: preamble

#show: style.form

#set text(lang: "en")

#section-break()
#form-heading[Key Words Documentation]

// #set text(size: 9pt, lang: "en", font: "arial") // 9pt
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

      [Accession number, *ANO*:], meta.rbr,
      [Identification number, *INO*:], meta.ibr,
      [Document type, *DT*:], meta.en.td,
      [Type of record, *TR*:], meta.en.tz,
      [Contents code, *CC*:], meta.en.vr,
      [Author, *AU*:], meta.en.author.name,
      [Mentor, *MN*:], meta.en.mentor.name,
      [Title, *TI*:], par[#meta.en.title],
      [Language of text, *LT*:], meta.en.jp,
      [Language of abstract, *LA*:], meta.en.ji,
      [Country of publication, *CP*:], meta.en.zp,
      [Locality of publication, *LP*], meta.en.ugp,
      [Publication year, *PY*:], [#meta.year],
      [Publisher, *PB*:], meta.en.iz,
      [Publication place, *PP*:], meta.en.ma,
      [
        #stack(
          dir: ttb,
          [Physical description, *PD*:],
          sub[
            (chapters/pages/ref./tables/pictures/graphs/appendixes)
          ],
        )
      ],
      context [
        #count.chapters/#count.pages/#count.citations/#count.tables.final().first()/#count.figures.final().first()/0/#count.appendices.final().first()
      ],

      [Scientific field, *SF*:], meta.en.field,
      [Scientific discipline, *SD*:], meta.en.discipline,
      [Subject/Key words, *S/KW*:], meta.en.keywords.join(", "),
      [*UC*], meta.en.udk,
      [Holding data, *HD*:], meta.en.cu,
      [Note, *N*:], meta.en.vn,
      [Abstract, *AB*:], par[#meta.en.abstract],
      [Accepted by the Scientific Board on, *ASB*:], meta.en.dp,
      [Defended on, *DE*:], meta.en.do,

      table.cell(rowspan: 4, inset: 0pt)[
        #table(
          columns: (1fr, auto),
          stroke: (none, (bottom: _dashed)),

          table.cell(rowspan: 4)[Defended Board, *DB*:],
          [President:],
          [Member:],
          [Member:],
          [Member, Mentor:],
        )
      ],
      meta.en.p,
      meta.en.c1,
      meta.en.c2,
      meta.en.cm,
    )

    #place(
      bottom + end,
      float: false,

      table(
        columns: 1,
        align: center,
        stroke: _solid,

        // table.cell(stroke: (top: page.fill, left: none, right: none))[#sym.space],
        pad(left: 1.5em, right: 1.5em)[Mentor's sign],
        sym.space,
      ),
    )
  ]
]

#align(right)[
  #text(size: 9pt)[
    Obrazac *Q2.НА.04-05* - Izdanje 1
  ]
]
