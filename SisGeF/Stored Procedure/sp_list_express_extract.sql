CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_list_express_extract`( 
	in pYear int,
    in pMonth int, 
    in pFortnight int,
    in pPosfix varchar(3)
)
BEGIN
select	expressas_extrato.id_extrato as id_extrato, 
		expressas_extrato.dat_inicio as dat_inicio, 
        expressas_extrato.dat_final as dat_final, 
        expressas_extrato.num_ano as num_ano, 
        expressas_extrato.num_mes as num_mes, 
        expressas_extrato.num_quinzena as num_quinzena, 
        expressas_extrato.cod_base as cod_base, 
        tbagentes.nom_fantasia as nom_base, 
        expressas_extrato.cod_entregador as cod_entregador,
        tbcodigosentregadores.nom_fantasia as nom_entregador,
		expressas_extrato.num_extrato as num_extrato, 
        expressas_extrato.val_verba as val_verba, 
        expressas_extrato.qtd_volumes as qtd_volumes, 
        expressas_extrato.qtd_volumes_extra as qtd_volumes_extra, 
        expressas_extrato.qtd_entregas as qtd_entregas, 
        expressas_extrato.qtd_atraso as qtd_atraso, 
		expressas_extrato.val_performance as val_performance, 
        expressas_extrato.val_creditos as val_creditos, 
        expressas_extrato.val_debitos as val_debitos, 
        expressas_extrato.val_extravios as val_extravios, 
        expressas_extrato.val_total_empresa as val_total_empresa,
		expressas_extrato.cod_cliente as cod_cliente, 
        crm_clientes.nom_fantasia as nom_cliente,
        expressas_extrato.dat_credito as dat_credito, 
        expressas_extrato.des_unique_key as des_unique_key
	from expressas_extrato
	left join tbagentes on tbagentes.cod_agente = expressas_extrato.cod_base 
	left join tbcodigosentregadores on tbcodigosentregadores.cod_entregador = expressas_extrato.cod_entregador 
	left join crm_clientes on crm_clientes.cod_cliente = expressas_extrato.cod_cliente
	where num_ano = pYear and num_mes = pMonth and num_quinzena = pFortnight and expressas_extrato.des_unique_key like  concat(pPosfix, '%');	
END