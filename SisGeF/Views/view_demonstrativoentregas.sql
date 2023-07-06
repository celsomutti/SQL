CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_demonstrativoentregas` AS
    SELECT 
        `tbentregas`.`DAT_BAIXA` AS `dat_baixa`,
        COUNT(`tbentregas`.`NUM_NOSSONUMERO`) AS `qtd_entregas`,
        SUM(`tbentregas`.`QTD_VOLUMES`) AS `qtd_volumes`,
        `tbentregas`.`VAL_VERBA_ENTREGADOR` AS `val_verba_entregador`
    FROM
        `tbentregas`
    WHERE
        ((`tbentregas`.`DOM_BAIXADO` = 'S')
            AND (`tbentregas`.`DOM_FECHADO` = 'N')
            AND (`tbentregas`.`COD_ENTREGADOR` = 10006))
    GROUP BY `tbentregas`.`DAT_BAIXA` , `tbentregas`.`VAL_VERBA_ENTREGADOR`