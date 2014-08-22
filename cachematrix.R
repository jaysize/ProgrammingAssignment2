## These functions help to take an input matrix, calculate the inverse, and cache
## the result. If the inverse has already been cached, the function will simply
## call the cached value

## This function simply creates a list of other functions to call that 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the mean
## 4. get the value of the mean

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function()x
        setinverse <- function(inverse) m <<- inverse
        getinverse <- function()m
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## This matrix either pulls the value of the matrix inverse from the cache or
## calculates it.

cacheSolve <- function(x, ...) {
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setinverse(m)
        m
        ## Return a matrix that is the inverse of 'x'
}
