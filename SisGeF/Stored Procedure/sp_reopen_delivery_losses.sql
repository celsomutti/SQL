CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_reopen_delivery_losses`(in pExtract varchar(30), 
    in pCreditDate Date, 
    in pDeliveryman int, 
    in pInitialDate Date, 
    in pFinalDate date, 
    in pType int
)
BEGIN
	update tbextravios 
	set 
		tbextravios.val_percentual_pago = 0, tbextravios.num_extrato = "0"
		where tbextravios.num_extrato = pExtract;    
END