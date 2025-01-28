#let ieeeEqfmt = (nums) => [(#numbering("1.1", ..nums))]
#let eqref(
  label,
  fmt: ieeeEqfmt,
  //fmt: nums => [(#numbering("1.1", ..nums))],
  style: x => x,
  makelink: true,
) = {
    locate(loc => {
        let elements = query(label, loc)
        let locationreps = elements.map(x => repr(x.location().position())).join(", ")
        assert(elements.len() > 0, message: "label <" + str(label) + "> does not exist in the document: referenced at " + repr(loc.position()))
        assert(elements.len() == 1, message: "label <" + str(label) + "> occurs multiple times in the document: found at " + locationreps)
        let target = elements.first().location()
        let number = counter(math.equation).at(target) 
        if makelink {
            return [
                #show link: style
                #link(target, fmt(number))
            ]
        }
        return fmt(number)
    })
}

#let eqnum(it) = [
  #set math.equation(numbering: "(1.1)")
  #it
]