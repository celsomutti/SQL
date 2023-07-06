CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_register_vehicles` AS
    SELECT 
        `tbentregadores`.`COD_CADASTRO` AS `cod_cadastro`,
        `tbentregadores`.`NUM_CNPJ` AS `num_cnpl`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `des_razao_social`,
        `tbentregadores`.`NOM_FANTASIA` AS `nom_fantasia`,
        `tbentregadores`.`NUM_IE` AS `num_ie`,
        `tbentregadores`.`NUM_CNH` AS `asnum_cnh`,
        `tbentregadores`.`NUM_REGISTRO_CNH` AS `num_registro_cnh`,
        `tbentregadores`.`DES_CATEGORIA_CNH` AS `des_categoria_cnh`,
        `tbentregadores`.`DAT_VALIDADE_CNH` AS `dat_validade_cnh`,
        `tbentregadores`.`COD_STATUS` AS `cod_status`,
        `tbentregadores`.`DES_TIPO_CONTA` AS `des_tipo_conta`,
        `tbentregadores`.`COD_BANCO` AS `cod_banco`,
        `tbentregadores`.`COD_AGENCIA` AS `cod_agencia`,
        `tbentregadores`.`NUM_CONTA` AS `num_conta`,
        `tbentregadores`.`NOM_FAVORECIDO` AS `nom_favorecido`,
        `tbentregadores`.`NUM_CPF_CNPJ_FAVORECIDO` AS `num_cpf_cnpj_favorecido`,
        `tbentregadores`.`DES_FORMA_PAGAMENTO` AS `des_forma_pagamento`,
        `tbentregadores`.`DOM_GV` AS `dom_gv`,
        `tbentregadores`.`DAT_GV` AS `dat_gv`,
        `tbentregadores`.`NOM_RAZAO_MEI` AS `nom_razao_mei`,
        `tbentregadores`.`NOM_FANTASIA_MEI` AS `nom_fantaia_mei`,
        `tbentregadores`.`NUM_CNPJ_MEI` AS `num_cnpj_mei`,
        `tbentregadores`.`COD_CNH` AS `cod_cnh`,
        `tbveiculos`.`DES_MODELO` AS `des_modelo`,
        `tbveiculos`.`DES_PLACA` AS `des_placa`,
        `tbveiculos`.`NUM_RENAVAN` AS `num_renavan`,
        `tbveiculos`.`ANO_EXERCICIO_CLRV` AS `ano_exercicio_clrv`
    FROM
        (`tbentregadores`
        LEFT JOIN `tbveiculos` ON ((`tbveiculos`.`COD_ENTREGADOR` = `tbentregadores`.`COD_CADASTRO`)))