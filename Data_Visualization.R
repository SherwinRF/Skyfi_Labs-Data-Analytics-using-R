#install.packages("ggplot2")

library(dplyr)
library(ggplot2)

# Importing 10% fraction of diamond dataset for plotting
db <- read.csv("C:\\Users\\sherw\\OneDrive\\Documents\\R\\SkyfiLabs Codes\\diamonds.csv")
db <- sample_frac(db,0.1)

#-----------------------
# CONTINOUS ONE VARIABLE
#-----------------------

# Plot on price Parameter
plot <- ggplot(db, aes(x = price))

plot + geom_histogram(binwidth = 600, fill = "Purple")

# Determine Price based on cut & clarity
plot + geom_histogram(binwidth = 600, aes(fill = cut))
plot + geom_histogram(binwidth = 600, aes(fill = clarity))

# Add border to graph
plot + geom_histogram(binwidth = 600, aes(fill = cut), color = "Black")

# Frequency Graph
plot + geom_freqpoly(binwidth = 600)
plot + geom_freqpoly(binwidth = 600, aes(color = cut))

# Area Graph
plot + geom_area(stat = "bin")
plot + geom_area(stat = "bin", aes(color = cut))
plot + geom_area(stat = "bin", aes(fill = cut))

# Density Grapg
plot + geom_density(aes(color = cut))
plot + geom_density(aes(fill = cut)) # Overlaping plot
plot + geom_density(aes(fill = cut), alpha = .3) # Alpha => plot strenght
plot + geom_density(aes(fill = cut), alpha = .3, size = 1)

#----------------------
# DISCRETE ONE VARIABLE
#----------------------

plot2 <- ggplot(db, aes(x = clarity))

# Bar Graph
plot2 + geom_bar()
plot2 + geom_bar(aes(fill = cut))
plot2 + geom_bar(aes(fill = cut), color = "black") # border
plot2 + geom_bar(aes(fill = cut), color = "black", position = "fill") # Color w.r.t percentage fraction 0 to 1.0
plot2 + geom_bar(aes(fill = cut), color = "black", position = position_fill(reverse = TRUE)) 
# Other positions
plot2 + geom_bar(aes(fill = cut), color = "black", position = "dodge") 
plot2 + geom_bar(aes(fill = cut), color = "black", position = "stack") 
plot2 + geom_bar(aes(color = color), fill = NA, position = "identity") 

plot2.1 <- ggplot(db, aes(x = cut))
plot2.1 + geom_bar()

# Fill graph with clarity
plot2.1 <- ggplot(db, aes(cut, fill = clarity))
plot2.1 + geom_bar()
plot2.1 + geom_bar(position = "fill")
plot2.1 + geom_bar(position = "dodge")
plot2.1 + geom_bar(position = "stack")

plot2.1 + geom_bar() + coord_flip() # Flip the coordinates
plot2.1 + geom_bar() + coord_polar() # Polar coordinates

# Labelling (Graph Title)
plot2.1 + geom_bar(position = "stack") + ggtitle("Cut Classification based on clarity")

# Labelling X & Y Labels
plot2.1 + geom_bar(position = "stack") + ggtitle("Cut Classification") + xlab("Cut") + ylab("Count")
plot2.1 + geom_bar(position = "stack") + labs(title = "Classifcation", x = "Cut", y = "COunt")

# Facet Graphs
plot2.1 + geom_bar(position = "dodge") + facet_grid(.~cut) 
plot2.1 + geom_bar(position = "stack") + facet_wrap(~cut)

#------------------------------
# CONTINOUS 2 VARIABLES (X & Y)
#------------------------------

View(mtcars)
plot3 <- ggplot(mtcars, aes(wt, mpg, label = rownames(mtcars)))

# Text Graph
plot3 + geom_text()
plot3 + geom_label() # Labeling Text graph
plot3 + geom_label(aes(color = cyl))
factor(mtcars$cyl) # General readings
plot3 + geom_label(aes(color = factor(cyl)))

# Point Graphs
plot3 + geom_point(aes(color = factor(cyl)))
plot3 + geom_point(aes(size = factor(cyl), alpha = .5)) # alpha => avoid overlaping
plot3 + geom_point(aes(shape = factor(cyl), size = 3))

# Simple Regression
plot3 + geom_smooth() + geom_point()
plot3 + geom_smooth(method = "lm") + geom_point() # linear regression model

# Quantile Graph
plot3 + geom_quantile() + geom_point() # 25%, 50%, 75% => 3 lines

#---------------
# Advance Graphs
#---------------

View(mpg)
plot4 <- ggplot(mpg, aes(x = factor(cyl), y = displ, fill = factor(cyl)))

# Box Plot
plot4 + geom_boxplot()
# 25% -> lowerline, 50% -> middleline, 75% -> upperline (all quantiles)
# horizontal lines (whiskers): lowerline -> min. vlaue of box, upperline -> max. value of box
# Any dots in the graph are OUTLIERS

# Violin Plots
plot4 + geom_violin() # Box + Density plot combination
# curves in the middle of the shapes are medians

# Correlation Plots
corrplot(cor(mtcars)) # cor => correlation matrix creator
# red dots => negative correlation, blue dots => positive correlation
corrplot(cor(mtcars), method = "square")
corrplot(cor(mtcars), method = "number")
corrplot(cor(mtcars), method = "number", type = "upper")

# Corrgram 
corrgram(cor(mtcars))
# Dark Red => negative correlation, Dark Blue => positive correlation


