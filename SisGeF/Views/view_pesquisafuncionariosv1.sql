CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_pesquisafuncionariosv1` AS
    SELECT 
        `tbentregadores`.`COD_CADASTRO` AS `COD_CADASTRO`,
        `tbentregadores`.`DOM_FUNCIONARIO` AS `DOM_FUNCIONARIO`,
        `tbentregadores`.`NUM_CNPJ` AS `NUM_CNPJ`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `DES_RAZAO_SOCIAL`,
        `tbentregadores`.`NOM_FANTASIA` AS `NOM_FANTASIA`,
        `tbentregadores`.`NUM_IE` AS `NUM_IE`,
        `tbentregadores`.`NUM_IEST` AS `NUM_IEST`,
        `crm_funcoes_rh`.`des_funcao` AS `des_funcao`,
        `tbentregadores`.`NUM_CNH` AS `NUM_CNH`,
        `tbentregadores`.`NUM_REGISTRO_CNH` AS `NUM_REGISTRO_CNH`,
        IF((`tbentregadores`.`COD_STATUS` < 1),
            'ATIVO',
            'INATIVO') AS `DES_STATUS`
    FROM
        (`tbentregadores`
        LEFT JOIN `crm_funcoes_rh` ON ((`crm_funcoes_rh`.`id_funcao` = `tbentregadores`.`COD_CRT`)))
    WHERE
        (`tbentregadores`.`DOM_FUNCIONARIO` = 'F')