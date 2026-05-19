# Pipeline Analítico com dbt + SQLite

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

---

# Sobre o Projeto

Pipeline de Engenharia de Dados desenvolvido utilizando Python, SQLite e dbt Core para processamento analítico de dados de produção alimentar.

O projeto implementa conceitos modernos de Analytics Engineering, incluindo:

- ETL com Python
- Transformações analíticas com dbt
- Arquitetura em camadas
- Testes automatizados de qualidade de dados
- Data lineage
- Documentação automática
- Regras de negócio
- Modelagem analítica

---

# Arquitetura do Pipeline

```text
CSV → Python ETL → SQLite → dbt staging → dbt marts → testes → documentação
```

---

# Stack Utilizada

- Python
- SQLite
- dbt Core
- SQL
- Pandas
- Data Quality Testing
- Analytics Engineering

---

# Estrutura do Projeto

```text
alimento_dbt/
│
├── models/
│   ├── staging/
│   └── marts/
│
├── tests/
├── macros/
├── snapshots/
├── analyses/
│
├── dbt_project.yml
├── job.py
├── producao_alimentos.csv
└── README.md
```

---

# Fluxo de Dados

## Pipeline Analítico

```text
raw.producao
        ↓
stg_producao_alimentos
        ↓
fct_producao_alimentos
        ↓
projecao_receita_alimentos
```

---

# Data Lineage

![Lineage Graph](images/lineage.png)

O pipeline utiliza:
- `source()`
- `ref()`
- testes automatizados
- rastreabilidade completa das transformações

---

# Camadas do Projeto

## Raw Layer

Dados brutos carregados pelo ETL Python.

Tabela:

```sql
main.producao
```

---

## Staging Layer

Padronização e limpeza dos dados.

Modelo:

```sql
stg_producao_alimentos
```

Transformações aplicadas:

- normalização de strings
- tipagem numérica
- limpeza de valores
- padronização de colunas

---

## Mart Layer

Tabela analítica principal.

Modelo:

```sql
fct_producao_alimentos
```

Métricas implementadas:

- receita por kg
- classificação de produção
- classificação de margem

---

## Analytical Projection Layer

Modelo analítico de projeções.

Modelo:

```sql
projecao_receita_alimentos
```

Cenários simulados:

- crescimento de receita em 10%
- crescimento de volume em 15%

---

# Testes de Qualidade de Dados

O projeto implementa testes automatizados utilizando dbt.

## Generic Tests

- `not_null`
- `unique`
- `accepted_values`

---

## Singular Tests

### Quantidade positiva

```sql
where quantidade_kg <= 0
```

### Receita projetada maior que receita atual

```sql
where receita_projetada_10_pct <= receita_total
```

---

# Resultado dos Testes

```text
PASS=23
ERROR=0
WARN=0
```

---

# Como Executar

## 1. Instalar dependências

```bash
pip install dbt-sqlite pandas
```

---

## 2. Executar ETL

```bash
python job.py
```

---

## 3. Executar modelos dbt

```bash
dbt run --profiles-dir .
```

---

## 4. Executar testes

```bash
dbt test --profiles-dir .
```

---

## 5. Executar pipeline completo

```bash
dbt build --profiles-dir .
```

---

## 6. Gerar documentação

```bash
dbt docs generate --profiles-dir .

dbt docs serve --profiles-dir .
```

---

# Insights Gerados

O projeto permite responder perguntas analíticas como:

- Quais produtos possuem maior receita?
- Qual produto possui maior receita por kg?
- Quais produtos possuem maior margem?
- Como seria a receita com crescimento de 10%?
- Como seria o impacto de crescimento de produção?

---

# Funcionalidades Implementadas

- ETL com Python
- Data Modeling
- Data Lineage
- Data Quality Tests
- Analytics Engineering
- SQL Transformations
- Regras de Negócio
- Projeções Analíticas
- Documentação Automática

---

# Autor

## Guilherme Berti

Engenheiro de Dados em formação com experiência em:

- Python
- SQL
- Apache Spark
- Azure
- Databricks
- dbt
- Engenharia de Dados

GitHub:
https://github.com/GuilhermeBerti
