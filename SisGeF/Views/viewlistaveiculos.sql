CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `viewlistaveiculos` AS
    SELECT 
        `tbveiculos`.`COD_VEICULO` AS `COD_VEICULO`,
        `tbveiculos`.`NUM_CNPJ` AS `NUM_CNPJ`,
        `tbveiculos`.`NOM_PROPRIETARIO` AS `NOM_PROPRIETARIO`,
        `tbveiculos`.`NUM_RG` AS `NUM_RG`,
        `tbveiculos`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `DES_RAZAO_SOCIAL`,
        `tbveiculos`.`DES_MARCA` AS `DES_MARCA`,
        `tbveiculos`.`DES_MODELO` AS `DES_MODELO`,
        `tbveiculos`.`DES_PLACA` AS `DES_PLACA`,
        `tbveiculos`.`DES_TIPO` AS `DES_TIPO`,
        `tbveiculos`.`NUM_CHASSIS` AS `NUM_CHASSIS`,
        `tbveiculos`.`DES_ANO` AS `DES_ANO`,
        `tbveiculos`.`DES_COR` AS `DES_COR`,
        `tbveiculos`.`NUM_RENAVAN` AS `NUM_RENAVAN`,
        `tbveiculos`.`ANO_EXERCICIO_CLRV` AS `ANO_EXERCICIO_CLRV`
    FROM
        (`tbveiculos`
        LEFT JOIN `tbentregadores` ON ((`tbveiculos`.`COD_ENTREGADOR` = `tbentregadores`.`COD_CADASTRO`)))