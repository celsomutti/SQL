CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_express_extract_loss`(
	in pdomFinalize char(1)
)
BEGIN
	select	tbextravios.cod_entregador as cod_entregador,
			tbcodigosentregadores.nom_fantasia as nom_entregador, 
			tbextravios.cod_agente as cod_base, 
			tbagentes.nom_fantasia as nom_base, 
			tbextravios.cod_cliente as cod_cliente, 
			crm_clientes.nom_fantasia as nom_cliente, 
			tbextravios.des_extravio as des_extravio,
            tbextravios.des_produto as des_produto,
            tbextravios.num_extrato as num_extrato,
			sum(tbextravios.val_total) as val_total 
			from tbextravios
			left join tbcodigosentregadores
			on tbcodigosentregadores.cod_entregador = tbextravios.cod_entregador
			left join tbagentes
			on tbagentes.cod_agente = tbextravios.cod_agente
			left join crm_clientes
			on crm_clientes.cod_cliente = tbextravios.cod_cliente
			where tbextravios.dom_restricao = pdomFinalize and tbextravios.val_percentual_pago < 100
			group by tbextravios.cod_cliente, crm_clientes.nom_fantasia, tbextravios.cod_agente, tbagentes.nom_fantasia, tbextravios.cod_entregador, tbcodigosentregadores.nom_fantasia;
END