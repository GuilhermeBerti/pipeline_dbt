select *
from {{ ref('projecao_receita_alimentos') }}
where receita_projetada_10_pct <= receita_total
