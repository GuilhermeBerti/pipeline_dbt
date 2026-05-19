select *
from {{ ref('fct_producao_alimentos') }}
where quantidade_kg <= 0
