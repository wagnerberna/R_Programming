library(readxl)

dados <- read_excel('Tema_3/dados.xlsx', col_types = c('text', 'numeric', 'text', 'numeric', 'text'), na = 'NA')

df <- data.frame(read_xlsx('Tema_3/dados.xlsx'))

View(dados)
View(df)
