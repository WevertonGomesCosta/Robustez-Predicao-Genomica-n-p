# Robustez da Predição Genômica em Diferentes Dimensões de n e p

Este repositório apresenta um tutorial reprodutível para avaliar a robustez de
métodos estatísticos e de aprendizado de máquina aplicados à predição genômica
quando o número de indivíduos (`n`) e o número de marcadores (`p`) são reduzidos.

## Objetivo

Avaliar como diferentes dimensões amostrais e genômicas afetam o desempenho
preditivo dos métodos e identificar quais abordagens apresentam maior
estabilidade diante da redução da informação disponível.

O desenvolvimento será realizado em etapas. Inicialmente será estudada a redução
do número de marcadores (`p`) mantendo a população completa disponível. Em uma
etapa posterior será incorporada também a redução do número de indivíduos (`n`),
permitindo avaliar o problema completo `n x p`.

## Dados

As análises utilizam dados simulados previamente gerados no software GENES para
uma população F2 com 1.000 indivíduos e 4.010 marcadores distribuídos em 10
grupos de ligação.

São consideradas seis características simuladas, representando diferentes
arquiteturas genéticas quanto ao número de QTL e à herdabilidade.

Os arquivos originais são mantidos em `data/dados_simulados/`.

## Dimensões avaliadas

### Etapa inicial: redução de p

Na etapa inicial, os 1.000 indivíduos serão mantidos e a redução do número de
marcadores será avaliada a partir de rankings de importância obtidos
separadamente para cada método, cenário e fold de validação.

O conjunto completo de 4.010 marcadores será utilizado como referência. A partir
do ranking obtido exclusivamente no conjunto de treinamento, serão considerados:

- `100% = 4010` marcadores;
- `50% = 2005` marcadores;
- `25% = 1003` marcadores;
- `10% = 401` marcadores;
- `5% = 201` marcadores;
- `1% = 40` marcadores.

Os painéis reduzidos serão aninhados dentro do ranking correspondente. Nenhum
fenótipo do conjunto de teste e nenhum valor genético verdadeiro será utilizado
para calcular importância ou selecionar marcadores.

Os rankings serão específicos de cada método, cenário e fold. Portanto,
diferentes métodos poderão selecionar conjuntos distintos de marcadores para a
mesma proporção de redução.

Para os métodos de aprendizado de máquina, as importâncias serão extraídas
segundo um protocolo comum e posteriormente padronizadas para a escala de 0 a
10 dentro de cada combinação de cenário, método e fold.

Todos os marcadores do painel corrente permanecerão disponíveis como candidatos
ao método. Quando um algoritmo possuir um parâmetro que limite explicitamente o
número de termos ou variáveis consideradas, esse limite não será fixado
artificialmente em um valor pequeno independente de `p`.

### Etapa posterior: redução de n e p

Após a análise inicial da redução de `p`, serão introduzidos diferentes tamanhos
de `n`, permitindo avaliar separadamente e em conjunto os efeitos da redução do
número de indivíduos e do número de marcadores.

## Métodos

O **GBLUP aditivo (GBLUP-A)**, ajustado com o pacote `sommer`, será utilizado
como modelo estatístico de referência.

Os métodos de aprendizado de máquina avaliados serão:

- MARS;
- árvore de regressão;
- Bagging;
- Random Forest;
- Boosting.

Redes neurais artificiais não fazem parte desta etapa do projeto.

## Fluxo da análise

O tutorial está organizado em quatro módulos:

1. Dados simulados e desenho da análise;
2. GBLUP;
3. Aprendizado de máquina;
4. Comparação dos métodos e avaliação da robustez.

## Reprodutibilidade

O projeto é desenvolvido com `workflowr`. Os documentos-fonte das análises são
mantidos em `analysis/` e o site reproduzível é gerado em `docs/`.

Objetos derivados e resultados científicos serão armazenados em `output/`.
Artefatos temporários de execução permanecerão fora do fluxo versionado em
`.local/`.
