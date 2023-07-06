CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clear_credit_worksheet`(
in pid_registro int,
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
in dom_bloqueio int
)
BEGIN
	delete from financeiro_planilha_credito
	where financeiro_planilha_credito.cod_tipo_extrato = pcod_tipo_extrato and 
    financeiro_planilha_credito.dat_credito = pdat_credito;	
END