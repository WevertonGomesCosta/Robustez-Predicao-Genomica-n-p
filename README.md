# Robustez da Predição Genômica em Diferentes Dimensões de n e p

Este repositório apresenta um tutorial reprodutível para estudar a robustez de
métodos estatísticos e de aprendizado de máquina aplicados à predição genômica
quando a quantidade de informação disponível é reduzida.

A primeira fase do projeto, dedicada à **redução do número de marcadores (`p`)**
com o número de indivíduos fixado em `n = 1000`, está concluída. Os resultados
científicos dessa fase foram auditados e preservados nos contratos
`M01-p-v1`, `M02-p-v1`, `M03-p-v1` e `M04-p-v1`.

A redução do número de indivíduos (`n`) e a avaliação conjunta de `n × p`
constituem etapas posteriores e ainda não fazem parte dos resultados científicos
apresentados nesta versão do repositório.

## Objetivo

Avaliar como a redução da densidade de marcadores afeta a capacidade preditiva
de diferentes métodos de predição genômica e distinguir duas dimensões
complementares:

- **capacidade preditiva:** desempenho absoluto obtido em cada densidade de
  marcadores;
- **robustez à redução de `p`:** mudança do desempenho em relação ao painel
  completo de marcadores.

A extensão futura do projeto incorporará diferentes tamanhos de amostra para
avaliar também os efeitos da redução de `n` e da combinação `n × p`.

## Dados simulados

As análises utilizam dados previamente simulados no software GENES para uma
população F2 com:

- 1.000 indivíduos;
- 4.010 SNPs;
- 10 grupos de ligação;
- seis cenários genéticos.

Os arquivos originais estão disponíveis em
[`data/dados_simulados/`](data/dados_simulados/).

Os cenários diferem quanto ao número de QTL e à herdabilidade:

| Cenário | Número de QTL | Herdabilidade |
|:-------:|--------------:|--------------:|
| C1 | 8 | 0,7 |
| C2 | 40 | 0,7 |
| C3 | 80 | 0,5 |
| C4 | 120 | 0,5 |
| C5 | 240 | 0,3 |
| C6 | 480 | 0,3 |

Como número de QTL e herdabilidade não variam de forma independente entre todos
os cenários, as comparações entre arquiteturas genéticas são interpretadas de
forma descritiva.

## Desenho da Fase 1

Nesta fase, `n = 1000` permanece fixo e somente o número de marcadores é
reduzido.

Todos os métodos utilizam os mesmos cinco folds de validação cruzada:

- 800 indivíduos para treinamento;
- 200 indivíduos para teste.

Os níveis de `p` são:

| Marcadores mantidos | Número de SNPs |
|--------------------:|---------------:|
| 100% | 4.010 |
| 50% | 2.005 |
| 25% | 1.003 |
| 10% | 401 |
| 5% | 201 |
| 1% | 40 |

Os painéis reduzidos são aninhados dentro do ranking correspondente a cada
combinação de cenário, método e fold.

Os fenótipos dos indivíduos de teste não participam do ajuste dos modelos.
O valor genético verdadeiro é utilizado somente para avaliação.

Nos métodos de aprendizado de máquina, o ranking de importância é construído
exclusivamente com os indivíduos de treinamento. No GBLUP, os indivíduos de
treinamento e teste são considerados previamente genotipados e a matriz genômica
é construída de forma transdutiva em relação aos genótipos, mantendo os
fenótipos do conjunto de teste ocultos.

## Métodos

São comparados seis métodos:

| Método | Implementação principal |
|:-------|:-------------------------|
| GBLUP aditivo | `sommer` |
| MARS | `earth` |
| Árvore de regressão | `rpart` |
| Bagging | `randomForest` |
| Random Forest | `randomForest` |
| Boosting | `gbm` |

O GBLUP é utilizado como modelo estatístico de referência. Os outros cinco
métodos compõem o módulo de aprendizado de máquina.

Os rankings de marcadores são específicos para cada método, cenário e fold.
Assim, métodos diferentes podem selecionar conjuntos diferentes de SNPs para a
mesma proporção de redução.

## Métricas de avaliação

A métrica principal é a correlação de Pearson entre o valor genético verdadeiro
e o valor genético predito.

As métricas secundárias incluem:

- RMSE;
- MAE;
- viés médio;
- inclinação de calibração;
- R² preditivo.

A perda de correlação em relação ao painel completo é definida por:

