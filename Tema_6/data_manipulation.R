
library(dplyr)
library(readxl)

df    <- read_excel('D:/dados.xlsx', col_types = c('text', 'numeric', 'text', 'numeric', 'text'), na = 'NA')
df    <- data.frame(df)

amostra1 <- sort(sample(1:20, 11, FALSE))
amostra2 <- sort(sample(1:5, 3, FALSE))

df1   <- df[amostra1, ]
df2   <- df[-amostra1, ]

df3   <- df[ , amostra2]
df4   <- df[ , -amostra2]

df1
df2
df3
df4

View(df)




# cbind

dados <- cbind(df3,df4)


# rbind

dados2 <- rbind(df1,df2)

# filter

dados3 <- filter(df, ((Idade > 30 & Sexo == "M") | (Idade < 30 & Sexo == "F")) & N_filhos > 0)


# select

dados4 <- select(df, c(1,2,5))

# unique

unique(df$N_filhos )

# distinct


dados5 <- distinct(df, Escolaridade, .keep_all = TRUE)

# summary

summary(df)






# apply

apply(df, 1,function(x) sum(is.na(x)))







dados6 <- filter(df, Sexo == "M")

mean(dados6$Idade)




# group_by e count


data.frame(group_by(df, Escolaridade) %>% count(Escolaridade))























