CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_baseslista` AS
    SELECT 
        `tbagentes`.`cod_agente` AS `cod_agente`,
        `tbagentes`.`des_razao_social` AS `des_razao_social`,
        `tbagentes`.`nom_fantasia` AS `nom_fantasia`,
        `tbagentes`.`num_cnpj` AS `num_cnpj`,
        `tbagentes`.`num_ie` AS `num_ie`,
        `tbagentes`.`num_im` AS `num_im`
    FROM
        `tbagentes`