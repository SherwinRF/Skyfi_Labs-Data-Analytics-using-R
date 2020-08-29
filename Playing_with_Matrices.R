
1:10
2.3:11

a <- 1:10
b <- 5:14

matrix(a)
matrix(a, nrow = 5)
c <- matrix(a, ncol = 3)
d <- matrix(b, ncol = 3)

c+d
c*d
c%%d

colnames(c) <- c("First","Second","Third")
rownames(c) <- c("R1","R2","R3","R4")

# Matrix Function
matrix(1:12, byrow = FALSE, nrow = 4)
matrix(1:12, byrow = TRUE, nrow = 4)

s <- matrix(1:30, byrow = F, nrow = 5)
s[2,3]
s[,6]
s[1:3,4:5]

# binding matrices - Column Bind
cbind(a,b)

# Transpose of matrx
t(a)

# Sum of Rows and Columns
colSums(s)
rowSums(s)

# Mean
rowMeans(s)
colMeans(s)

