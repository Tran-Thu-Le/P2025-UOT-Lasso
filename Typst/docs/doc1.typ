#import "../tools/macros.typ": eqref, eqnum, myref, figref, remark-Le, delete-Le, add-Le, remark-Ngan, delete-Ngan, add-Ngan, theorem, definition, proposition, lemma, proof, example
#import "@preview/ctheorems:1.1.3": thmrules
#show: thmrules.with(qed-symbol: $square$)
// #set math.equation(numbering: "(1.1)", supplement: "Eq.")

// #let supp(x) = $"supp"(#x)$
#let supp = "supp"
#let OT = "OT"
#let diag = "diag"
#let vecmul(x, y) = $angle.l #x, #y angle.r$


= Abstract

In this paper we propose a Lasso-based model for unbalanced Optimal Transport (OT) on tree that can be efficiently computed in linear time. This improves the previous time complexity $O(n log^2 n)$ using Generalized Kantorovich Rubinstein (GKR) model @sato2020fast.

// = Introduction 
= Preliminaries

== Motivations

OT is important in machine learning. OT problem aims to find a way to transport mass from supply locations to demand locations.In the standard model of OT, we assume the balance between suppy and demand, this model is referred to as balanced OT. 

However balanced condition does not hold in practice. To handle the unbalanced cases, there are multiple approaches: 

+ *Relaxation Approaches:*  The most well-known relaxation for UOT is Entropic OT @cuturi2013sinkhorn. 

+ *Regularization Approaches:*  Observing that the optimal plan in Entropic OT is not sparse, other regularization methods has been introduced including L2 norm @blondel2018smooth, k-norm @liu2022sparsity.

+ *Tree-based Approaches:* Solving OT for a huge number of data points in $RR^d$ is time consuming. Recent approaches use line @bonneel2019spot and tree @le2019tree to approximate the data points, then solve OT on line and tree. The main benefit of doing this is that balanced OT on tree (and thus, on line) has closed-form expression allowing the evaluatation of balanced OT on tree in $O(n)$.  For the unbalanced OT on tree, a infimum-convolution based approached has been proposed with time complexity $O(n log^2 n)$ using the Generalized Kantorovich Rubinstein (GKR) model @sato2020fast.


*Contribution.* In this paper, we propose a Lasso-based model for unbalanced OT on tree allowing the computation in $O(n)$ using Soft-thresholding operator.


== Balanced OT on tree 

Given a directed tree $T$ with vertex set $V={v_1, ..., v_n}$ and edge set $E$ and root $v_1$. On $T$, there is a supply vector $a in RR^n_+$ and demand vector $b in RR^n_+$. Each edge $e in E$ has a nonnegative length say $ell(e)$. The edge lengths generate a distance between any two nodes of the tree.  

Without loss of generality, we assume in this paper that #footnote[Actually, we need to prove this claim.]

#align(center)[_The intersection of support of $a$ and support $b$ is empty_]


If the total suppy is not less than total demand, i.e. $ sum_(i=1)^n a_i = sum_(j=1)^n b_j $ 
then we have _balanced OT_ model 
$
  min quad & sum_(i, j =1)^n D_(i j)T_(i j)\
  "s.t." quad  & T 1_n = a\
  & T^T 1_n = b\
  & T in RR^( n times n)_+
$
where $D_(i j)$ is the distance between $v_i$ and $v_j$ in $V$ and $T_(i j)$ is the mass transported from sypply at $v_i$ to demand at $v_j$.


We denote the minimum value by $OT(a, b)$. In @le2019tree, the authors showed that $OT(a, b)$ has closed-form expression:
$
  OT(a, b) = sum_(i=2)^n ell(e_i) abs(hat(a)_i - hat(b)_i).
$
where $e_i$ is the edge connecting $v_i$ and its parent, $hat(a)_i$ (and $hat(b)_i$) is the cummulative distribution, i.e. $hat(a)_i = sum_(v_j in T_i) a_j$ ($hat(b)_i = sum_(v_j in T_i) b_j$) with $T_i$ the set of all descendants of $v_i$ including itself.
Notice that $hat(a)$ and $hat(b)$ can be computed recursively from the bottom-up approach, thus $OT(a, b)$ can be computed in $O(n)$.

It is important to notice that OT formula can be rewritten in vector form 
$
  OT(a, b)= norm(A(a-b))_1
$
where $A = Lambda H in RR^(n times n)$ where $Lambda = diag(0, ell(e_2), ..., ell(e_n))$ and $H$ is the matrix mapping $a$ to $hat(a)$, i.e. $H a=hat(a)$.


== Unbalanced OT on tree 

One way to model the unbalanced OT is to use the Generalized Kantorovich Rubinstein (GKR) distance defined as follows
$
  OT(a, b) 
  = min_(T in U)
  sum_(i, j =1)^n D_(i j) T_(i j) 
  + vecmul(lambda_d, a - T 1_n) + vecmul(lambda_c, b - T^T 1_n)
$
where 
$
  U = {T in RR^(n times n)_+: T 1_n <= a, T^T 1_n <= b}.
$

Loosely speaking, GRK model finds a plan $T in U$ such and then penalize when there is any destruction of supply or any create of demand. 

= The proposed model for unbalanced OT based on Lasso
Now, assuming that there is no balance and without loss of generality, we assume that the total supply is not less than total demand 
$ sum_(i=1)^n a_i >=  sum_(j=1)^n b_j $ 

We assume that 
- There are destructions of supply denoted by $x in RR^n_+$, so the new supply is $a - x$
- There are creations of demand denoted by $y in RR^n_+$, so the new demand is $b + y$
- There is a balance between new supply and new demand, i.e. 
$ sum_(i=1)^n a_i-x_i =  sum_(j=1)^n b_j+ y_j $ 
Which can be rewritten as 
$ sum_(i=1)^n x_i+y_i =  Delta := sum_(i=1)^n a_i -b_i  $  


We propose to consider the following problem 

$
  min_(x, y in RR^n_+) quad &
  OT(a- x, b+y)  + vecmul(lambda_d, x) + vecmul(lambda_c, y)\
  "s.t." quad & sum_(i=1)^n x_i+y_i =  Delta.
$

Since $a- x$ and $b- y$ satisfy the balanced condition on tree, thus 
$OT(a- x, b+y)$ can be computed in closed-form
$
  OT(a- x, b+y) = norm(A((a - x) - (b + y)))_1= norm(c - A z)_1.
$
where $c=A(a -b)$ and $z = x+ y$. We have the problem 


- If $lambda = lambda_d = lambda_c$, we have L1 norm regression.
$
  min norm(c - A z)_1.
$

= Algorithm for the proposed UOT 

In the current version of the paper, we assume that $lambda_d = lambda_c in RR$, then we have the problem
$
  min_(z in RR^n_+) sum_(i=2)^n ell(e_i) abs( hat(p)_i - hat(z)_i).
$

= Future works

- When $lambda_d != lambda_c$, how to solve the problem?

// - 
















