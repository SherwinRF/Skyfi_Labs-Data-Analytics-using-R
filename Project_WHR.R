# Project: Data Manipulation & Visualization on World Happiness Data (WHD)

#-----------------------
# DATA MANIPULATION PART
#-----------------------

# Import 'dplyr' package and the dataset .csv file.
library(dplyr)
db <- read_csv("R/SkyfiLabs Codes/world-happiness-data.csv")

# Removing 'Standard Error' Column
db <- db[,-5]
# Knowing distinct regions = 10
distinct(db, Region)

# Create a new column for Classification: continent
db$continent <- NA

# Adding data based on Regions:
# Australia
db$continent[which(db$Region %in% c("Australia and New Zealand"))] <- "Australia"
# North America
db$continent[which(db$Region %in% c("North America"))] <- "North America"
# Latin America
db$continent[which(db$Region %in% c("Latin America and Caribbean"))] <- "South America"
# Europe
db$continent[which(db$Region %in% c("Western Europe","Central and Eastern Europe"))] <- "Europe"
# Africa
db$continent[which(db$Region %in% c("Middle East and Northern Africa", "Sub-Saharan Africa"))] <- "Africa"
# Asia
db$continent[which(db$Region %in% c("Southeastern Asia", "Eastern Asia", "Southern Asia"))] <- "Asia"

# Average of all numerical data w.r.t Continent
hp <- aggregate(db[,4:11], list(db$continent), mean)
View(hp)

#------------------------
# DATA VISUALIZATION PART
#------------------------

# Importing ggplot2, corrplot & corrgram packages
library(ggplot2)
library(corrplot)
library(corrgram)

summary(db) # viewing the data summary
View(head(db,10)) # Top 10
View(tail(db,10)) # Bottom 10

# Bargraph on continent vs happiness score with stat = "identity"
ggplot(hp, aes(x = Group.1, y = Happiness.Score, fill = Group.1)) + geom_bar(stat = "identity") + ggtitle("Happiness Score of each Continent") + ylab("Happiness") + xlab("Continentts")

# Finding Correlations in Variables
col <- sapply(db, is.numeric)
cor_data <- cor(db[,col])
# correlation plot on the dataset 
corrplot(cor_data, method = "square", type = "upper")
corrplot(cor_data, method = "number", type = "upper")

# Creating a box plot: Region vs Happiness.Score
box <- ggplot(db, aes(x = Region, y = Happiness.Score, color = Region))
box + geom_boxplot() + geom_jitter(aes(color = Country), size = 1.0) + ggtitle("Hapiness Score for Region & Country") + coord_flip() + theme(legend.position = "none")

box + geom_boxplot() + geom_jitter(aes(color = Region), size = 1.0) + ggtitle("Hapiness Score for Region") + coord_flip() + theme(legend.position = "none")
# from this graph, we conclude that western europe, north america & australia/new-zealand are happiest regions; opposite for sub-saharan africa

ggplot(db, aes(x = continent, y = Happiness.Score, color = continent)) + geom_boxplot() + ggtitle("Hapiness Score for Continents")

