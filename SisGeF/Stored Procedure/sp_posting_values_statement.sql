CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_posting_values_statement`(
in pdateBase DATE, 
in pclosedRelease char(1)
)
BEGIN

select	tblancamentos.cod_entregador as cod_entregador,
		tbcodigosentregadores.nom_fantasia as nom_entregador, 
		tbcodigosentregadores.cod_agente as cod_base, 
        tbagentes.nom_fantasia as nom_base, 
        tbcodigosentregadores.cod_cliente as cod_cliente, 
        crm_clientes.nom_fantasia as nom_cliente, 
		tblancamentos.des_tipo as des_tipo,
        tblancamentos.num_extrato as num_extrato,
		sum(tblancamentos.val_lancamento) as val_total 
        from tblancamentos
        left join tbcodigosentregadores
        on tbcodigosentregadores.cod_entregador = tblancamentos.cod_entregador
        left join tbagentes
        on tbagentes.cod_agente = tbcodigosentregadores.cod_agente
        left join crm_clientes
        on crm_clientes.cod_cliente = tbcodigosentregadores.cod_cliente
		where tblancamentos.dat_lancamento <= pdateBase and tblancamentos.dom_desconto = pclosedRelease and tblancamentos.cod_entregador <> 0
		group by tbcodigosentregadores.cod_cliente, crm_clientes.nom_fantasia, tbcodigosentregadores.cod_agente, tbagentes.nom_fantasia, tblancamentos.cod_entregador, tbcodigosentregadores.nom_fantasia, tblancamentos.des_tipo, tblancamentos.num_extrato;
END