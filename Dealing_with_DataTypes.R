data() # All Datatypes in R

# Some in-built datatypes
View(CO2)
View(mtcars)
View(trees)

# Creating a Data Frame
names <- c("Sherwin", "Issac", "Joyce", "Rudy")
weight <- c("63","84","80","76")
gender <- c("M","M","F","M")

data_frame <- data.frame(names,weight,gender)

# Some Operations on Data Frames
nrow(data_frame)
ncol(data_frame)
dim(data_frame)
summary(data_frame)
head(data_frame)
tail(data_frame)
str(data_frame)

# Accessing data from data frames
data_frame$names
data_frame[2,1]
data_frame[,3] 
data_frame[,-3] # Access whole column except particular column
data_frame[2:3,]
data_frame[["names"]] #Same to data_frame$names

data_frame[,c("names","weight")]
data_frame[,1, drop = FALSE] # newline on FALSE 
data_frame[,1, drop = TRUE]

# Data Subsets Function
subset( data_frame, subset = gender == "M" )

# Ordering Data using order()
weight.ordered <- order(data_frame["weight"])
data_frame[weight.ordered,]

