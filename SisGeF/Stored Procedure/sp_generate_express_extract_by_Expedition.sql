CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generate_express_extract_by_Expedition`(
	in pdataInicio DATE,
    in pdataFinal DATE,
    in pvolumeExtra INT
)
BEGIN
	select 
    tbentregas.cod_agente as cod_base,
    tbagentes.nom_fantasia as nom_base, 
    tbentregas.cod_entregador as cod_entregador, 
    tbcodigosentregadores.nom_fantasia as nom_entregador, 
    tbentregas.val_verba_entregador as val_verba, 
    sum(tbentregas.qtd_volumes) as qtd_volumes,
    if(pvolumeExtra = 1, if(tbentregas.qtd_peso_cobrado <=30,((sum(tbentregas.qtd_volumes) - count(tbentregas.num_nossonumero)) / 2),0),0) as qtd_volumes_extra, 
    count(tbentregas.num_nossonumero) as qtd_entregas,
    sum(if(tbentregas.qtd_dias_atraso > 0,1,0)) as qtd_atraso, 
    (100 - ((sum(if(tbentregas.qtd_dias_atraso > 0,1,0)) / count(tbentregas.num_nossonumero))) * 100) as val_performance,
    (tbentregas.val_verba_entregador * count(tbentregas.num_nossonumero)) as val_producao, 
    tbentregas.cod_cliente_empresa as cod_cliente,
    crm_clientes.nom_fantasia as nom_cliente, 
    ((sum(tbentregas.qtd_volumes) * tbentregas.val_verba_franquia) + 0) as val_total_empresa, 
    tbentregas.dat_expedicao as dat_baixa, 
    sum(tbentregas.qtd_peso_cobrado) as qtd_media_peso
from
	tbentregas
left join tbagentes on tbagentes.cod_agente = tbentregas.cod_agente 
left join tbcodigosentregadores on tbcodigosentregadores.cod_entregador = tbentregas.cod_entregador 
left join crm_clientes on crm_clientes.cod_cliente = tbentregas.cod_cliente_empresa 
where tbentregas.dat_expedicao between pdataInicio and pdataFinal and dom_fechado <> 'S'
group by
	tbentregas.cod_cliente_empresa, crm_clientes.nom_fantasia, tbentregas.cod_agente, tbagentes.nom_fantasia, tbentregas.cod_entregador, tbcodigosentregadores.nom_fantasia, tbentregas.val_verba_entregador;
END