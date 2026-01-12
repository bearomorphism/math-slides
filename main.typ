// Get Polylux from the official package repository
#import "@preview/polylux:0.4.0": *
#import "@preview/ctheorems:1.1.3": *

#show: thmrules.with(qed-symbol: $square$)

#set page(margin: 1.5cm, numbering: "1 of 1")
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1em))

#let example = thmplain("example", "Example").with(numbering: none)
#let exercise = thmplain("exercise", "Exercise").with(numbering: none)
#let proof = thmproof("proof", "Proof")

// Make the paper dimensions fit for a presentation and the text larger
#set page(paper: "presentation-16-9")
#set text(size: 16pt, font: "Comic Sans MS")

#slide[
  #set align(horizon)
  = Isomorphism theorems, Solvable Groups and the Jordan Holder Theorem

  Tim Hsiung

  January 18, 2026
]

#slide[
  == "Formulae" for roots of polynomials

  $ a x^2 + b x + c = 0 => x = (-b plus.minus sqrt(b^2 - 4 a c))/ (2 a) $

  Cubic equations: $a x^3 + b x^2 + c x + d = 0 =>$ Cardano's formula

  For quartic equations, there is also a formula.

  How about quintic functions? How about polynomials of higher degrees?
]

#slide[
  == "Solvable by radical" theorem

  #theorem("Solvable by radicals (Dummit Foote Sec 14.7 Theorem 39)")[
    The polynomial $f(x)$ can be solved by radicals (i.e. it's roots can be written as the combination of $+, -, times, div, root(dot, dot)$) and its coefficients, if and only if its Galois group is *solvable*.
  ]

  I will not explain what are Galois groups today.
]

#slide[
  == Solvable Groups

  #definition("(Finite) Solvable Groups")[
    A finite group $G$ is *solvable* if there exists a chain of subgroups

    $ 1 = G_s triangle.l G_(s-1) triangle.l ... triangle.l G_2 triangle.l G_1 = G $

    with $G_i slash G_(i+1)$ cyclic for $i=1, ... ,s - 1$.
  ]
]

#slide[
  But, what are those triangles? What is $G_i slash G_(i+1)$?
  #image("images/image.png", height: 80%)
]

#slide[
  #image("images/就讓我們開始吧.jpg")
]

#slide[
  Remark: most of the proofs in this slide are just outlines and incomplete. I hope you can finish the proof, because this is the easiest way to verify that you fully understand how to play with the definitions.

  #image("images/borrow_math.png", height: 70%)
]

#slide[
  == Some definition or tips

  - I expect you to know the definition of groups and subgroups. The notation $H <= G$ means "$H$ is a subgroup of $G$".
  - I expect you to know what a function (mapping) is, what is 1-1 (injective), onto (surjective), and 1-1 onto (bijective).
  - Let $f: X -> Y$ be a function, $X' subset.eq X$, $Y' subset.eq Y$.
    - The set $f(X') := {f(x) | x in X'} subset.eq Y$ is called the image.
    - The set $f^(-1)(Y') := {x in X | f(x) in Y'} subset.eq X$ is called the preimage (fiber). Note that $f^(-1)$ is sometimes not "the inverse function".
    - You can make these more clear by drawing a graph.
  - Subgroup criterion: Let $G$ be a group and $S subset.eq G$, then $S$ is a  subgroup of $G$ if for all $a, b in S$ we have $a b^(-1) in S$.
  - Generators.
  - Cyclic groups / subgroups.
  - Groups you are already familiar with: $ZZ, QQ, RR, CC, QQ^times, RR^times, CC^times$.
  - Groups you may not be familiar with: $D_(2n), C_n, Q_8$.
]

#slide[
  - Homomorphism: Let $G, G'$ be groups and $phi: G -> G'$ be a mapping. We say $phi$ is a homomorphism if for all $x, y in G$ we have $phi(x y) = phi(x) phi(y)$. Informally, $phi$ is structure-preserving.
  - An isomorphism is a bijective homomorphism.
  - Let $phi: G -> G'$ be a group homomorphism, $H <= G$, $H' <= G'$. Then
    - $phi(H) <= G'$. Especially, $phi(G) <= G'$.
    - $phi^(-1)(H') <= G$. Especially, the kernel $ker phi := phi^(-1)({e}) <= G$.

]

