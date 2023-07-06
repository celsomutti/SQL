CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete_credit_worksheet_express`(
	in pid_registro int
)
BEGIN
delete from financeiro_planilha_credito
    where financeiro_planilha_credito.id_registro = pid_registro;
END