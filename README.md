# Pipeline Analítico com dbt + SQLite

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

![dbt](https://img.shields.io/badge/dbt-FF694B?style=for-the-badge&logo=dbt&logoColor=white)

![SQLite](https://img.shields.io/badge/SQLite-003B57?style=for-the-badge&logo=sqlite&logoColor=white)

![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)

---

# Sobre o Projeto

Pipeline de Engenharia de Dados desenvolvido utilizando Python, SQLite e dbt Core para processamento analítico de dados de produção alimentar.

O projeto implementa conceitos modernos de Analytics Engineering com:

- ETL em Python
- Camadas staging e marts no dbt
- Testes automatizados de qualidade de dados
- Data lineage
- Documentação automática
- Regras de negócio analíticas
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
├── profiles.yml
├── job.py
├── producao_alimentos.csv
└── README.md
```

---

# Fluxo do dbt

## Data Lineage

O pipeline possui dependência entre modelos utilizando:

- `source()`
- `ref()`

Implementando rastreabilidade completa das transformações.

---

# Camadas do Projeto

## Raw Layer

Tabela original carregada pelo ETL Python:

```sql
main.producao
```

---

## Staging Layer

Padronização e tipagem dos dados:

```sql
stg_producao_alimentos
```

Transformações aplicadas:

- normalização de strings
- casts numéricos
- padronização de nomes

---

## Mart Layer

Tabela analítica principal:

```sql
fct_producao_alimentos
```

Métricas calculadas:

- receita por kg
- faixa de produção
- faixa de margem

---

## Analytical Projection Layer

Modelo analítico de projeção:

```sql
projecao_receita_alimentos
```

Cenários implementados:

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

# DAG do Projeto

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

- Quais alimentos geram maior receita?
- Qual produto possui maior receita por kg?
- Quais produtos possuem maior margem?
- Como seria a receita com crescimento de 10%?
- Como seria a produção com crescimento de volume?

---

# Funcionalidades Implementadas

- ETL com Python
- Data Modeling
- Data Lineage
- Data Quality Tests
- Analytics Engineering
- SQL Transformations
- Projeções Analíticas
- Documentação Automática
- Camadas staging/marts

---

# Melhorias Futuras

- CI/CD com GitHub Actions
- Incremental Models
- Snapshots
- Seeds
- Testes avançados com dbt-expectations
- Integração com Data Warehouse Cloud

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
