// ------------------------------
//    FORMART
// ------------------------------
#set page(margin: (top: 3cm, bottom: 3cm, left: 2cm, right: 1cm))
#set heading(numbering: "1.1.1.")
#show heading.where(level: 1): set text(red)
#show heading.where(level: 2): set text(red, weight: "bold")
#set figure(supplement: [*Hình*])
#set text(font: "New Computer Modern")
#set par(leading: 1.5em, first-line-indent: 1.5em, justify: true)
#show math.equation: it => {
    if it.body.fields().at("size", default: none) != "display" {
      return math.display(it)
    }
    it 
}
#show cite: set text(red)
#show link: set text(blue)

#set page(footer: context [#line(length: 100%)\ #v(-2.5em) #h(1fr) _Page #counter(page).display()_ #h(1fr)])
#set page(numbering: "1")
// #counter(page).update(1)


// -----------------------------------
//    CONTENTS  LIST
// -----------------------------------
#align(center)[#text(size: 2em, fill: red)[Fast Unbalanced Optimal Transport on Tree]]
#align(center)[Thanh-Tung Nguyen, Thu-Le Tran\*, Tam Le, Clément Elvira]
#v(3em)
#{
  show outline.entry.where(
    level: 1
  ): it => {
    text(fill: red, strong(it))
  }
  show outline.entry.where(
    level: 2
  ): it => {
    text(weight: "bold", it)
  }
  outline(title: [Contents\ #v(1em)], indent: true)
}

// #pagebreak()
#include "docs/doc1.typ"




// --------- Kết luận và Tài liệu tham khảo
#pagebreak()
#heading(numbering: none, level: 1, outlined: true)[References]
\ //this line is a hack fix indent issue
#bibliography("docs/ref.bib", title: none)