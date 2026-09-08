# Robustez da Predição Genômica em Diferentes Dimensões de n e p

Este repositório apresenta um tutorial reprodutível para avaliar a robustez de
métodos estatísticos e de aprendizado de máquina aplicados à predição genômica
quando o número de indivíduos (`n`) e o número de marcadores (`p`) são reduzidos.

## Objetivo

Avaliar como diferentes dimensões amostrais e genômicas afetam o desempenho
preditivo dos métodos e identificar quais abordagens apresentam maior
estabilidade diante da redução da informação disponível.

## Dados

As análises utilizam dados simulados previamente gerados no software GENES para
uma população F2 com 1.000 indivíduos e 4.010 marcadores distribuídos em 10
grupos de ligação.

São consideradas seis características simuladas, representando diferentes
arquiteturas genéticas quanto ao número de QTL e à herdabilidade.

Os arquivos originais são mantidos em `data/dados_simulados/`.

## Dimensões avaliadas

O número de indivíduos será avaliado em:

- `n = 250`
- `n = 500`
- `n = 1000`

O número de marcadores será avaliado em:

- `p = 1010`
- `p = 2010`
- `p = 4010`

Os subconjuntos serão construídos de forma aninhada e serão compartilhados
entre todos os métodos.

## Métodos

O GBLUP-ADE será utilizado como modelo estatístico de referência.

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
2. GBLUP-ADE;
3. Aprendizado de máquina;
4. Comparação dos métodos e avaliação da robustez.

## Reprodutibilidade

O projeto é desenvolvido com `workflowr`. Os documentos-fonte das análises são
mantidos em `analysis/` e o site reproduzível é gerado em `docs/`.

Objetos derivados e resultados científicos serão armazenados em `output/`.
Artefatos temporários de execução permanecerão fora do fluxo versionado em
`.local/`.
