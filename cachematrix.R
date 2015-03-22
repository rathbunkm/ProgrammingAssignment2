#The following functions are used to calculate the inverse of a matrix
#and cache the result. If the inverse has already been calculated
#the cached inverse will be called, rather than calculating 
#the inverse again

#makeCacheMatrix calculates the inverse of an input matrix (x).
#It then stores both the inverse and the matrix in as variables
#in the parent environment (for calling in cacheSolve)

makeCacheMatrix <- function(x = matrix()) {
  #calculate the inverse  
  xinv<<- solve(x)
  #cache matrix used to calculate the inverse as new variable
  y <<- x
}


#cacheSolve will do 1 of 2 things, under certain conditions. First,
#if y=x, this means that the original matrix(x) has not been changed
#since running 'makeCacheMatrix', which means the inverse has already
#been calculated and has not changed. In this case, the cached inverse
#is called and returned, along with a message explaining the retrieval.
#However, if y is different from x, this means x has changed, and so
#a new inverse must be calculated. In this case, messages are displayed
#explaining that the matrix has changed and a new inverse is being
#calculated. Then, the inverse is calculated, stored, and y is reset
#in the parent environment for the next time 'cacheSolve' is called.
#This effectively makes 'makeCacheMatrix' useless, since 'cacheSolve'
#does the same steps, plus added functionality. It seemed better
#that way, but I wrote 'makeCacheMatrix' anyways, because the
#assignment required it.

cacheSolve <- function(x, ...) {

  #check if matrix is the same as previous runs 
  if(all(y == x)) {
      #retieve cached matrix and make action explicit via message
      message("getting cached inverse")
      return(xinv)
  } 
  
  #if matrix is new, calculate new inverse
  else {
    #explain matrix is new and inverse is being calculated
    message("matrix x has changed")
    message("new inverse:")
    #set new inverse in parent environment
    xinv<<- solve(x)
    #store matrix used to calculate inverse in parent environemt
    y <<- x
    return(xinv)
  }
}