## Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.

## The following function returns a list with the following attributes :
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse
## 4) get the value of the inverse

makeCacheMatrix <- function(x = matrix()) {
  
  i <- NULL
  set <- function(y)
  {
     x <<- y
     i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  
  list(get = get, setinverse = setinverse, getinverse = getinverse)
}



## The following calculates the inverse of the matrix
## It first checks whether the inverse already exists in the cache
## If it does it returns the inverse from the cache
## If it doesn't, it calculates it and then returns it

cacheSolve <- function(x, ...) {
        
  i <- x$getinverse()
  if(!is.null(i))
  {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data)
  x$setinverse(i)
  i
}
