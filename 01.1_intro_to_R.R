## example R code (intro to R)
## author: alice yue


# Adding "#" at the beginning of this line makes this a comment!
# Use comments to tell the reader what you are doing (documentation).
# Comments are not run.

## variables ####

# numerics, used to perform arithmetics
1 + 1
2 * 3
8 / 2
1 / (2 + ((2 + 3) * 5))
2^3
sqrt(9)
log10(100)
log2(3)
log(5)


# variables, used to store stuff
x1 <- 5
x1

x1 <- 1 # replaces previously assigned value
x1

x2 <- 2
x3 <- x1 + x2
x3


# strings, a sequence of characters
s1 <- "one plus one"
s2 <- "is"
s3 <- paste0(s1, " ", s2, ": ", x3)

# print a message to console
print(s3)


# vectors, lists; indexing, length
xv1 <- c(x1, x2, x3, 5)
xv2 <- c(1:5)
sv1 <- c(s1, s2, "last string")
sv2 <- rep("a", 4) # rep = repeat

xv1
xv1[1]
length(xv1)

xv2
xv2[2]
length(xv2)

sv1
sv1[c(2:3)]
length(sv1)

sv2
sv2[length(sv2)]
length(sv2)

# lists
l1 <- list(xv1, xv2, sv1, sv2)
l1
length(l1)

names(l1) <- c("a", "b", "c", "d")
l1[[1]]
l1[c(1:3)]
l1[["c"]]


## matrices; dimensions, column/row naming, indexing ####
sm <- matrix("a", nrow=3, ncol=2)
sm
ncol(sm)
nrow(sm)
dim(sm) # dim=dimensions

xm <- matrix(0, nrow=2, ncol=3)
xm

nm <- matrix(c(1:9), nrow=3, ncol=3)
nm
nmcolumns <- paste0("column", c(1:ncol(nm)))
nmrows <- paste0("row", c(1:nrow(nm)))
colnames(nm) <- nmcolumns
rownames(nm) <- nmrows
nm

nm[2,1] # single numeric
nm[c(1:2),2] # matrix
nm[1,] # vector
nm[,2]
nm["row1",]
nm[,"column2"]

nm2 <- nm[,2] # vector
length(nm2)

nm2 <- nm[,2, drop=FALSE] # matrix
dim(nm2)

newm <- rbind(xm, nm) # row bind two matrices together; column bind with cbind()
newm
dim(newm)

# data.frame() is like matrix but each column 
# can contain different types of variables
d <- data.frame(name=c("bob", "mike", "emily"), age=c(10, 12, 13))
d
dim(d)
nrow(d)
ncol(d)
d[["name"]] # columns can be accessed like a list element
d[["age"]]


## TRY: practice problems ####

# 1.a) Create a numeric variable called "good_number" and assign it the number 10.

# 1.b) Add 5 to "good_number" and assign the resulting value back into "good_number".

# 1.c) Create a vector variable called "good_numbers" with length "good_number". All of its elements should be "good_number".

# 1.d) Add "good_number" to "good_numbers", what do you get as a result? What if you do "good_numbers * 2"? "good_numbers + good_numbers"?

# 1.e) Print the message "My good number is: ..." to console using "print()" (replace ... with the number in "good_number"). Do NOT hard code any number.

# 2.a) Create a numeric matrix variable called "my_matrix" with 10 rows and 2 columns. You can have it contain whatever numbers you want.

# 2.b) Add 2 to every number in "my_matrix".

# 2.c) Extract the number in the 1st row and 2nd column of "my_matrix" and put it into a variable called "my_number".

# 2.d) Extract the 2nd column of "my_matrix" and put it into a variable called "my_vector".

# 2.e) Extract the 2nd, 4th, and 5th elements in "my_vector" and put them into another vector variable called "my_vector2".

# 3.a) Create a data frame variable called "my_df", with 3 rows and 4 columns. The first column should contain the elements in "my_vector2". The other columns should be strings column with values of your choice.

# 3.b) Name the rows and columns in "my_df" with names of your choice.

# 3.c) Extract the 2nd column of "my_df" using the "$" symbol, again with the "[,]" syntax, and again with the "[[]]" syntax.

# 3.d) Extract the , and 2nd to 4th column of "my_df". What are the dimensions of your new data frame?

