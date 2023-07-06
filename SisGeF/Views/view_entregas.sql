CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_entregas` AS
    SELECT 
        `tbentregas`.`NUM_NOSSONUMERO` AS `NUM_NOSSONUMERO`,
        `tbentregas`.`COD_AGENTE` AS `COD_AGENTE`,
        `tbagentes`.`nom_fantasia` AS `NOM_AGENTE`,
        `tbentregas`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `NOM_ENTREGADOR`,
        `tbentregas`.`COD_CLIENTE` AS `COD_CLIENTE`,
        `tbclientes`.`NOM_CLIENTE` AS `NOM_CLIENTE`,
        `tbentregas`.`NUM_NF` AS `NUM_NF`,
        `tbentregas`.`NOM_CONSUMIDOR` AS `NOM_CONSUMIDOR`,
        `tbentregas`.`DES_ENDERECO` AS `DES_ENDERECO`,
        `tbentregas`.`DES_COMPLEMENTO` AS `DES_COMPLEMENTO`,
        `tbentregas`.`DES_BAIRRO` AS `DES_BAIRRO`,
        `tbentregas`.`NOM_CIDADE` AS `NOM_CIDADE`,
        `tbentregas`.`NUM_CEP` AS `NUM_CEP`,
        `tbentregas`.`NUM_TELEFONE` AS `NUM_TELEFONE`,
        `tbentregas`.`DAT_EXPEDICAO` AS `DAT_EXPEDICAO`,
        `tbentregas`.`DAT_PREV_DISTRIBUICAO` AS `DAT_PREV_DISTRIBUICAO`,
        `tbentregas`.`QTD_VOLUMES` AS `QTD_VOLUMES`,
        `tbentregas`.`DAT_ATRIBUICAO` AS `DAT_ATRIBUICAO`,
        `tbentregas`.`DAT_BAIXA` AS `DAT_BAIXA`,
        `tbentregas`.`DOM_BAIXADO` AS `DOM_BAIXADO`,
        `tbentregas`.`DAT_PAGAMENTO` AS `DAT_PAGAMENTO`,
        `tbentregas`.`DOM_PAGO` AS `DOM_PAGO`,
        `tbentregas`.`DOM_FECHADO` AS `DOM_FECHADO`,
        `tbentregas`.`COD_STATUS` AS `COD_STATUS`,
        `tbentregas`.`DAT_ENTREGA` AS `DAT_ENTREGA`,
        `tbentregas`.`QTD_PESO_REAL` AS `QTD_PESO_REAL`,
        `tbentregas`.`QTD_PESO_FRANQUIA` AS `QTD_PESO_FRANQUIA`,
        `tbentregas`.`VAL_VERBA_FRANQUIA` AS `VAL_VERBA_FRANQUIA`,
        `tbentregas`.`VAL_ADVALOREM` AS `VAL_ADVALOREM`,
        `tbentregas`.`VAL_PAGO_FRANQUIA` AS `VAL_PAGO_FRANQUIA`,
        `tbentregas`.`VAL_VERBA_ENTREGADOR` AS `VAL_VERBA_ENTREGADOR`,
        `tbentregas`.`NUM_EXTRATO` AS `NUM_EXTRATO`,
        `tbentregas`.`QTD_DIAS_ATRASO` AS `QTD_DIAS_ATRASO`,
        `tbentregas`.`QTD_VOLUMES_EXTRA` AS `QTD_VOLUMES_EXTRA`,
        `tbentregas`.`VAL_VOLUMES_EXTRA` AS `VAL_VOLUMES_EXTRA`,
        `tbentregas`.`QTD_PESO_COBRADO` AS `QTD_PESO_COBRADO`,
        `tbentregas`.`DES_TIPO_PESO` AS `DES_TIPO_PESO`,
        `tbentregas`.`DAT_RECEBIDO` AS `DAT_RECEBIDO`,
        `tbentregas`.`DOM_RECEBIDO` AS `DOM_RECEBIDO`,
        `tbentregas`.`NUM_CTRC` AS `NUM_CTRC`,
        `tbentregas`.`NUM_MANIFESTO` AS `NUM_MANIFESTO`,
        `tbentregas`.`DES_RASTREIO` AS `DES_RASTREIO`,
        `tbentregas`.`NUM_LOTE_REMESSA` AS `NUM_LOTE_REMESSA`,
        `tbentregas`.`DES_RETORNO` AS `DES_RETORNO`,
        `tbentregas`.`DAT_CREDITO` AS `DAT_CREDITO`,
        `tbentregas`.`DOM_CREDITO` AS `DOM_CREDITO`,
        `tbentregas`.`NUM_CONTAINER` AS `NUM_CONTAINER`,
        `tbentregas`.`VAL_PRODUTO` AS `VAL_PRODUTO`,
        `tbentregas`.`QTD_ALTURA` AS `QTD_ALTURA`,
        `tbentregas`.`QTD_LARGURA` AS `QTD_LARGURA`,
        `tbentregas`.`QTD_COMPRIMENTO` AS `QTD_COMPRIMENTO`,
        `tbentregas`.`COD_FEEDBACK` AS `COD_FEEDBACK`,
        `tbentregas`.`DAT_FEEDBACK` AS `DAT_FEEDBACK`,
        `tbentregas`.`DOM_CONFERIDO` AS `DOM_CONFERIDO`,
        `tbentregas`.`NUM_PEDIDO` AS `NUM_PEDIDO`,
        `tbentregas`.`COD_CLIENTE_EMPRESA` AS `COD_CLIENTE_EMPRESA`,
        `expressas_controle_awb`.`cod_awb1` AS `cod_awb`,
        `expressas_controle_awb`.`des_produto` AS `des_produto`
    FROM
        ((((`tbentregas`
        LEFT JOIN `tbagentes` ON ((`tbagentes`.`cod_agente` = `tbentregas`.`COD_AGENTE`)))
        LEFT JOIN `tbcodigosentregadores` ON (((`tbcodigosentregadores`.`COD_ENTREGADOR` = `tbentregas`.`COD_ENTREGADOR`)
            AND (`tbcodigosentregadores`.`COD_CLIENTE` = `tbentregas`.`COD_CLIENTE_EMPRESA`))))
        LEFT JOIN `tbclientes` ON (((`tbclientes`.`COD_CLIENTE_EMPRESA` = `tbentregas`.`COD_CLIENTE_EMPRESA`)
            AND (`tbclientes`.`COD_CLIENTE` = `tbentregas`.`COD_CLIENTE`))))
        LEFT JOIN `expressas_controle_awb` ON (((`expressas_controle_awb`.`num_remessa` = `tbentregas`.`NUM_NOSSONUMERO`)
            AND (`tbclientes`.`COD_CLIENTE` = `tbentregas`.`COD_CLIENTE`))))