# Regression for all continents
# for Health/Life Expactancy
ggplot(db, aes(x = Health.Life.Expectancy, y = Happiness.Score)) + geom_point(aes(color = continent), size = 3, alpha = 0.8) + geom_smooth(aes(color = continent, fill = continent), method = "lm", fullrange = T) + facet_wrap(~continent) + theme_bw() + ggtitle("Scatter plot for life expantancy") 
# for Ecomony
ggplot(db, aes(x = Economy.GDP.per.Capita, y = Happiness.Score)) + geom_point(aes(color = continent), size = 3, alpha = 0.8) + geom_smooth(aes(color = continent, fill = continent), method = "lm", fullrange = T) + facet_wrap(~continent) + theme_bw() + ggtitle("Scatter plot for Economy") 
# for Freedom
ggplot(db, aes(x = Freedom, y = Happiness.Score)) + geom_point(aes(color = continent), size = 3, alpha = 0.8) + geom_smooth(aes(color = continent, fill = continent), method = "lm", fullrange = T) + facet_wrap(~continent) + theme_bw() + ggtitle("Scatter plot for Freedom") 
# for Family
ggplot(db, aes(x = Family, y = Happiness.Score)) + geom_point(aes(color = continent), size = 3, alpha = 0.8) + geom_smooth(aes(color = continent, fill = continent), method = "lm", fullrange = T) + facet_wrap(~continent) + theme_bw() + ggtitle("Scatter plot for Family") 
# for Trust in Government
ggplot(db, aes(x = Trust.Government.Corruption, y = Happiness.Score)) + geom_point(aes(color = continent), size = 3, alpha = 0.8) + geom_smooth(aes(color = continent, fill = continent), method = "lm", fullrange = T) + facet_wrap(~continent) + theme_bw() + ggtitle("Scatter plot for Govt. Trust") 


# Classifying data based on happy, neutal and unhappy regions (from above graph)
# New column: happinessmeter
db$happinessmeter <- NA
db$happinessmeter[which(db$Region %in% c("Western Europe","North America","Australia and New Zealand"))] <- "Happiest"
db$happinessmeter[which(db$Region %in% c("Sub-Saharan Africa"))] <- "Least Happiest"
db$happinessmeter[which(db$Region %in% c("Southern Asia","Southeastern Asia","Middle East and Northern Africa","Latin America and Caribbean","Eastern Asia","Central and Eastern Europe"))] <- "Neutral"

# Regression for all 3 Regions
ggplot(db, aes(x = Health.Life.Expectancy, y = Happiness.Score)) + geom_point(aes(color = happinessmeter), size = 3, alpha = 0.8) + geom_smooth(aes(color = happinessmeter, fill = happinessmeter), method = "lm", fullrange = T) + facet_wrap(~happinessmeter) + theme_bw()
# for economy
ggplot(db, aes(x = Economy.GDP.per.Capita, y = Happiness.Score)) + geom_point(aes(color = happinessmeter), size = 3, alpha = 0.8) + geom_smooth(aes(color = happinessmeter, fill = happinessmeter), method = "lm", fullrange = T) + facet_wrap(~happinessmeter) + theme_bw()
# for freedom
ggplot(db, aes(x = Freedom, y = Happiness.Score)) + geom_point(aes(color = happinessmeter), size = 3, alpha = 0.8) + geom_smooth(aes(color = happinessmeter, fill = happinessmeter), method = "lm", fullrange = T) + facet_wrap(~happinessmeter) + theme_bw()
# for Generosity
ggplot(db, aes(x = Generosity, y = Happiness.Score)) + geom_point(aes(color = happinessmeter), size = 3, alpha = 0.8) + geom_smooth(aes(color = happinessmeter, fill = happinessmeter), method = "lm", fullrange = T) + facet_wrap(~happinessmeter) + theme_bw()


# Plot GDP & Expectancy on World Map
# Importing 'rworldmap' package
library(rworldmap)

# In the world map: dark green regions denote happy regions, yellow denote neutral regions, skin color denotes unhappy regions and white denotes country not in dataset

# Craeting Data Frame: Country vs health expectancy
d <- data.frame(country = db$Country, value = db$Health.Life.Expectancy)
n <- joinCountryData2Map(d, joinCode = "NAME", nameJoinColumn = "country")
mapCountryData(n, nameColumnToPlot = "value", mapTitle = "World Map for GDP 2015", colourPalette = "terrain")

# for health expectancy
d <- data.frame(country = db$Country, value = db$Health.Life.Expectancy)
n <- joinCountryData2Map(d, joinCode = "NAME", nameJoinColumn = "country")
mapCountryData(n, nameColumnToPlot = "value", mapTitle = "World Map for Health Life Expectancy 2015", colourPalette = "terrain")

