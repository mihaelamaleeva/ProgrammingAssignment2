## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  y <-NULL
  set <- function(z){
    x <<- z
    y <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) y<<- inverse
  getinverse <- function() y
  list(set= set, get=get,setinverse= setinverse,getinverse= getinverse)
}


## y is my free variable.The function is transformed from the vector example.

cacheSolve <- function(x, ...) {
  y <- x$getinverse()
  if(!is.null(y)){
    message("getting cached data")
    return(y)
  }
  data <- x$get()
  y <- solve(data, ...)
  x$setinverse(y)
  y
}
## You need the last four rows to run the function correctly.
mat <- makeCacheMatrix()
mat$set(matrix(data = (1:4), nrow = 2, ncol = 2))
makeCacheMatrix(mat)
cacheSolve(mat)