```text
delta_r = r_100 - r_q
```

Portanto:

```text
delta_r > 0   perda de correlação
delta_r = 0   manutenção do desempenho
delta_r < 0   desempenho superior ao painel completo
```

Para o RMSE:

```text
delta_RMSE = RMSE_q - RMSE_100
```

Valores positivos indicam aumento do erro em relação ao painel completo.

A análise também separa **robustez preditiva global**, baseada no desempenho
absoluto nos painéis reduzidos, de **estabilidade relativa**, baseada na perda
em relação ao próprio baseline do método. Essas duas medidas não são
intercambiáveis e não são combinadas em um escore arbitrário.

## Tutorial

O tutorial está organizado em quatro módulos concluídos:

| Módulo | Conteúdo | Contrato | Fonte | Página gerada |
|:------:|:---------|:--------:|:------|:--------------|
| 1 | Dados simulados e desenho experimental | `M01-p-v1` | [`01_dados_desenho.Rmd`](analysis/01_dados_desenho.Rmd) | [`01_dados_desenho.html`](docs/01_dados_desenho.html) |
| 2 | GBLUP e redução de marcadores | `M02-p-v1` | [`02_gblup.Rmd`](analysis/02_gblup.Rmd) | [`02_gblup.html`](docs/02_gblup.html) |
| 3 | Aprendizado de máquina e redução de marcadores | `M03-p-v1` | [`03_aprendizado_maquina.Rmd`](analysis/03_aprendizado_maquina.Rmd) | [`03_aprendizado_maquina.html`](docs/03_aprendizado_maquina.html) |
| 4 | Comparação dos métodos e robustez | `M04-p-v1` | [`04_comparacao_robustez.Rmd`](analysis/04_comparacao_robustez.Rmd) | [`04_comparacao_robustez.html`](docs/04_comparacao_robustez.html) |

Os módulos foram estruturados para apresentar primeiro o desenho experimental,
depois os métodos individualmente e, por fim, a comparação integrada.

## Objetos científicos oficiais

Os principais objetos versionados utilizados pelo tutorial são:

| Módulo | Objeto |
|:------:|:-------|
| M01 | [`output/dados_desenho/desenho_analise.rds`](output/dados_desenho/desenho_analise.rds) |
| M02 | [`output/gblup/module02_gblup_results.rds`](output/gblup/module02_gblup_results.rds) |
| M03 | [`output/aprendizado_maquina/module03_ml_results.rds`](output/aprendizado_maquina/module03_ml_results.rds) |
| M04 | [`output/comparacao_robustez/module04_comparacao_p_results.rds`](output/comparacao_robustez/module04_comparacao_p_results.rds) |

O M04 integra exatamente:

```text
180 resultados do GBLUP
+
900 resultados dos cinco métodos de aprendizado de máquina
=
1.080 resultados
```

Os resultados do M04 são derivados diretamente dos objetos oficiais de M02 e
M03. A construção do tutorial não depende de checkpoints intermediários
armazenados em `.local/`.

## Reprodutibilidade

O projeto utiliza [`workflowr`](https://github.com/workflowr/workflowr) para
organização e construção do site e [`renv`](https://rstudio.github.io/renv/)
para registrar o ambiente computacional.

Após clonar o repositório, o ambiente pode ser restaurado com:

```r
renv::restore()
```

As páginas do tutorial podem ser reconstruídas com:

```r
workflowr::wflow_build()
```

Os documentos-fonte estão em [`analysis/`](analysis/) e as páginas geradas em
[`docs/`](docs/).

Os objetos científicos necessários para reconstruir as páginas estão
versionados em [`output/`](output/). Ajustes computacionalmente pesados são
documentados nos módulos, mas não são executados automaticamente durante o
build do site.

O diretório `.local/` é reservado para arquivos temporários, checkpoints
intermediários e auditorias locais. Ele não é necessário para a execução das
páginas públicas do tutorial.

## Estado atual do projeto

A Fase 1, com redução de `p` e `n = 1000`, está concluída e auditada.

Os quatro contratos científicos atualmente congelados são:

```text
M01-p-v1  Dados e desenho experimental
M02-p-v1  GBLUP
M03-p-v1  Aprendizado de máquina
M04-p-v1  Comparação e robustez à redução de p
```

A próxima fase científica incorporará a redução do número de indivíduos e,
posteriormente, a avaliação conjunta das dimensões `n × p`.
