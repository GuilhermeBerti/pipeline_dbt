<<<<<<< HEAD
# Projeto dbt: producao de alimentos com SQLite

Projeto simples de engenharia de dados usando:

- `producao_alimentos.csv` como arquivo de origem.
- `job.py` como ETL para carregar o CSV no banco SQLite `dsadb.db`.
- dbt Core com o adapter `dbt-sqlite` para transformar, testar e documentar os dados.

## O que e o dbt Core

dbt Core e uma ferramenta open source para fazer transformacoes SQL diretamente
no banco analitico. Ele virou um padrao moderno de ELT porque deixa a camada de
transformacao modular, versionada, testavel e documentada.

Neste projeto, o fluxo e:

1. O Python faz a extracao e carga: `producao_alimentos.csv` -> `dsadb.db`.
2. O dbt faz as transformacoes SQL em cima da tabela `main.producao`.
3. Os testes do dbt validam qualidade dos dados.
4. O `dbt docs` gera documentacao interativa do pipeline.

## Instalacao e criacao do projeto

Instale o dbt Core com adapter SQLite:

```powershell
python -m pip install dbt-sqlite
```

O projeto foi criado via terminal com:

```powershell
dbt init alimento_dbt --skip-profile-setup
```

## Configuracao SQLite com profiles.yml

O arquivo `profiles.yml` aponta para o banco SQLite criado pelo `job.py`:

```yaml
alimento_dbt:
  target: dev
  outputs:
    dev:
      type: sqlite
      threads: 1
      database: dsadb
      schema: main
      schemas_and_paths:
        main: ../dsadb.db
      schema_directory: ..
```

Valide a conexao:

```powershell
cd alimento_dbt
dbt debug --profiles-dir .
```

## Carga com ETL

Na pasta raiz, execute:

```powershell
python job.py
```

O job recria a tabela `producao`, le `producao_alimentos.csv`, filtra produtos
com quantidade maior que 10 e calcula a coluna `margem_lucro`.

## Modelos dbt

Camadas do projeto:

- `models/staging/sources.yml`: declara a origem `main.producao`.
- `models/staging/stg_producao_alimentos.sql`: padroniza nomes e tipos.
- `models/marts/fct_producao_alimentos.sql`: cria a tabela analitica.
- `models/marts/projecao_receita_alimentos.sql`: cria cenarios de projecao.

Exemplos usados:

```sql
from {{ source('raw', 'producao') }}
```

```sql
from {{ ref('stg_producao_alimentos') }}
```

## Execucao

Rode o pipeline completo a partir da pasta raiz:

```powershell
.\scripts\run_pipeline.ps1
```

Ou rode por etapas:

```powershell
python job.py
cd alimento_dbt
dbt run --profiles-dir .
dbt test --profiles-dir .
dbt docs generate --profiles-dir .
```

Modelos gerados no SQLite:

- `main.stg_producao_alimentos`
- `main.fct_producao_alimentos`
- `main.projecao_receita_alimentos`

## Testes

```powershell
dbt test --profiles-dir .
```

Ha testes de:

- `not_null`
- `unique`
- `accepted_values`
- quantidade positiva
- receita projetada maior que receita atual

## Documentacao

Gere e abra a documentacao interativa:

```powershell
dbt docs generate --profiles-dir .
dbt docs serve --profiles-dir .
```

## Perguntas que o projeto responde

- Quais alimentos geram mais receita total?
- Quais alimentos tem maior receita por kg?
- Quais produtos estao em faixa alta, media ou baixa de producao?
- Como ficaria a receita com crescimento de 10 por cento?
- Como ficaria a receita se o volume produzido crescer 15 por cento?
=======
# pipeline_dbt
>>>>>>> 31d5692ad9c358891239a76659d394e8a7365b2c
