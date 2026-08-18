#show outline: it => if query(it.target).len() > 0 { it } // hide outline if no entries
#show outline: set heading(level: 1, outlined: true, bookmarked: true)

#outline()
#outline(title: [Списак слика], target: figure.where(kind: image))
#outline(title: [Списак листинга], target: figure.where(kind: raw))
#outline(title: [Списак табела], target: figure.where(kind: table))
#outline(title: [Списак алгоритама], target: figure.where(kind: "алгоритам"))
