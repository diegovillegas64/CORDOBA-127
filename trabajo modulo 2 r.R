##Ejercicios Modulo 2

install.packages("readr")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("reshape")

library(readr)
library(tidyverse)
library(dplyr)
require(reshape)

###importamos la base de datos
file.choose()

##importar datos

base <- base_1
  
  
  
  ##Imprimimos las 10 primeras filas
  str(base_1)
  head(base_1, 10)

  
##Punto 2(Datos faltantes)
  
  install.packages("naniar")
  
##Instalamos la libreria
  
  library(naniar)
  
  n_miss(base_1)
  miss_var_summary(base_1)
  miss_case_sumary(base_1)
  vis_miss(base_1, cluster = TRUE)
  
##Punto 3(Manipulacion de datos )
 
base %>% mutate(cambio_porcentual = ((as.numeric(`Average price of 1GB (USD  at the start of 2021)`) - as.numeric(`Average price of 1GB (USD â€“ at start of 2020)`))/as.numeric(`Average price of 1GB (USD â€“ at start of 2020)`))*100) %>%
  arrange(desc(cambio_porcentual)) %>%
  head(10)


##5. GrÃ¡fico 
Internet <- base %>%
  mutate(porcentaje = (`Internet users` / `Population`) * 100)

ggplot(Internet,aes(x = `Avg \n(Mbit/s)Ookla`,
                             y = porcentaje ))+ geom_point() 
## si existe correlación ya que vemos cómo el aumento de una se incrementa también en la otra,
## demostrando una correlación creciente entre las dos


##4. base <- base %>%
  mutate(Avg_Mbits_Ookla= replace_na(`Avg 
(Mbit/s)Ookla`, 0)) %>%
  mutate(Average_price_2021 = replace_na(as.numeric(`Average price of 1GB (USD  at the start of 2021)`), 0))%>%
  mutate(Average_price_2020 = replace_na(as.numeric(`Average price of 1GB (USD â€“ at start of 2020)`), 0))

Velocidad_region <- base %>%
  group_by(`Continental region`) %>%
  summarise(peso_promedio = mean(Avg_Mbits_Ookla)) %>%
  arrange(desc(peso_promedio))





















