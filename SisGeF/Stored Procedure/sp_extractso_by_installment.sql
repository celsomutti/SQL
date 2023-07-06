CREATE DEFINER=`root`@`%` PROCEDURE `sp_extractso_by_installment`(
in pdateinitial date,
in pdatefinal date,
in pTypeExtract int,
in psituation char(1)
)
BEGIN
	select  
		TBORDEMSERVICO.NUM_OS as num_os, 
		TBORDEMSERVICO.DAT_OS as dat_os, 
		TBORDEMSERVICO.DES_ROTA as des_rota, 
		TBORDEMSERVICO.DES_SERVICO as des_servico, 
		TBORDEMSERVICO.DOM_FECHADO as dom_fechado, 
		TBORDEMSERVICO.DAT_PAGO as dat_pago, 
		TBORDEMSERVICO.NUM_EXTRATO as num_extrato, 
		TBORDEMSERVICO.cod_cliente as cod_cadastro,
        crm_clientes.des_razao_social as nom_cadastro, 
        TBVEICULOS.DES_PLACA as des_placa
	FROM
		TBORDEMSERVICO
	LEFT JOIN crm_clientes ON crm_clientes.cod_cliente = TBORDEMSERVICO.cod_cliente
    LEFT JOIN TBVEICULOS ON TBVEICULOS.COD_VEICULO = TBORDEMSERVICO.cod_VEICULO
    where TBORDEMSERVICO.DAT_OS between pdateinitial and pdatefinal and TBORDEMSERVICO.DOM_FECHADO = psituation and TBORDEMSERVICO.COD_TIPO_OS = pTypeExtract;  
END