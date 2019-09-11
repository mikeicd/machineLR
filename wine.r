#http://supreetnayak.com/page/WineAnalysis.html

wine <- read.csv("wine.csv", stringsAsFactors = TRUE)

str(wine)
#summary(wine$Price)

modelAGST <- lm(Price ~ AGST, data = wine)

plot(wine$AGST,wine$Price,main="Avergae Growing Season Temp vs Price", xlab="AGST",ylab="Price", col="blue")
abline(modelAGST,col="red")



wine_model <- lm(Price ~ WinterRain + AGST + HarvestRain + Age + FrancePop + HarvestRain*WinterRain, data = wine)

wine_model
summary(wine_model)

