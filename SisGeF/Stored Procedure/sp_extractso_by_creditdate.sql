CREATE DEFINER=`root`@`%` PROCEDURE `sp_extractso_by_creditdate`(
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
        TBORDEMSERVICO.VAL_DIARIA as val_total, 
		TBORDEMSERVICO.NUM_EXTRATO as num_extrato, 
		TBORDEMSERVICO.cod_cadastro as cod_cadastro
	FROM
		TBORDEMSERVICO
    where TBORDEMSERVICO.DAT_PAGO = pdatefinal and TBORDEMSERVICO.DOM_FECHADO = psituation and TBORDEMSERVICO.COD_TIPO_OS = pTypeExtract;
END