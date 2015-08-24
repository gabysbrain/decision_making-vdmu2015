---
Title: Making decisions in uncertainty visualization
---

# Motivation

When considering visual encodings for uncertainty it is imporant to not only
consider the perceptual accuracy of the encoding but also how the user will
interpret this uncertainty. 

* it is important when designing visual encodings of uncertainty 
  to understand the user
* much of this is handled on a case by case basis
* why are different tools developed for similar tasks?

{>> important to say who's decisions we are trying to model <<}

Concepts such as personality factors [@ref] and cognitive biases [@ref] have
previously been discussed by the visualization community. However, these
factors are designed to be fixed for life. Problem solving heuristics, on 
the other hand, differ on a case by case basis. The same user may choose
different heuristics for the same tasks and two different users may choose
different heuristics for the same task.

* it's important for the tool designer to understand the final decision 
  making process that the tool will use is what’s important
* don't consider it formally or the alternative heuristics/strategies

In summary our contributions are:

* we introduce problem solving heuristics
* map these to previous design study work on uncertainty/parameter space exploration
* potential design guidelines allowing visualization designers to design
  better (more easily adopted) visualization tools faster (fewer iterations)

{>> another benefit is that these methods have methodologies for identifying them and studying them <<}

{>> can this be used to better identify a successful optimization design study? <<}

# Problem solving strategies

## Overview

* difference between "expert" decision makers and general decisions
* general decisions are more common in vis
* *definition*: selecting the best candidate amongst a number of 
  alternatives where the candidates have a number of competing objectives

|Paper|Citation|Heuristic|Class|
|:-----|:-----|:-----|:-----|
|Visual analytics decision support environment for epidmic modeling and response evaluation|Afzal:2011|LEX|Science|
|Visual Optimality and Stability Analysis of 3DCT Scan Positions|Amirkhanov:2010|EQW|Engineering|
|Uncertainty-Aware Exploration of Continuous Parameter Spaces Using Multivariate Prediction|Berger:2011|LEX|Engineering|
|ParaGlide: Interactive Parameter Space Partitioning for Computer Simulations|Bergner:2013|WADD|Engineering|
|Vismon: Facilitating analysis of trade-offs, uncertainty, and sensitivity in fisheries management decision making|Booshehrian:2012|EBA|Policy making|
|Parameter Sensitivity Visualization in DTI Fiber Tracking|Brecheisen:2009|EQW|Science|
|Result-Driven Exploration of Simulation Parameter Spaces for Visual Effects Design|Bruckner:2010|MCD|Design|
|Design by Dragging: An Interface for Creative Forward and Inverse Design with Simulation Ensembles|Coffey:2013|FRQ|Engineering|
|Model Space Visualization for Multivariate Linear Trend Discovery|Guo:2009|None|N/A|
|Interactive visual analysis of families of function graphs|Konyha:2006|None|Engineering|
|Supporting the integrated visual analysis of input parameters and simulation trajectories|Luboschik:2014|LEX|Science|
|Design Galleries: A general approach to setting parameters for computer graphics and animation|Marks:1997|LEX|Design|
|Interactive visual steering - Rapid visual prototyping of a common rail injection system|Matkovic:2008|None|Engineering/science|
|Interactive Visual Analysis of Complex Scientific Data as Families of Data Surfaces|Matkovic:2009|EBA|Engineering|
|HyperMoVal: Interactive visual validation of regression models for real-time visualization|Piringer:2010|None|Validation|
|Ensemble-Vis: A Framework for the Statistical Visualization of Ensemble Data|Potter:2009|None|Science|
|Visualization of parameter space for image analysis|Pretorius:2011|LEX|Engineering|
|Visualization for functional design|Spence:1995|EBA|Engineering|
|Tuner: Principled Parameter Finding for Image Segmentation Algorithms Using Visual Response Surface Exploration|Torsney-Weir:2011|LEX|Engineering|
|A Visual Analysis Concept for the Validation of Geoscientific Simulation Models|Unger:2012|None|Validation|
|World lines|Waser:2010|EBA|Policy making/training|

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

* the first acceptable alternative that is encoutered is selected
* acceptable is having factors above the acceptable value

## Lexicographic

* sort by most important attribute
* ties are broken by further attributes in order of importance

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

## Validation papers

### Unger 2012

**type**: None

More about validation exploration and not about decision making

### Hypermoval

**type**: ??? not really any

No strong focus on decision making in the paper

Focused on evaluating different regression models and how well they fit
the sampled data points.
  - models are developed by starting at 2 parameters and adding one 
    factor at a time (sec 6.1)
  - additional parameters are evaluated against previous models


## Policy making papers

### Vismon

**type**: Elimination by aspects

The paper repeatedly refers to filtering strategies by constraints.
  - section 3.3
  - section 1, second column
  - the constraint pane is dedicated to reducing the 
    input and output space by attrribute

### Decision support for epidemic modeling

**type**: Lexicographic

The paper allows the user to compare decisions based on a single criterion.
  - section 3.3
  - comparisons against a primary decision path
  - only can evaluate based on one attribute

### Interactive visual steering

not really about decision making

### Matkovic 2009

**type**: MCD

engineers filter out unwanted simulations based on a certain factor and 
then iteratively filter from there (Section 5.3)

### Interactive visual analysis of families of function graphs

Not really about decision making I think

Trying to figure out what parameters affect the output

### World lines

**type**: Elimination by aspects

Goal is to rapidly eliminate poor solutions.
  - see section 8.2 and section 10
  - elimination is the key word here...
  - not really one of the options in adaptive decision maker
  - closest is elimination by aspects

Note: weird this is different from epidemic modeling...

## Design papers

### Design galleries

**type**: Lexicographic

Distance metric can be seen as the weighting function
  - section 2.3, hierarchical sorting/arrangement

### FluidExplorer

**type**: MCD

Clusters outputs into similar sequences
  - user selected a candidate item and then the system 
    shows similar items

## Engineering papers

### Paramorama

**type**: LEX

Finding an optimum segmentation by hierarchical grouping of parameters

### Berger 2011

Not really about optimization even, just SA and PSA

### Visualization for functional design

**type**: Elimination by aspects

Select a point in output space and see which inputs generated that.
  - inverse design
  - limit by performance limits, but simultaneously

### 3DCT scanning positions

**type**: equal weight?

trying to find optimal positions of a materials for 
placing materials for scanning
  - sensitivity of placement is important
  - not sure but maybe equal weights?
  - system only concentrated on 2/x parameters...

### Berger 2011

**type**: Lexicographic

More of an exploration tool than one to really target and find an optimum
  - talks about wanting to find an optimum though
  - tradeoffs around a particular focus point

### Paraglide

**type**: WADD?

Wants to understand how many different behaviors a model has
  - allows a combination of objectives into a distance vector
  - distance measures are a weighting criteria basically

### DTI fiber tracking

**type**: EQW?

looking at stopping criteria and how it affects streamline length
  - have different ways of measuring length though
  - examining one factor at a time
  - not clear exactly how one would choose a stopping criteria

### Coffey 2013

**type**: FRQ?

Want to find goal configuration of a needle
  - basically starting at a particular candidate and 
    changing locally to others
  - comparison is done a few at a time though

## Science papers

### Luboschik 2014

**type**: LEX

* specifically calls out decision making in terms of selecting where to sample
* collapses the parameter space into a 1D representation
* sorting of the 1D space based on euclidean distance

### Potter 2009

**type**: None

More about exploring the outputs than acting on them

## Unclassified papers

### Guo 2008

**type**: None

Idea is to find linear trends in data through an interface
  - not really about optimization
  - could call the model selection decision making but not really

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

# Other papers

* [@Berger:2010]
* [@Gratzl:2013]

