with fonte as (
    select
        produto,
        quantidade,
        preco_medio,
        receita_total,
        margem_lucro
    from {{ source('raw', 'producao') }}
)

select
    lower(trim(produto)) as produto,
    cast(quantidade as integer) as quantidade_kg,
    cast(preco_medio as numeric(10, 2)) as preco_medio,
    cast(receita_total as numeric(14, 2)) as receita_total,
    cast(margem_lucro as numeric(14, 2)) as margem_lucro
from fonte
