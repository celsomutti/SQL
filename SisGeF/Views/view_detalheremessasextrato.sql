CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_detalheremessasextrato` AS
    SELECT 
        `tbentregas`.`NUM_NOSSONUMERO` AS `NUM_NOSSONUMERO`,
        `tbentregas`.`COD_CLIENTE_EMPRESA` AS `COD_CLIENTE_EMPRESA`,
        `tbentregas`.`COD_AGENTE` AS `COD_AGENTE`,
        `tbentregas`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
        `tbentregas`.`NUM_CEP` AS `NUM_CEP`,
        `tbentregas`.`DAT_EXPEDICAO` AS `DAT_EXPEDICAO`,
        `tbentregas`.`DAT_PREV_DISTRIBUICAO` AS `DAT_PREV_DISTRIBUICAO`,
        `tbentregas`.`QTD_VOLUMES` AS `QTD_VOLUMES`,
        `tbentregas`.`DAT_ATRIBUICAO` AS `DAT_ATRIBUICAO`,
        `tbentregas`.`DAT_BAIXA` AS `DAT_BAIXA`,
        `tbentregas`.`QTD_PESO_REAL` AS `QTD_PESO_REAL`,
        `tbentregas`.`VAL_VERBA_FRANQUIA` AS `VAL_VERBA_FRANQUIA`,
        `tbentregas`.`VAL_VERBA_ENTREGADOR` AS `VAL_VERBA_ENTREGADOR`,
        `tbentregas`.`DES_TIPO_PESO` AS `DES_TIPO_PESO`,
        `tbentregas`.`VAL_PRODUTO` AS `VAL_PRODUTO`,
        `tbentregas`.`QTD_ALTURA` AS `QTD_ALTURA`,
        `tbentregas`.`QTD_LARGURA` AS `QTD_LARGURA`,
        `tbentregas`.`QTD_COMPRIMENTO` AS `QTD_COMPRIMENTO`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `NOM_FANTASIA`
    FROM
        (`tbentregas`
        LEFT JOIN `tbcodigosentregadores` ON ((`tbcodigosentregadores`.`COD_ENTREGADOR` = `tbentregas`.`COD_ENTREGADOR`)))