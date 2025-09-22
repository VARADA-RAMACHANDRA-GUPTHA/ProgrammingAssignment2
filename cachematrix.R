## First, source your functions (assuming they're in cachematrix.R)source("cachematrix.R")

## Example 1: Creating a 2x2 matrix
# Create a test matrix
test_matrix <- matrix(c(4, 3, 3, 2), nrow=2, ncol=2)
print("Original Matrix:")
print(test_matrix)

# Create the special matrix object
cached_matrix <- makeCacheMatrix(test_matrix)

# First time computing inverse - should calculate
print("First time computing inverse:")
inverse1 <- cacheSolve(cached_matrix)
print(inverse1)

# Second time computing inverse - should retrieve from cache
print("Second time computing inverse (should use cache):")
inverse2 <- cacheSolve(cached_matrix)
print(inverse2)

## Example 2: Testing with a different matrix
# Change the matrix
new_matrix <- matrix(c(2, 1, 1, 1), nrow=2, ncol=2)
print("\nNew Matrix:")
print(new_matrix)

# Set the new matrix
cached_matrix$set(new_matrix)

# Computing inverse of new matrix - should calculate
print("Computing inverse of new matrix:")
inverse3 <- cacheSolve(cached_matrix)
print(inverse3)

## Verification
# Verify that the inverse is correct by multiplying original matrix with its inverse
print("\nVerification for first matrix:")
print("Original matrix × its inverse (should be identity matrix):")
print(test_matrix %*% inverse1)

print("\nVerification for second matrix:")
print("New matrix × its inverse (should be identity matrix):")
print(new_matrix %*% inverse3)
