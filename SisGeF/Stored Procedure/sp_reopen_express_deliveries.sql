CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reopen_express_deliveries`(
	in pExtract varchar(30), 
    in pCreditDate Date, 
    in pDeliveryman int, 
    in pInitialDate Date, 
    in pFinalDate date, 
    in pType int
)
BEGIN
	update 	tbentregas 
	set
		tbentregas.dom_fechado = "N", tbentregas.num_extrato = "0" , tbentregas.dom_credito = "N", tbentregas.dat_credito = null
	where tbentregas.num_extrato = pExtract;
END