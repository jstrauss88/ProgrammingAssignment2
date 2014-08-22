## the two functions allow to cache the inverse of a matrix so that it does 
## not have to be recalculated

## makes a special matrix which is really a list containing a function to set and get the value and inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {

      m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## calculates or retrieves from cash the invese of the original matrix

cacheSolve <- function(x, ...) {     m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
