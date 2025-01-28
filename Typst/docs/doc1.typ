#import "../tools/macros.typ": eqref, eqnum, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)
// #set math.equation(numbering: "(1.1)", supplement: "Eq.")


= Abstract

In this paper we propose a Lasso-based model for unbalanced Optimal Transport (OT) on tree that can be efficiently computed in linear time. This improves the previous time complexity $O(n log^2 n)$ using Generalized Kantorovich Rubinstein (GKR) model @sato2020fast.





