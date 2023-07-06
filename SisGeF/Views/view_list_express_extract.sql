CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_list_express_extract` AS
    SELECT 
        `expressas_extrato`.`id_extrato` AS `id_extrato`,
        `expressas_extrato`.`dat_inicio` AS `dat_inicio`,
        `expressas_extrato`.`dat_final` AS `dat_final`,
        `expressas_extrato`.`num_ano` AS `num_ano`,
        `expressas_extrato`.`num_mes` AS `num_mes`,
        `expressas_extrato`.`num_quinzena` AS `num_quinzena`,
        `expressas_extrato`.`cod_base` AS `cod_base`,
        `tbagentes`.`nom_fantasia` AS `nom_base`,
        `expressas_extrato`.`cod_entregador` AS `cod_entregador`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `nom_entregador`,
        `expressas_extrato`.`num_extrato` AS `num_extrato`,
        `expressas_extrato`.`val_verba` AS `val_verba`,
        `expressas_extrato`.`qtd_volumes` AS `qtd_volumes`,
        `expressas_extrato`.`qtd_volumes_extra` AS `qtd_volumes_extra`,
        `expressas_extrato`.`qtd_entregas` AS `qtd_entregas`,
        `expressas_extrato`.`qtd_atraso` AS `qtd_atraso`,
        `expressas_extrato`.`val_performance` AS `val_performance`,
        `expressas_extrato`.`val_creditos` AS `val_creditos`,
        `expressas_extrato`.`val_debitos` AS `val_debitos`,
        `expressas_extrato`.`val_extravios` AS `val_extravios`,
        `expressas_extrato`.`val_total_empresa` AS `val_total_empresa`,
        `expressas_extrato`.`cod_cliente` AS `cod_cliente`,
        `crm_clientes`.`nom_fantasia` AS `nom_cliente`,
        `expressas_extrato`.`dat_credito` AS `dat_credito`,
        `expressas_extrato`.`des_unique_key` AS `des_unique_key`
    FROM
        (((`expressas_extrato`
        LEFT JOIN `tbagentes` ON ((`tbagentes`.`cod_agente` = `expressas_extrato`.`cod_base`)))
        LEFT JOIN `tbcodigosentregadores` ON ((`tbcodigosentregadores`.`COD_ENTREGADOR` = `expressas_extrato`.`cod_entregador`)))
        LEFT JOIN `crm_clientes` ON ((`crm_clientes`.`cod_cliente` = `expressas_extrato`.`cod_cliente`)))