#slide[
  == Normal subgroups

  #definition("Normal subgroups")[
    A subgroup $H$ of $G$ is normal if $x H x^(-1) = H$ for all $x in G$. We say "$H$ is normal in $G$" or write $H triangle.l G$.
  ]

  Remark: some equivalent definitions are
  - $x H = H x$
  - $x H x^(-1) subset.eq H$

  #example[
    For any group $G$, both $G$ and the trivial subgroup ${e}$ are normal in $G$.
  ]
  #example[
    Any subgroup of $G$ is normal if $G$ is abelian.
  ]
  #example[
    $chevron.l s chevron.r$ is not normal in $D_(2n)$ for $n >= 3$.
  ]
  Easy exercise: verify the above statements.

  Important exercise: Let $H <= G$ and $N triangle.l G$. Show that $H N <= G$. Moreover, if $H triangle.l G$, then $H N triangle.l G$.

  Exercise: Let $A$ be an index set (do not assume it's countable), and ${H_alpha}_(alpha in A)$ be a collection of normal subgroups in $G$. Show that $chevron.l {H_alpha}_(alpha in A) chevron.r = {h_1 dots h_n | n in NN, h_i in union.big_(alpha in A) H_alpha}$ is still normal in $G$.
]

#slide[
  == Cosets and Quotient Groups

  #definition("Cosets")[
    Let $H <= G$, then we denote $G slash H$ "the set of (left) cosets"

    $ G slash H := { x H | x in G } $

    where $x H := {x h | h in H}$.
  ]
  #definition("Quotient groups")[
    If $H triangle.l G$, then $G slash H$ forms a group, where the group operation is defined by

    $ x H dot y H = x y H $

    The group $G slash H$ is called a *quotient group*. Also, let $pi: G -> G slash H$ be defined by $pi(x) := x H$, then $pi$ is called a projection.
  ]

  #exercise[Show that the group operation on a quotient group is well defined. In other words, the result of the operation is independent of the choice of representatives.]
  #exercise[Show that $pi$ is a homomorphism, and its kernel $ker pi = H$.]
]

#slide[
  == Use homomorphisms to define normal subgroups

  #theorem[
    Let $phi: G -> G'$ be a group homomorphism, then $ker phi triangle.l G$.
  ]
  #proof[
    Use the definition of kernel and normal subgroups.
  ]
]

#slide[
  #theorem[
    If $N$ is a normal subgroup of $G$, then $N$ must be the kernel of some group homomorphism from $G$.
  ]
  #proof[
    Let $pi: G -> G slash N$ defined by $pi(x) := x N$. Then verify that $pi$ is indeed a group homomorphism, and that $N = ker pi$.
  ]
  #exercise[We already know $G$ and ${e}$ are normal in $G$. Can you find homomorphisms with kernel $G$ and ${e}$ respectively?]

  #exercise[Let $H$ and $K$ be normal subgroups of $G$. Show that $H inter K$ is also normal in $G$ by (1) using the definition of normal subgroups directly (2) constructing a group homomorphism.]

  #exercise[Let $A$ be an index set (do not assume it's countable), and ${H_alpha}_(alpha in A)$ be a collection of normal subgroups in $G$. Show that $inter.big_(alpha in A) H_alpha$ is still normal in $G$.]
]

#slide[
  == The Isomorphism Theorems

  #theorem("First Isomorphism Theorem")[Let $phi: G -> G'$ be a group homomorphism, then $ G slash ker phi tilde.equiv f(G) $
  ]
  #proof[
    Denote $N := ker phi$. Let $f: G slash N -> phi(G)$ with $f(x N) := phi(x)$. Show that $f$ is well-defined, bijective and is a homomorphism.
  ]

  The First Isomorphism Theorem is very very important.

  And yes, there are the second and the third isomorphism theorems, which we will cover later.
  #exercise("Dummit Foote 3.3.7")[
    Let $M$ and $N$ be normal subgroups of $G$ such that $M N = G$. Prove that $ G slash (M inter N) tilde.equiv (G slash M) times (G slash N) $
  ]
]

