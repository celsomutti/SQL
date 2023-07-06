CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_demonstrativoextravios` AS
    SELECT 
        `tbextravios`.`COD_EXTRAVIO` AS `COD_EXTRAVIO`,
        `tbextravios`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
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
        `tbextravios`.`VAL_PERCENTUAL_PAGO` AS `VAL_PERCENTUAL_PAGO`,
        `tbextravios`.`SEQ_ACAREACAO` AS `SEQ_ACAREACAO`,
        `tbextravios`.`NOM_EXECUTOR` AS `NOM_EXECUTOR`,
        `tbextravios`.`DAT_MANUTENCAO` AS `DAT_MANUTENCAO`,
        `tbextravios`.`NUM_EXTRATO` AS `NUM_EXTRATO`
    FROM
        `tbextravios`