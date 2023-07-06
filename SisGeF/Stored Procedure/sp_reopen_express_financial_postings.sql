CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reopen_express_financial_postings`(
	in pExtract varchar(30), 
    in pCreditDate Date, 
    in pDeliveryman int, 
    in pInitialDate Date, 
    in pFinalDate date, 
    in pType int
)
BEGIN
	update tblancamentos 
	set 
		tblancamentos.dom_desconto = "N", tblancamentos.dat_desconto = null, 
		tblancamentos.num_extrato = "0"
	where tblancamentos.num_extrato = pExtract and tblancamentos.cod_entregador <> 0;
END