CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_list_os` AS
    SELECT 
        `tbordemservico`.`NUM_OS` AS `num_os`,
        `tbordemservico`.`DAT_OS` AS `dat_os`,
        `tbordemservico`.`COD_CLIENTE` AS `cod_cliente`,
        `crm_clientes`.`nom_fantasia` AS `nom_cliente`,
        `tbordemservico`.`COD_ENTREGADOR` AS `cod_entregador`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `nom_entregador`,
        `tbordemservico`.`DES_ROTA` AS `des_rota`,
        `tbordemservico`.`COD_VEICULO` AS `cod_veiculo`,
        `tbveiculos`.`DES_PLACA` AS `des_placa`,
        `tbordemservico`.`cod_cadastro` AS `cod_terceiro`,
        `tbterceiros`.`DES_RAZAO_SOCIAL` AS `nom_terceiro`
    FROM
        ((((`tbordemservico`
        LEFT JOIN `crm_clientes` ON ((`crm_clientes`.`cod_cliente` = `tbordemservico`.`COD_CLIENTE`)))
        LEFT JOIN `tbentregadores` ON ((`tbentregadores`.`COD_CADASTRO` = `tbordemservico`.`COD_ENTREGADOR`)))
        LEFT JOIN `tbveiculos` ON ((`tbveiculos`.`COD_VEICULO` = `tbordemservico`.`COD_VEICULO`)))
        LEFT JOIN `tbentregadores` `tbterceiros` ON ((`tbterceiros`.`COD_CADASTRO` = `tbordemservico`.`cod_cadastro`)))