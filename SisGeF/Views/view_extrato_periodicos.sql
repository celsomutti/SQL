CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `view_extrato_periodicos` AS
    SELECT 
        `periodicos_macro`.`cod_macro` AS `cod_macro`,
        `periodicos_macro`.`nom_macro` AS `nom_macro`,
        `periodicos_tiragem`.`DAT_TIRAGEM` AS `dat_tiragem`,
        SUM(`periodicos_tiragem`.`QTD_TIRAGEM`) AS `qtd_tiragem`
    FROM
        ((`periodicos_tiragem`
        JOIN `periodicos_agentes` ON ((`periodicos_tiragem`.`COD_ROTEIRO` = `periodicos_agentes`.`cod_agente`)))
        JOIN `periodicos_macro` ON ((`periodicos_agentes`.`cod_macro` = `periodicos_macro`.`cod_macro`)))
    GROUP BY `periodicos_macro`.`cod_macro` , `periodicos_macro`.`nom_macro`