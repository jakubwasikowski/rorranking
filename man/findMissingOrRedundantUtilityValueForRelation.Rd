\name{findMissingOrRedundantUtilityValueForRelation}
\alias{findMissingOrRedundantUtilityValueForRelation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function returns a missing (redundant) utility value that should be added (removed) to (from) a given variant to achieve (maintain) associated with it preference relation.
}
\description{
Function returns a missing (redundant) utility value that should be added (removed) to (from) a given variant to achieve (maintain) associated with it preference relation.
}
\usage{
findMissingOrRedundantUtilityValueForRelation(perf, a, b, strict.vf, is.possibly.preffered, strong.prefs = NULL, weak.prefs = NULL, indif.prefs = NULL, strong.intensities.of.prefs = NULL, weak.intensities.of.prefs = NULL, indif.intensities.of.prefs = NULL, rank.related.requirements = NULL, nums.of.characteristic.points = NULL, improvement = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
   \item{perf}{
m x n performance matrix with m alternatives and n criteria
}
  \item{a}{
An id of variant thats should be preffered to variant specified in b parameter
}
  \item{b}{
An id of the second variant. 
}
 \item{strict.vf}{
Whether to use sctrictly increasing (TRUE) or monotonously increasing (FALSE) value functions.
}
  \item{is.possibly.preffered}{
Parameter defining does a given target, should be achieved (maintained) for one (is.possibly.preffered == TRUE) or all (is.possibly.preffered == FALSE) utility functions.
}
\item{strong.prefs}{
  k x 2 matrix of strong preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is strongly preferred to preferences[k,2].}
  \item{weak.prefs}{
  k x 2 matrix of strong preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is strongly preferred to preferences[k,2]}
  \item{indif.prefs}{
  k x 2 matrix of indifference preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is equally preferred to preferences[k,2]. }
  \item{strong.intensities.of.prefs}{
    k x 4 or k x 5 matrix of strong preference intensities of preferences statements. Each row r mean that intensity preference relation between [k,1] and [k,2] is strongly preferred to intensity of preference relation between [k,3] and [k,4]. Fifth column is optional and could be used to determine a criterion which should be considered.
  }
  \item{weak.intensities.of.prefs}{
  k x 4 or k x 5 matrix of weak preference intensities of preferences statements. Each row r mean that intensity preference relation between [k,1] and [k,2] is weakly preferred to intensity of preference relation between [k,3] and [k,4]. Fifth column is optional and could be used to determine a criterion which should be considered.
  }
  \item{indif.intensities.of.prefs}{
  k x 4 or k x 5 matrix of indifferences between intensities of preference statements. Each row r mean that intensity preference relation between [k,1] and [k,2] is indifferent to intensity of preference relation between [k,3] and [k,4]. Fifth column is optional and could be used to determine a criterion which should be considered.
  }
  \item{rank.related.requirements}{
  k x 3 matrix. Each row means that alternative with id [k, 1] in the final ranking should achive a position between [k, 2] and [k, 3].
}
  \item{nums.of.characteristic.points}{ List of integers. value on n-th position, describes number of characteristic points used in n-th criterion. If value is 0, then no characteristic points are used. }
  \item{improvement}{
Parameter defining does improvement or deterioration is searched.
}
}

\value{
A list which contain an information about finded solution. 
\item{result}{ Element contains an improvement or deterioration by which variant should be multiplied to achieve (maintain) a target.}
}

\author{
Pawel Rychly
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (perf, a, b, strict.vf, is.possibly.preffered, strong.prefs = NULL, 
    weak.prefs = NULL, indif.prefs = NULL, strong.intensities.of.prefs = NULL, 
    weak.intensities.of.prefs = NULL, indif.intensities.of.prefs = NULL, 
    rank.related.requirements = NULL, nums.of.characteristic.points = NULL, 
    improvement = TRUE) 
{
    result <- missingUtilityNecessaryOrPossibleComprehensiveImprovement(perf = perf, 
        a = a, b = b, strict.vf = strict.vf, is.possibly.preffered = is.possibly.preffered, 
        strong.prefs = strong.prefs, weak.prefs = weak.prefs, 
        indif.prefs = indif.prefs, strong.intensities.of.prefs = strong.intensities.of.prefs, 
        weak.intensities.of.prefs = weak.intensities.of.prefs, 
        indif.intensities.of.prefs = indif.intensities.of.prefs, 
        rank.related.requirements = rank.related.requirements, 
        nums.of.characteristic.points = nums.of.characteristic.points, 
        improvement = improvement)
    return(result)
  }
}
