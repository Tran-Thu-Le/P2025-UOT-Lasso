// #show bibliography: none
// #bibliography("../contents/machine-learning.bib")

#let section-refs = state("section-refs", ())

// Add bibliography references to the current section's state
#show ref: it => {
  it
  if it.element != none {
    // Citing a document element like a figure, not a bib key
    // So don't update refs
    return
  }
  section-refs.update(old => {
    old.push(it.target)
    old
  })
}

// Clear the previously stored references every time a level 1 heading
// is created
#show heading.where(level: 1): it => {
  section-refs.update(())
  it
}

#let section-bib() = locate(loc => {
  for target in section-refs.at(loc) {
    block(cite(target, form: "full"))
  }
})