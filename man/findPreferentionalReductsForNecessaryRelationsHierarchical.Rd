\name{findPreferentionalReductsForNecessaryRelationsHierarchical}
\alias{findPreferentionalReductsForNecessaryRelationsHierarchical}
\title{Finds all rank related preferentional reducts - hierarchical version.}
\description{ Function finds all preferentional reducts for a each necessary relation. In this version of function, a hierarchical informations are considered. }
\usage{
findPreferentionalReductsForNecessaryRelationsHierarchical(perf, strict.vf, strong.prefs = NULL, weak.prefs = NULL, indif.prefs = NULL, nums.of.characteristic.points = NULL, criteria=NULL, nec.relations = NULL, hierarchy.data = NULL)
}
\arguments{
  \item{perf}{
  m x n performance matrix with m alternatives and n criteria}
  \item{strict.vf}{
  Whether to use sctrictly increasing (TRUE) or monotonously increasing (FALSE) value functions.}
  \item{strong.prefs}{
  k x 2 or k x 3 matrix of strong preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is strongly preferred to preferences[k,2]. The third column is optional and it describes a node id, which describes a criteria set, which should be considered. }
  \item{weak.prefs}{
  k x 2 or k x 3 matrix of strong preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is strongly preferred to preferences[k,2]. The third column is optional and it describes a node id, which describes a criteria set, which should be considered. }
  \item{indif.prefs}{
  k x 2 or k x 3 matrix of indifference preferences statements (row indices of alternatives in the performance matrix). Each row r is a preference statements meaning that preferences[k,1] is equally preferred to preferences[k,2]. The third column is optional and it describes a node id, which describes a criteria set, which should be considered. }
  \item{nums.of.characteristic.points}{ List of integers. value on n-th position, describes number of characteristic points used in n-th criterion. If value is 0, then no characteristic points are used. }
  \item{criteria}{ List of characters. value on n-th position, determines the type of n-th criterion. If value equals "c" then criterion is cost. Otherwise the type of criterion is gain. }
  \item{nec.relations}{
    A list keyed by node ids (described in hierarchy.data). Each value of list is a m x 2  matrix with m alternatives. First column describes the worst possible ranking. The second column describes the best possible ranking position of variant.
  }
  \item{hierarchy.data}{
    a list which contains two elements. 
    criteria.by.nodes - Is a list of criteria ids list, keyed by an node ids.
    hierarchy.tree - describes a hierarchy. It is a recursive list, keyed by a node ids. example: list(root = list(a1=list(a11=list(), a12=list()), a2=list()))

  }
}

\value{
A list keyed by node ids. (described in hierarchy.data argument). Each value is a list of list of reducts keyed by an necessary relations. Reduct is described as an list of strings which describes a preference relations given by DM.
}

\author{
Pawel Rychly
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (perf, strict.vf, strong.prefs = NULL, weak.prefs = NULL, 
    indif.prefs = NULL, nums.of.characteristic.points = NULL, 
    nec.relations = NULL, hierarchy.data = NULL) 
{
    results <- list()
    hierarchy.data <- prepareHierarchyData(perf, hierarchy.data)
    err <- NULL
    if (hierarchy.data[["status"]] == "OK") {
        nodes <- hierarchy.data$nodes
        criteria.by.nodes <- hierarchy.data$criteria.by.nodes
        for (node.id in nodes) {
            reducts <- findReductsForNecRelations(perf = perf, 
                strict.vf = strict.vf, strong.prefs = strong.prefs, 
                weak.prefs = weak.prefs, indif.prefs = indif.prefs, 
                nums.of.characteristic.points = nums.of.characteristic.points, 
                nec.relations = nec.relations[[node.id]], criteria.by.nodes = criteria.by.nodes, 
                nodeid = node.id)
            results[[node.id]] = reducts
        }
    }
    return(results)
  }
}

