
#install.packages('dplyr')

library(dplyr)

# Loading a Diamonds Dataset
db <- read.csv("C:\\Users\\sherw\\OneDrive\\Documents\\R\\SkyfiLabs Codes\\diamonds.csv")

View(db)
head(db)
summary(db)

# Filter Function
head( filter(db, carat > 0.2, cut == "Premium") )
head( filter(db, carat > 0.2, color == "E", price > 500) )

# Slice Function
slicer <- slice(db, 20:45)

# Arrange on priority
head( arrange(db, carat, depth, table) )
?arrange() # to get function description of arrange()

# Renaming
rm <- rename( db, Purity = clarity )

# Create & Add a new column
mut <- mutate(db, Volumn_of_Diamond = x*y*z )

# To view only mutated data
head(transmute(db,Volumn_of_Diamond = x*y*z))

# Mean/Sum of a column
summarise(mut, volumn_avg = mean(Volumn_of_Diamond))

# Get distinct elements of a column
distinct(select(db, cut))
distinct(select(db, color))

# Getting Samples form Dataset
sample_n(db,10)
sample_frac(db,0.1)

# Add data to existing Table
newdt <- tail(add_row(db, X = 53941, carat = 0.25, cut = "Premium", color = "F", clarity = "VS2", depth = 63.2, table = 62.4, price = 3757, x = 5.2, y = 5.72, z = 3.85))
View(newdt)




