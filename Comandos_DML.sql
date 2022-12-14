INSERT INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO)
VALUES (1, 'Intelig?ncia Digital', 'ID');

INSERT INTO T_SIP_DEPTO(CD_DEPTO, NM_DEPTO, SG_DEPTO)
VALUES (2, 'Financeiro', 'FIN');

SELECT * FROM T_SIP_DEPTO;

--
-- Insert posicional
--
INSERT INTO T_SIP_DEPTO
VALUES (1, 'Financeiro', 'FIN');

COMMIT;

ROLLBACK;


ALTER TABLE T_SIP_DEPTO ADD ST_DEPTO CHAR(1);
UPDATE T_SIP_DEPTO SET ST_DEPTO = 'A';
ALTER TABLE T_SIP_DEPTO MODIFY ( ST_DEPTO CONSTRAINT CK_SIP_DEPTO_ST_DEPTO_NN NOT NULL);
-- Sempre ocorre um comando COMMIT ao utilizar comandos DDL, por exemplo o ALTER TABLE
SELECT * FROM T_SIP_DEPTO;


--
-- INSERT ALL
--
INSERT ALL
    INTO T_SIP_DEPTO (CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO) VALUES (4, 'Contas a pagar', 'CTP', 'A')
    INTO T_SIP_DEPTO (CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO) VALUES (5, 'RH', 'DRH', 'A')
    INTO T_SIP_DEPTO (CD_DEPTO, NM_DEPTO, SG_DEPTO, ST_DEPTO) VALUES (6, 'Tesouraria', 'DTE', 'A')
SELECT * FROM dual;

COMMIT;

SELECT * FROM T_SIP_DEPTO;


INSERT INTO T_SIP_DEPTO
VALUES (7, 'Planejamento Estrat?gico Organizacional Executivo', 'PEO', 'A');
-- ERROR REPORT -
-- ORA-12899: value too large for column "RM93627"."T_SIP_DEPTO"."NM_DEPTO" (actual: 50,)


-- || CONCATENA??O
UPDATE T_SIP_DEPTO SET ST_DEPTO = "I", NM_DEPTO = NM_DEPTO || ' * Inativo'
WHERE CD_DEPTO = 5;


--
-- delete
--
DELETE FROM T_SIP_DEPTO WHERE CD_DEPTO = 4;
DELETE FROM T_SIP_DEPTO WHERE SG_DEPTO = 'DTE';

-- delete multiplo
DELETE FROM T_SIP_DEPTO WHERE SG_DEPTO IN ('DTE', 'DRH');
DELETE FROM T_SIP_DEPTO WHERE SG_DEPTO = 'DTE' OR SG_DEPTO = 'DRH';
DELETE FROM T_SIP_DEPTO WHERE CD_DEPTO = 100;


INSERT INTO T_SIP_CIDADE (CD_CIDADE, CD_ESTADO, NM_CIDADE)
VALUES (1, 1, 'Arraial DAjuda');
-- ERROR REPORT:
-- ORA-02291: integrity constraint (RM93627.FK_SIP_ESTADO_CIDADE) violated - parent key not found


-- INSERT atrav?s de hierarquia
INSERT ALL
   INTO T_SIP_ESTADO (CD_ESTADO, NM_ESTADO, SG_ESTADO) VALUES (1, 'Bahia', 'BA')
   INTO T_SIP_ESTADO (CD_CIDADE, CD_ESTADO, NM_CIDADE) VALUES (1, 1, 'Arraial DAjuda')
SELECT * FROM dual;

COMMIT;

SELECT * FROM T_SIP_ESTADO;
SELECT * FROM T_SIP_CIDADE;

DELETE FROM T_SIP_ESTADO;


-- SYSDATE
SELECT SYSDATE, USER FROM DUAL;

ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy' hh24:mi:ss';

SELECT SYSDATE, USER FROM DUAL;

ALTER TABLE T_SIP_PROJETO RENAME COLUMN DT_INCIIO TO DT_INICIO;

INSERT INTO T_SIP_PROJETO(CD_PROJETO, NM_PROJETO, DT_INICIO)
VALUES (1, 'App no metaverso' TO_DATE('19/09/2022', 'DD/MM/YYYY'));

SELECT * FROM T_SIP_PROJETO; 

--
-- Select com || para adicionar string no select
--
SELECT 'O depto ' || cd_depto || ' tem o seu nome ' || nm_depto from T_SIP_DEPTO;
