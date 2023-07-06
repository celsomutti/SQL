CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_entregadoresexpressabases` AS
    SELECT 
        `e`.`ID_ENTREGADOR` AS `id_entregador`,
        `e`.`COD_AGENTE` AS `cod_agente`,
        `b`.`nom_fantasia` AS `nom_base`,
        `e`.`COD_ENTREGADOR` AS `cod_entregador`,
        `e`.`NOM_FANTASIA` AS `nom_entregador`,
        `e`.`DES_CHAVE` AS `des_chave`,
        `e`.`COD_CADASTRO` AS `cod_cadastro`,
        `e`.`COD_CLIENTE` AS `cod_cliente`,
        `c`.`DES_RAZAO_SOCIAL` AS `nom_cadastro`,
        CONCAT(CAST(`e`.`COD_AGENTE` AS CHAR CHARSET UTF8MB4),
                ' - ',
                CONVERT( `b`.`nom_fantasia` USING UTF8MB4)) AS `agente`,
        `d`.`nom_fantasia` AS `nom_cliente`
    FROM
        (((`tbcodigosentregadores` `e`
        JOIN `tbagentes` `b` ON ((`b`.`cod_agente` = `e`.`COD_AGENTE`)))
        JOIN `tbentregadores` `c` ON ((`c`.`COD_CADASTRO` = `e`.`COD_CADASTRO`)))
        JOIN `crm_clientes` `d` ON ((`d`.`cod_cliente` = `e`.`COD_CLIENTE`)))