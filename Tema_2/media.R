## Exemplo

# Bibliotecas
install.packages("datasets")

#--- Dados

library(datasets)

# cars dados de carros, velocidade vs distância para frea em pés
dados <- cars

dados
dados$speed


#--- Media

media <- mean(cars$speed)
media


#--- Moda (el q mais se repete)
# moda é o número que aparece mais vezes em um conjunto de dados.

library(DescTools)

moda_dist <- Mode(cars$dist)
moda_dist

moda_speed <- Mode(cars$speed)
moda_speed

#--- Mediana
# mediana é o valor do meio quando o conjunto de dados está ordenado do menor para o maior.

mediana <- median(cars$dist)


#--- Desvio padrão
# desvio padrão é uma medida que expressa o grau de dispersão de um conjunto de dados. 
# Ou seja, o desvio padrão indica o quanto um conjunto de dados é uniforme. 
# Quanto mais próximo de 0 for o desvio padrão, mais homogêneo são os dados.

desvio_padrao <- sd(cars$dist)
desvio_padrao

#--- Correlação
# Calcula correlação entre variáveis
correlacao <- cor(cars$speed, cars$dist)

# Executa um teste estatístico para validar se a correlação é confiável
correlacao_teste <- cor.test(cars$speed, cars$dist)
correlacao_teste


#--- Amostra
 # pega 10 amostras de velocidade
amostra <- sample(cars$speed, 10, replace = FALSE)

# Pega 10 números entre 1 e 50 para representar as linhas de amostras
linhas_amostra <- sample(1:50, 10, replace = FALSE)

# Captura as linhas inteiras referente amostras de dados usando as linhas sorteadas 
# espaço em branco representa q quer todas as colunas, senão teria de definr quais colunas
amostras <- dados[linhas_amostra, ]



# ls contém todas variáveis q foram criadas.  
lista_variáveis <- ls()
lista_variáveis

#rm remove ítens, limpa todas variáveis
rm(list = ls())


#--- Regressão linear 
# Regressão linear: é uma técnica de análise de dados que prevê o valor de dados
# desconhecidos usando outro valor de dados relacionado e conhecido.
library(datasets)
# var y ~ var x / data banco q será usado
# apartir da velocidade quero prever a distância
linear_model <- lm(dist ~ speed, data = cars)
linear_model
summary(linear_model)
 

#--- Predição
cars
# através da velocidade prever a distância de valores q não constam na tabela
novos_dados <- data.frame("speed" = c(21,24,26))
novos_dados

# predict comando para fazer a predição
# lwr / upr intervalo de confiança 
# lwr / upr nesse modelo são distâncias a menor e maior q o carro deve frear com 95% de certeza
# mas existem outras variáveis
predict(linear_model, newdata = novos_dados, interval = "confidence")

