## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Call "MASS" library for running ginv() function
makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(inverse) inv <<- inverse
  getinv <- function() {
    invert <- ginv(x)  ## can get information by typing "?ginv" in console
    invert %*% x
  }
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}	

## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
   inv <- x$getinv()
  if(!is.null(inv)) {
    message("getting cached data!")
    return(inv)
  }
  invert_data <- x$get()
  inv <- solve(invert_data, ...)
  x$setinv(inv)
  inv
}
