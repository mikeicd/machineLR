#import the csv file
insurance <- read.csv("insurance.csv", stringsAsFactors = TRUE)

str(insurance)

####TRATANDO OS DADOS E VERIFICANDO O R-SQUARE
insurance$age <- insurance$age^2
insurance$bmi30 <- ifelse(insurance$bmi >= 30, 1, 0)

####/

#summary(insurance$expenses)

#hist(insurance$expenses)

#table(insurance$region)
#table(insurance$sex)
#table(insurance$smoker)

cor(insurance[c("age","bmi","children","expenses")])
####MODELS
#ins_model <- lm(expenses ~ age + children + bmi + sex + smoker + region, data = insurance)
ins_model2 <- lm(expenses ~ age + children + bmi + smoker, data = insurance)
ins_model3 <- lm(expenses ~ age + children + bmi*smoker + bmi + smoker, data = insurance)
####

####CALL MODELS
#ins_model
#summary(ins_model)

ins_model2
summary(ins_model2)

ins_model3
summary(ins_model3)
####/MODELS


