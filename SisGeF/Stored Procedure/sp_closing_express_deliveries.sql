CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_closing_express_deliveries`(
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
		tbentregas.dom_fechado = "S", tbentregas.num_extrato = pExtract , tbentregas.dom_credito = "S", tbentregas.dat_credito = pCreditDate
	where tbentregas.dat_baixa between pInitialDate and pFinalDate and tbentregas.cod_entregador = pDeliveryman and tbentregas.dom_fechado = 'N';
END