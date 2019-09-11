#import the csv file
wbcd <- read.csv("wisc_bc_data.csv", stringsAsFactors = FALSE)

#examinando estrutura da base de dados
str(wbcd)

#Removendo coluna da identificação do paciente
wbcd <- wbcd [-1]

#tabela de diagnostico
table(wbcd$diagnosis)

#Rotular dos diagnósticos, e recriar como fator
wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benigno", "Maligno"))

#criando uma proporção
round(prop.table(table(wbcd$diagnosis))* 100, digits = 1)

#criando sumario
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

#criando uma função de normalização
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}

#normalizando wbcd data
  
wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))

#testando função normalize
summary(wbcd_n$area_mean)

#criando training data
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

#loading the class library
library(class)

wbcd_test_pred <- knn(train = wbcd_train, test = wbcd_test, cl= wbcd_train_labels, k=21)

#load the gmodels library 
library(gmodels)

#criando o cruzamento das tabelas com as predições e a realidade
CrossTable(x = wbcd_test_labels, y = wbcd_test_pred, prop.chisq = FALSE)

