CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_register_contracted` AS
    SELECT 
        `tbentregadores`.`COD_CADASTRO` AS `cod_cadastro`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `des_razao_social`,
        `tbentregadores`.`NOM_FANTASIA` AS `nom_fantasia`,
        `tbentregadores`.`NUM_CNPJ` AS `num_cnpj`,
        `tbentregadores`.`NUM_IE` AS `num_ie`,
        `tbentregadores`.`NOM_FAVORECIDO` AS `nom_favorecido`,
        `tbentregadores`.`NUM_CPF_CNPJ_FAVORECIDO` AS `num_cpf_cnpj_favorecido`,
        `tbentregadores`.`NOM_RAZAO_MEI` AS `nom_razao_mei`,
        `tbentregadores`.`NOM_FANTASIA_MEI` AS `nom_fantasia_mei`,
        `tbentregadores`.`NUM_CNPJ_MEI` AS `num_cnpj_mei`,
        `tbveiculos`.`DES_PLACA` AS `des_placa`,
        `tbveiculos`.`DES_MODELO` AS `des_modelo`,
        `tbveiculos`.`NUM_RENAVAN` AS `num_renavan`,
        IF((`tbveiculos`.`ANO_EXERCICIO_CLRV` <> ''),
            CAST(`tbveiculos`.`ANO_EXERCICIO_CLRV` AS UNSIGNED),
            0) AS `ano_exercicio_clrv`,
        `tbentregadores`.`DES_FORMA_PAGAMENTO` AS `des_forma_pagamento`,
        `tbentregadores`.`DES_TIPO_CONTA` AS `des_tipo_conta`,
        `tbentregadores`.`COD_BANCO` AS `cod_banco`,
        `tbbancos`.`nom_banco` AS `nom_banco`,
        `tbentregadores`.`COD_AGENCIA` AS `cod_agencia`,
        `tbentregadores`.`NUM_CONTA` AS `num_conta`,
        `tbentregadores`.`NUM_CNH` AS `num_cnh`,
        `tbentregadores`.`NUM_REGISTRO_CNH` AS `num_registro_cnh`,
        `tbentregadores`.`DES_CATEGORIA_CNH` AS `des_categoria_cnh`,
        `tbentregadores`.`DAT_VALIDADE_CNH` AS `dat_validade_cnh`,
        `tbentregadores`.`COD_CNH` AS `cod_cnh`,
        `tbentregadores`.`DAT_GV` AS `dat_gv`,
        `tbentregadores`.`COD_STATUS` AS `cod_status`,
        CONCAT(CAST(`tbagentes`.`cod_agente` AS CHAR CHARSET UTF8MB4),
                ' - ',
                CONVERT( `tbagentes`.`nom_fantasia` USING UTF8MB4)) AS `nom_base`,
        `tbcodigosentregadores`.`COD_ENTREGADOR` AS `cod_entregador`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `nom_entregador`
    FROM
        ((((`tbentregadores`
        LEFT JOIN `tbbancos` ON ((`tbbancos`.`cod_banco` = `tbentregadores`.`COD_BANCO`)))
        LEFT JOIN `tbveiculos` ON ((`tbveiculos`.`COD_ENTREGADOR` = `tbentregadores`.`COD_CADASTRO`)))
        LEFT JOIN `tbcodigosentregadores` ON ((`tbcodigosentregadores`.`COD_CADASTRO` = `tbentregadores`.`COD_CADASTRO`)))
        LEFT JOIN `tbagentes` ON ((`tbagentes`.`cod_agente` = `tbcodigosentregadores`.`COD_AGENTE`)))