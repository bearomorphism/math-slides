// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-16-9")
#set text(size: 25pt, font: "Comic Sans MS")

#slide[
  #set align(horizon)
  = Very minimalist slides

  A lazy author

  July 23, 2023
]

#slide[
  == "Formulae" for roots of polynomials

  $a x^2 + b x + c = 0 => x = (-b plus.minus sqrt(b^2 - 4 a c))/ (2 a)$

  #show: later
  Cubic equations:

  $a x^3 + b x^2 + c = 0 =>$ Cardano's formula

  #show: later
  For quartic equations, there is also a formula.

  #show: later
  How about quintic functions?
]

#slide[
  == "Solvable by radical" theorem

  The roots of a polynomial can be written as the combination of $+, -, times, div, root(dot, dot)$, if and only if its Galois group is *solvable*.

  #image("images/就讓我們開始吧.jpg", width: 50%)
]

#slide[
  == This slide changes!

  You can always see this.
  // Make use of features like #uncover, #only, and others to create dynamic content
  #uncover(2)[But this appears later!]
]
