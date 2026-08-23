#let outline() = [
  #show std.outline: it => if query(it.target).len() > 0 { it } // hide outline if no entries
  #show std.outline: set heading(level: 1, outlined: true, bookmarked: true)

  #set footnote.entry(separator: none)
  #show footnote: none
  #show footnote.entry: none

  #std.outline()
  #std.outline(title: [Списак слика], target: figure.where(kind: image))
  #std.outline(title: [Списак табела], target: figure.where(kind: table))
  #std.outline(title: [Списак листинга], target: figure.where(kind: raw))
  #std.outline(title: [Списак графика], target: figure.where(kind: "график"))
  #std.outline(title: [Списак алгоритама], target: figure.where(kind: "алгоритам"))
]
