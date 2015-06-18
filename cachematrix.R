## Put comments here that give an overall description of what your
## functions do

## function returns a list of get and set methods to manage a cached matrix:
### get returns the matrix
### set will set the value of the matrix
### getinverse returns the inverse of the matrix
### setinverse creates the inverse and caches it

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setinverse <- function(solve) m <<- solve
    getinverse <- function() m
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## returns cached value of inverse matrix, if it exists, calculates it otherwise

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    m <- x$getinverse()
    if (!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setinverse(m)
    m
}
