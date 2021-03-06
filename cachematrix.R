## These two functions are adaptations from the original ones given in the 
## assignment description, they take a matrix (and we assume it's an invertible  
## one) and then generate:
## - An object (a list) that is going to keep the inverse of the matrix cached.
## - A function that will only compute the inverse if this has not been computed
##   before.


## -----------------------------------------------------------------------------

## makeCacheMatrix generates a list containing four elements:
## - 'set' which is going to be a function that can modify the initial data.
## - 'get' where the input matrix is going to be stored.
## - 'setinverse' where the value of the inverse is going to be input.
## - 'getinverse' where the inverse of the matrix is stored.

makeCacheMatrix <- function(x = matrix()) {
        
        # This function looks exactly as 'makeVector'
        # The only change is Configuring the parameter 'x' as a matrix
        
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinverse <- function(invMatrix) m <<- invMatrix
        getinverse <- function() m
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}


## -----------------------------------------------------------------------------

## This function will take the list generated by 'makeCacheMatrix' and:
## - Look at 'getinverse' to see if the inverse has already been computed
## - If yes, return the value
## - If not, compute the inverse of the matrix and set it in 'setinverse'
## ...and then return the proper value.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        # This is also equal to 'cachemean'
        # The only difference being the use of function 'solve'
        # This function will not detect if the matrix is singular
        
        m <- x$getinverse()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinverse(m)
        m
}