#slide[
  #exercise("Dummit Foote 3.3.8")[
    Let $p$ be a prime and let $P subset.eq CC^times$ be defined by $ P := {z | z^p^n = 1 "for some" n in NN} $

    1. Show that $P <= CC$. Deduce that $P triangle.l CC$ by the fact that $CC^times$ is abelian.
    2. Define $phi: P -> P$ by $phi(z) = z^p$. Show that $phi$ is a surjective homomorphism. Deduce that $P$ is isomorphic to some of its quotient group.

  ]
]

#slide[
  Now use the First Isomorphism Theorem to prove the second and third.

  #theorem[Let $N <= G$ and $H <= N_G (N)$, then $H N <= G$.]
  #proof[$H <= N_G (N)$ implies $h N h^(-1) = N$ for all $h in H$. Let $h_1 n_1, h_2 n_2 in H N$ where $h_1, h_2 in H$ and $n_1, n_2 in N$. Use the subgroup criterion, i.e. verify that $h_1 n_1 (h_2 n_2)^(-1) in H N$.]
  #theorem("Second Isomorphism Theorem")[Let $N <= G$ and $H <= N_G (N)$, then $H N slash N tilde.equiv H slash (H inter N)$.]
  #proof[Let $phi: H -> H N slash N$ be defined by $phi(h) = h N$. Verify it is indeed a surjective homomorphism and use the first isomorphism theorem.]

  The second Isomorphism theorem is a key step for us to prove Jordan Holder theorem.
]

#slide[
  #theorem("Third Isomorphism Theorem")[
    Let $H, K$ be normal subgroups of $G$ with $K <= H$, then $ G slash H tilde.equiv (G slash K) / (H slash K) $
  ]
  #proof[
    Let $phi: G slash K -> G slash H$ be defined by $phi(x K) = x H$. Verify that this map is a well-defined surjective homomorphism and use the first isomorphism theorem.
  ]
  This theorem shows that we gain no new structural information from taking quotients of a quotient group.
]

#slide[
  The second and the third isomorphism theorem can be viewed as important exercises of the application of the first isomorphism theorem.
]

#slide[
  #image("images/image copy.png")
]

#slide[
  == Back to "solvable groups"

  Recall the definition: A finite group $G$ is *solvable* if there exists a chain of subgroups

  $ 1 = G_s triangle.l G_(s-1) triangle.l ... triangle.l G_2 triangle.l G_1 = G $

  with $G_i slash G_(i+1)$ cyclic for $i=1, ... ,s - 1$.

  Note that $G_i$ need not to be normal in $G$ for $i = 2, ..., s - 1$.

  #example[$1 triangle.l chevron.l s chevron.r triangle.l chevron.l s, r^2 chevron.r triangle.l D_8$, but $chevron.l s chevron.r$ is not normal in $D_8$ as we practiced earlier.]

  We now have to define the term *composition series*.
]

#slide[
  == Subnormal series & Composition series

  We just learned how to "decompose" groups by taking quotients. Can we decompose groups just like how we factorize positive integers into prime numbers?

  Let me first provide more definitions for simplicity.

  #definition("Subnormal series & factor groups")[
    A subnormal series of a group $G$ is a chain of subgroups

    $ 1 = G_s triangle.l G_(s-1) triangle.l ... triangle.l G_2 triangle.l G_1 = G $

    The quotient groups $G_i slash G_(i+1)$ are called the *factor groups* of the series.
  ]

  #definition("Simple groups")[A nontrivial group $G$ is called *simple* if the only normal subgroups are only $1$ and $G$.]

  #definition("Composition series")[
    A *composition series* of $G$ is a subnormal series of *finite length* where all the factor groups are simple.
  ]
]

