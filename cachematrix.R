## Put comments here that give an overall description of what your
## The makCacheMatrix function creates a list containing a function to

## set the value of the matrix
## get the value of the matrix
## set the value of the inverse
## get the value of the inverse

## It caches its inverse and store the value in variable m.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse  <- function(solve) m <<- solve
  getinverse  <- function() m
  list(set = set, get = get,
       setinverse  = setinverse ,
       getinverse  = getinverse )
}


## The cacheSolve funtion computes the inverse of the matrix object from the function above. 
## if the inverse has already been calculated, the cacheSolve will retrieve the inverse from the cache, 
## 5otherwise it will calculate the inverse and sets the reslut via setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse ()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse (m)
  m
}
