

##### Bloco 1  ######
rm(list = ls())

# mostra o diretório padrão q os arquivos estão salvos:
getwd()
#seta pastas de trabalho, não precisa colocar o caminho completo na leitura de arq.
setwd("C:/0-BK/0-Vscode/data_science/R_statistic/")

library(datasets)

# Pegar linhas do 1 ao 6 e todas colunas
df <- cars[1:6, ]

#FN para calcular a mediana
# sort ordena o vetor
# n para armazenar a quant. de el. pois o cálculo muda se for par ou ímpar
# par retorna os dois el do meio
# ímpar retorna o el do meio
mediana <- function(vetor){
  vetor <- sort(vetor)
  n     <- length(vetor)
  if(n %% 2 == 0) {
    pos <- n / 2
    return( (vetor[pos] + vetor[pos + 1]) / 2)
  } else {
    pos <- (n + 1) / 3
    return( vetor[pos] )
  }
}

mediana(cars$speed)
mediana(cars$dist)

#cria vetores vazios p/ medianas e nomes colunas
medianas <- c()
nomes    <- c()

# for para calcular em duas colunas
# ncol é o número total de colunas
# o vetor recebe ele mesmo e concatena com a nova inf.
for(i in 1:ncol(cars)){
  nomes    <- c(nomes, colnames(cars)[i])
  medianas <- c(medianas, mediana(cars[ ,i]))
}


cars_medianas <- data.frame('Variaveis' = nomes, 'Medianas' = medianas)



##### Bloco 2  ######

# Leitura de uma planilha salva no computador


# dec informa q os decimais são separados por ","
df <- read.csv('Tema_3/dados.csv', sep = ';', dec = ',')


# Leitura via requisição API
library(jsonlite)
df <- fromJSON("http://educacao.dadosabertosbr.com/api/escolas/buscaavancada?situacaoFuncionamento=1&energiaInexistente=on&aguaInexistente=on&esgotoInexistente=on&cozinha=on")
df


### Bloco 3 ####


library(readxl)

df <- data.frame(read_xlsx('Tema_3/dados.xlsx'))
df
str(df)
is(df)
