# Dependências explícitas não detectadas automaticamente pelo renv.
# caret é utilizado no cálculo das importâncias dos métodos de ML.
library(caret)

# Dependência científica do GBLUP.
# Os ajustes pesados do tutorial permanecem em chunks com eval = FALSE,
# por isso sommer precisa ser declarado explicitamente para o renv.
library(sommer)

# Dependências visuais do tutorial.
# ggthemes fornece o tema e as escalas GDocs usadas nas figuras.
library(ggthemes)

# kableExtra padroniza a apresentação das tabelas no site.
library(kableExtra)
