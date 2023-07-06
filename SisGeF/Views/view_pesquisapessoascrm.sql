CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_pesquisapessoascrm` AS
    SELECT 
        `a`.`COD_CADASTRO` AS `cod_cadastro`,
        `a`.`DES_RAZAO_SOCIAL` AS `des_razao_social`,
        `a`.`NOM_FANTASIA` AS `nom_fantasia`,
        `a`.`NUM_CNPJ` AS `num_cnpj`,
        `a`.`NUM_IE` AS `num_ie`,
        `a`.`NUM_IM` AS `num_im`,
        `b`.`NUM_TELEFONE` AS `num_telefone`,
        `b`.`DES_EMAIL` AS `des_email`
    FROM
        (`tbcontatosentregadores` `b`
        LEFT JOIN `tbentregadores` `a` ON ((`b`.`COD_ENTREGADOR` = `a`.`COD_CADASTRO`)))