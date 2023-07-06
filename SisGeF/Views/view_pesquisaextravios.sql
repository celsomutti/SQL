CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_pesquisaextravios` AS
    SELECT 
        `tbextravios`.`COD_EXTRAVIO` AS `COD_EXTRAVIO`,
        `tbextravios`.`COD_AGENTE` AS `COD_AGENTE`,
        `tbagentes`.`nom_fantasia` AS `NOM_AGENTE`,
        `tbextravios`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
        `tbcodigosentregadores`.`COD_CADASTRO` AS `COD_CADASTRO`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `NOM_ENTREGADOR`,
        `tbentregadores`.`NUM_CNPJ` AS `NUM_CNPJ`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `DES_RAZAO_SOCIAL`,
        `tbextravios`.`DAT_EXTRAVIO` AS `DAT_EXTRAVIO`,
        `tbextravios`.`DES_EXTRAVIO` AS `DES_EXTRAVIO`,
        `tbextravios`.`NUM_NOSSONUMERO` AS `NUM_NOSSONUMERO`,
        `tbextravios`.`VAL_PRODUTO` AS `VAL_PRODUTO`,
        `tbextravios`.`VAL_MULTA` AS `VAL_MULTA`,
        `tbextravios`.`VAL_VERBA` AS `VAL_VERBA`,
        `tbextravios`.`VAL_TOTAL` AS `VAL_TOTAL`,
        `tbextravios`.`DOM_RESTRICAO` AS `DOM_RESTRICAO`,
        `tbextravios`.`COD_TIPO` AS `COD_TIPO`,
        `tbextravios`.`DES_OBSERVACOES` AS `DES_OBSERVACOES`,
        `tbextravios`.`VAL_PERCENTUAL_PAGO` AS `VAL_PERCENTUAL`,
        `tbextravios`.`SEQ_ACAREACAO` AS `SEQ_ACAREACAO`,
        `tbextravios`.`NUM_EXTRATO` AS `NUM_EXTRATO`,
        `tbextravios`.`cod_awb` AS `cod_awb`,
        `tbextravios`.`des_produto` AS `des_produto`,
        `tbextravios`.`cod_cliente` AS `cod_cliente`
    FROM
        (((`tbextravios`
        LEFT JOIN `tbagentes` ON ((`tbagentes`.`cod_agente` = `tbextravios`.`COD_AGENTE`)))
        LEFT JOIN `tbcodigosentregadores` ON ((`tbcodigosentregadores`.`COD_ENTREGADOR` = `tbextravios`.`COD_ENTREGADOR`)))
        LEFT JOIN `tbentregadores` ON ((`tbentregadores`.`COD_CADASTRO` = `tbcodigosentregadores`.`COD_CADASTRO`)))