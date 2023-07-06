CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_closing_express_financial_postings`(
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
		tblancamentos.dom_desconto = "S", tblancamentos.dat_desconto = pCreditDate, 
		tblancamentos.num_extrato = pExtract
	where tblancamentos.dat_lancamento <= pFinalDate and tblancamentos.dom_desconto <> "S" and tblancamentos.dom_persistir <> "S" and tblancamentos.cod_entregador = pDeliveryman;
END