CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_close_delivery_losses`(
	in pExtract varchar(30), 
    in pCreditDate Date, 
    in pDeliveryman int, 
    in pInitialDate Date, 
    in pFinalDate date, 
    in pType int
)
BEGIN
	update tbextravios 
	set 
		tbextravios.val_percentual_pago = 100, tbextravios.num_extrato = pExtract
		where tbextravios.val_percentual_pago < 100 and dom_restricao = "S" and tbextravios.cod_entregador = pDeliveryman;
END