#slide[
  #example($D_8$)[All of the followings are composition series of $D_8$:
    - $1 triangle.l chevron.l s chevron.r triangle.l chevron.l s, r^2 chevron.r triangle.l D_8$
    - $1 triangle.l chevron.l s r chevron.r triangle.l chevron.l s r, r^2 chevron.r triangle.l D_8$
    - $1 triangle.l chevron.l r^2 chevron.r triangle.l chevron.l r chevron.r triangle.l D_8$

    All the factor groups are isomorphic to $C_2$.

    But $1 triangle.l chevron.l r chevron.r triangle.l D_8$ is not a composition series because $chevron.l r chevron.r tilde.equiv C_4$ is not simple.
  ]

  #example($Q_8$)[
    All of the followings are composition series of $Q_8$:
    - $1 triangle.l chevron.l -1 chevron.r triangle.l chevron.l i chevron.r triangle.l D_8$
    - $1 triangle.l chevron.l -1 chevron.r triangle.l chevron.l j chevron.r triangle.l D_8$
    - $1 triangle.l chevron.l -1 chevron.r triangle.l chevron.l k chevron.r triangle.l D_8$

    All the factor groups are isomorphic to $C_2$.
  ]
  #exercise[Find 2 composition series of $C_(12)$. What are the factor groups?]
]

#slide[
  == Some unsolvable groups

  The group $S_5$ is not solvable. Here is the only composition series of $S_5$:

  $ 1 triangle.l A_5 triangle.l S_5 $

  Where $A_5$ is simple but not cyclic. More generally, $S_n$ is not solvable for $n >= 5$ because $A_n$ is simple for $n >= 5$.
]

#slide[
  Now we have a basic understanding of composition series. Here are some follow up questions:

  1. Does composition series of a group always exist?
  2. If $G$ has a composition series, is it unique?

  #image("images/image copy 2.png", width: 50%)
]

#slide[
  For the first question, yes for finite groups, and no for infinite groups.

  #exercise[$ZZ$ does not have a composition series.]

  #theorem("Jordan Holder (part 1)")[Any nontrivial finite group has a composition series.]
  #proof[Induction on $|G|$. The case $|G| = 2$ is trivial.

  Now suppose that the statement is true for groups with order smaller than $|G|$.
  If $G$ is simple, the proof is trivial. Otherwise, let $N$ be a maximal proper normal subgroup of $G$. Note that $G slash N$ is simple. By the induction hypothesis, $N$ has a composition series $1 triangle.l N_s triangle.l ... triangle.l N_0 = N$. Now we have a composition series of $G$: $1 triangle.l N_s triangle.l ... triangle.l N_0 = N triangle.l G.$
  ]
]

#slide[
  == Uniqueness (?) of composition series of a finite group

  For the second question, the answer is obviously no by the previous $Q_8$ and $D_8$ examples. However, if we slightly "loosen" the statement, then Jordan Holder theorem says yes for finite groups.

  #theorem("Jordan Holder (part 2)")[
    Let $G$ be a nontrivial finite group. The factor groups in a composition series of $G$ are unique up to isomorphism and some permutation. More formally, let $1 = N_0 triangle.l ... triangle.l N_r = G$ and $1 = M_0 triangle.l ... triangle.l M_s = G$ be two composition series of $G$, then

    - $r = s$
    - There is some permutation $sigma in S_r$ such that $N_i slash N_(i-1) tilde.equiv M_(sigma(i)) slash M_(sigma(i) - 1)$ for all $i = 1, ..., r$.
  ]

  #exercise[Verify the theorem with the groups $D_6, D_8, Q_8, C_12$.]
]

#slide[
  == Proof of Jordan Holder Theorem

  Proof outline:
  - Induction on $|G|$.
    - Trivial for $|G| = 2$
    - Induction on $min(r, s)$.
      - Trivial for $min(r, s) = 1$.
      - Case $N_(r-1) = M_(s-1)$.
      - Case $N_(r-1) != M_(s-1)$.

  This part will be hand-written.
]
