# Dados

Este diretório contém exclusivamente os dados de entrada utilizados nas
análises. Objetos derivados, predições, métricas e demais resultados devem ser
armazenados em `output/`.

## Dados simulados

Os dados simulados estão em:

`data/dados_simulados/`

O conjunto foi gerado previamente no software GENES e contém oito arquivos:

- `controlegenetico#1.dat`
- `DG#gen_F2_Vfen.txt`
- `DG#gen_F2_Vgen.dat`
- `genoma.txt`
- `genoma_mapa.txt`
- `genoma_mapa_tr.txt`
- `genoma_pais.txt`
- `map.rds`

Esses arquivos fornecem as informações necessárias sobre fenótipos simulados,
valores genéticos verdadeiros, genótipos, mapa genético, parentais e parâmetros
da simulação.

A identidade desses oito arquivos com o conjunto previamente utilizado foi
verificada antes do início das análises por comparação dos blobs Git após a
normalização dos finais de linha dos arquivos textuais.

Os arquivos originais não devem ser modificados durante o fluxo analítico.
