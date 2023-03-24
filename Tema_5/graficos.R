library(readxl)

dados <- read_excel('Tema_3/dados.xlsx', col_types = c('text', 'numeric', 'text', 'numeric', 'text'), na = 'NA')

View(dados)

# OU

dados <- data.frame(read_xlsx('Tema_3/dados.xlsx'))
View(dados)

# Biblioteca de gráficos: plotly.com
library(plotly)

###
x <- c(1:100)
random_y <- rnorm(100, mean = 0)
data <- data.frame(x, random_y)

fig <- plot_ly(dados, x = ~x, y = ~random_y, type = 'scatter', mode = 'lines')

fig


###
fig <- plot_ly(
  x = dados$Escolaridade,
  y = dados$Idade,
  type = "bar"
)

fig

###
# +percent add percentual
x <- c(11,4,3,1)
y <- c('Ens. Medio','Ens. Superior','Ens. Fundamental','Pos-Graduacao')

labels = y
values = x

fig <- plot_ly(type='pie', labels=labels, values=values, 
               textinfo='label+percent',
               insidetextorientation='radial')
fig

###
fig <- plot_ly(y = ~dados$Idade, type = "box")
fig <- fig %>% add_trace(y = ~dados$N_filhos)

fig

