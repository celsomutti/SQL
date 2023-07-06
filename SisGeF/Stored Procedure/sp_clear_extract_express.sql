CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clear_extract_express`(
	in pKey varchar(30)
)
BEGIN
	delete from expressas_extrato
    where expressas_extrato.num_extrato = pKey;
    delete from expressas_planilha_credito
    where expressas_planilha_credito.num_extrato = pKey;
END