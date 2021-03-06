##
##
##    multipair.util.R
##
##    $Revision: 1.13 $	$Date: 2014/04/29 01:13:35 $
##
##    Utilities for multitype pairwise interactions
##	
## -------------------------------------------------------------------
##	

MultiPair.checkmatrix <-
  function(mat, n, matname, naok=TRUE, zerook=TRUE, asymmok=FALSE) {
    if(missing(matname))
      matname <- short.deparse(substitute(mat))
    if(!is.matrix(mat))
      stop(paste(matname, "must be a matrix"))
    if(any(dim(mat) != rep.int(n,2)))
      stop(paste(matname, "must be a square matrix,",
                 "of size", n, "x", n))
    isna <- is.na(mat)
    if(!naok && any(isna))
      stop(paste("NA entries not allowed in", matname))
    if(any(mat[!isna] < 0))
      stop(paste("Negative entries not allowed in", matname))
    if(!zerook && any(mat[!isna] == 0))
      stop(paste("Zero entries not allowed in", matname))
    if(!asymmok && !isSymmetric(mat))
      stop(paste(matname, "must be a symmetric matrix"))
  }

