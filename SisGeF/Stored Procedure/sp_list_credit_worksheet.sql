CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_credit_worksheet`(
	in pcod_tipo_extrato int,
	in pcod_cadastro int,
	in pnom_cadastro varchar(70),
	in pcod_banco varchar(4),
	in pnom_banco varchar(50),
	in pdes_tipo_conta varchar(30),
	in pnum_agencia varchar(10),
	in pnum_conta varchar(30),
	in pnom_favorecido varchar(70),
	in pnum_cpf_cnpj varchar(20),
	in pval_total float,
	in pdes_unique_key varchar(30),
	in pdat_credito date,
	in pnum_extrato varchar(30),
	in pdes_forma_pagamento varchar(30),
	in pcod_modalidade_pagamento varchar(6),
	in pcod_forma_pagamento varchar(6),
	in pdom_bloqueio int, 
    in pdes_observation varchar(256)
)
BEGIN
select 
	financeiro_planilha_credito.id_registro, 
	financeiro_planilha_credito.cod_tipo_extrato,
	financeiro_planilha_credito.cod_cadastro,
	financeiro_planilha_credito.nom_cadastro,
	financeiro_planilha_credito.cod_banco,
	financeiro_planilha_credito.nom_banco,
	financeiro_planilha_credito.des_tipo_conta,
	financeiro_planilha_credito.num_agencia,
	financeiro_planilha_credito.num_conta,
	financeiro_planilha_credito.nom_favorecido,
	financeiro_planilha_credito.num_cpf_cnpj,
	financeiro_planilha_credito.val_total,
	financeiro_planilha_credito.des_unique_key,
	financeiro_planilha_credito.dat_credito,
	financeiro_planilha_credito.num_extrato,
	financeiro_planilha_credito.des_forma_pagamento,
	financeiro_planilha_credito.cod_modalidade_pagamento,
	financeiro_planilha_credito.cod_forma_pagamento,
	financeiro_planilha_credito.dom_bloqueio,
    financeiro_planilha_credito.des_observation
from financeiro_planilha_credito
where  financeiro_planilha_credito.dat_credito = pdat_credito;
END