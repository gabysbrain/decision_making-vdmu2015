---
Title: Making decisions in uncertainty visualization
---

# Motivation

When considering visual encodings for uncertainty it is imporant to not only
consider the perceptual accuracy of the encoding but also how the user will
interpret this uncertainty. 

* it is important when designing visual encodings of uncertainty to understand the user
* much of this is handled on a case by case basis
* why are different tools developed for similar tasks?

Concepts such as personality factors [@ref] and cognitive biases [@ref] have
previously been discussed by the visualization community. However, these
factors are designed to be fixed for life. Problem solving heuristics, on 
the other hand, differ on a case by case basis. The same user may choose
different heuristics for the same tasks and two different users may choose
different heuristics for the same task.

* understanding the final decision making process that the tool will use
  is what’s important

In summary are contributions are:

* we introduce problem solving heuristics from cog sci
* map these to previous design study work on uncertainty/parameter space exploration
* potential design guidelines

{>> another benefit is that these methods have methodologies for identifying them and studying them <<}

# Problem solving strategies

## Overview

* difference between "expert" decision makers and general decisions
* general decisions are more common in vis
* *definition*: selecting the best candidate amongst a number of 
  alternatives where the candidates have a number of competing objectives

## Heuristics

from the adaptive decision maker:

### Weighted additive rule

* Qualitative final comparison
* weight all objectives by how important they are
* the weighted sum determines the "best" choice

## Equal weight

* subset of weighted additive rule
* all objectives are treated equally

## Satisficing

* first acceptable alternative seen is the one selected

## Lexicographic

* the first acceptable alternative that is encoutered is selected
* acceptable is having factors above the acceptable value

## Elimination by aspects

* the most important attribute is selected along with a 
  "minimum acceptable value"
* candidates with values below this are eliminated
* the next round of filtering starts with the second most important attribute

## Majority of confirming dimensions

* pairwise comparison
* number of aspects that are "better" in the pair means it wins
* loser is eliminated from consideration
* winner is compared against the next candidate

## Frequency of good/bad features

* number of positive aspects minus number of negative aspects

# Design study methodology papers tags

To see if users indeed use different strategies we coded the 21 papers
from the visual parameter space analysis paper [@Sedlmair:2014] with the
decision heuristic types above (or none).  We found that 6/8 of the papers
described some sort of heuristic when describing the task analysis,
user characterization, or case study.

{>> this should probably become a table... <<}

## Policy making papers

### Vismon

**type:** Elimination by aspects

The paper repeatedly refers to filtering strategies by constraints.
  - section 3.3
  - section 1, second column
  - the constraint pane is dedicated to reducing the 
    input and output space by attrribute

### Decision support for epidemic modeling

**type:** Lexicographic

The paper allows the user to compare decisions based on a single criterion.
  - section 3.3
  - comparisons against a primary decision path
  - only can evaluate based on one attribute

### Hypermoval

**type:** ??? not really any

No strong focus on decision making in the paper

Focused on evaluating different regression models and how well they fit
the sampled data points.
  - models are developed by starting at 2 parameters and adding one 
    factor at a time (sec 6.1)
  - additional parameters are evaluated against previous models

### Interactive visual steering

not really about decision making

### Interactive visual analysis of families of function graphs

Not really about decision making I think

Trying to figure out what parameters affect the output

### World lines

**type:** Elimination by aspects

Goal is to rapidly eliminate poor solutions.
  - see section 8.2 and section 10
  - elimination is the key word here...
  - not really one of the options in adaptive decision maker
  - closest is elimination by aspects

Note: weird this is different from epidemic modeling...

## Design papers

### Design galleries

**type:** Lexicographic

Distance metric can be seen as the weighting function
  - section 2.3, hierarchical sorting/arrangement

## Engineering papers

### Berger 2011

Not really about optimization even, just SA and PSA

### Visualization for functional design

**type:** Elimination by aspects

Select a point in output space and see which inputs generated that.
  - inverse design
  - limit by performance limits, but simultaneously

# Discussion

Some interesting facts so far:

## Most popular are sorting or elimination

Lexicographic and elimination by aspects are the most popular heuristics
by far. Both of these concentrate on one parameter at a time and are
about filtering alternatives.

## Satisficing?

* not sure if this fits with the goals of vis
    - vis is about making analytic decisions
    - this is more something to watch out for... cognitive bias?
* is this ever a good strategy/heuristic? {>> research this <<}

## Weighted parameter heuristics are missing

This is supported by papers such as LineUp [@Gratzl:2013] but none of the
tools in the vPSA paper work this way {>> I think... <<}

## The decision strategy is never discussed or compared

in the design study papers and in the VPSA paper:

* alternatives never considered
* the word "decision" is never defined or losely defined

# Conclusion

yay! 

