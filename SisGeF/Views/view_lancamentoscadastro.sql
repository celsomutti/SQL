CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `view_lancamentoscadastro` AS
    SELECT 
        `tblancamentos`.`COD_LANCAMENTO` AS `COD_LANCAMENTO`,
        `tblancamentos`.`DES_LANCAMENTO` AS `DES_LANCAMENTO`,
        `tblancamentos`.`DAT_LANCAMENTO` AS `DAT_LANCAMENTO`,
        `tblancamentos`.`COD_CADASTRO` AS `COD_CADASTRO`,
        `tbentregadores`.`DES_RAZAO_SOCIAL` AS `NOM_CADASTRO`,
        `tblancamentos`.`COD_ENTREGADOR` AS `COD_ENTREGADOR`,
        `tbcodigosentregadores`.`NOM_FANTASIA` AS `NOM_ENTREGADOR`,
        `tblancamentos`.`DES_TIPO` AS `DES_TIPO`,
        `tblancamentos`.`VAL_LANCAMENTO` AS `VAL_LANCAMENTO`,
        `tblancamentos`.`DOM_DESCONTO` AS `DOM_DESCONTO`,
        `tblancamentos`.`DAT_DESCONTO` AS `DAT_DESCONTO`,
        `tblancamentos`.`NUM_EXTRATO` AS `NUM_EXTRATO`,
        `tblancamentos`.`DOM_PERSISTIR` AS `DOM_PERSISTIR`,
        `tblancamentos`.`COD_REFERENCIA` AS `COD_REFERENCIA`,
        `tblancamentos`.`DAT_CADASTRO` AS `DAT_CADASTRO`,
        `tblancamentos`.`NOM_USUARIO` AS `NOM_USUARIO`
    FROM
        ((`tblancamentos`
        LEFT JOIN `tbentregadores` ON ((`tbentregadores`.`COD_CADASTRO` = `tblancamentos`.`COD_CADASTRO`)))
        LEFT JOIN `tbcodigosentregadores` ON ((`tbcodigosentregadores`.`COD_ENTREGADOR` = `tblancamentos`.`COD_ENTREGADOR`)))