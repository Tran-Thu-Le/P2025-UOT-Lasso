#let remLE(x) = text(fill: blue, size: 0.75em)[[*LE:* #x]]

#let defeq = $=$

//--------------- eqref
// #let reffmt = it => box(stroke: rgb("#ff0000") + 0.5pt, outset: 2pt)[#smallcaps[#it]]
#let reffmt = it => text(fill: blue)[#it]
#show ref: reffmt
#let linkfmt = it => [#underline(text(blue)[#it])]

#import "eqref.typ": eqref, eqnum

#let eqref = eqref.with(style: reffmt) // set defaults
#let customEqfmt = (nums) => [#box[Eq. (#numbering("1.1", ..nums))]]
#let customEqref = eqref.with(fmt: customEqfmt, style: emph) // alternate options
//--------------- eqref

#let myref(x) = text(fill: blue,)[(#x)]
#let figref(x) = text(fill: red,)[#x]


#let remark-Le(x) = text(fill: blue, size: 10pt)[\[*Remark by LE:* #x\]]
#let delete-Le(x) = text(fill: blue, size: 10pt)[\[*Delete by LE:* #x\]]
#let add-Le(x) = text(fill: blue)[#x]

#let remark-Ngan(x) = text(fill: red, size: 10pt)[\[*Remark by LE:* #x\]]
#let delete-Ngan(x) = text(fill: red, size: 10pt)[\[*Delete by LE:* #x\]]
#let add-Ngan(x) = text(fill: red)[#x]

#import "@preview/ctheorems:1.1.3": thmbox, thmrules, thmproof
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Định lý", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let proposition = thmbox("theorem", "Mệnh đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let definition = thmbox("theorem", "Định nghĩa", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let lemma = thmbox("theorem", "Bổ đề", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let corollary = thmbox("theorem", "Hệ quả", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let hypothesis = thmbox("theorem", "Giả thiết", base_level: 1, fill: rgb("#eeffee"), stroke: black, radius: 2pt)
#let example  = thmbox("theorem", "Ví dụ", base_level: 1, fill: none, stroke: none, radius: 2pt)
#let proof = thmproof("proof", "Chứng minh")
