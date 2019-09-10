#Criando vetores para os 3 pacientes
nome <- c("Mike", "Rhenzo", "Vinicius")
temperatura <- c(42.9, 37, 35)
status <- c(TRUE, FALSE, FALSE)

#Pegando temperatura do 2 elemento
temperatura[2]

#criando fatores
gender <- factor(c("MALE,", "FEMALE", "MALE"))
gender

#add sangue
blood <- factor(c("AZUL", "AB", "A"))
  levels = c("AZUL", "A", "B", "AB", "O")
  
blood

#Ordenando fatores
sintoma <- factor(c("SEVERO", "POUCO", "MODERADO"), levels = c("POUCO", "MODERADO", "SEVERO"), ordered = TRUE)

sintoma

pt_data <- data.frame(nome, temperatura, status, gender, blood, sintoma, stringsAsFactors = FALSE)
pt_data

pt_data[2:3]

pt_data[1, 2]

pt_data[, 1]
