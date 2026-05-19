with base as (
    select *
    from {{ ref('fct_producao_alimentos') }}
)

select
    produto,
    quantidade_kg,
    preco_medio,
    receita_total,
    receita_por_kg,
    round(receita_total * 1.10, 2) as receita_projetada_10_pct,
    round(quantidade_kg * 1.15, 2) as quantidade_projetada_kg,
    round((quantidade_kg * 1.15) * receita_por_kg, 2) as receita_projetada_volume_15_pct
from base
