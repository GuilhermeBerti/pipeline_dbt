with producao as (
    select *
    from {{ ref('stg_producao_alimentos') }}
)

select
    produto,
    quantidade_kg,
    preco_medio,
    receita_total,
    margem_lucro,
    receita_total / nullif(quantidade_kg, 0) as receita_por_kg,
    case
        when quantidade_kg >= 100 then 'alta'
        when quantidade_kg >= 30 then 'media'
        else 'baixa'
    end as faixa_producao,
    case
        when margem_lucro >= 500 then 'alta_margem'
        when margem_lucro >= 100 then 'media_margem'
        else 'baixa_margem'
    end as faixa_margem
from producao
