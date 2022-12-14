DROP TABLE T_RHSTU_MEDICO_CONTATO;

CREATE TABLE T_RHSTU_MEDICO_CONTATO(
CD_MEDICO NUMBER,
ID_CONTATO NUMBER(3),
DS_CONATO VARCHAR2(40),
TP_CONTATO VARCHAR2(30)
);

ALTER TABLE T_RHSTU_MEDICO_CONTATO ADD ST_CONTATO CHAR(1);

ALTER TABLE T_RHSTU_MEDICO_CONTATO
ADD CONSTRAINT PK_RHSTU_MEDICO_CONTATO PRIMARY KEY(CD_MEDICO, ID_CONTATO);

ALTER TABLE T_RHSTU_MEDICO_CONTATO
ADD CONSTRAINT FK_RHSTU_MEDICO_CONTATO_MEDICO FOREIGN KEY (CD_MEDICO)
REFERENCES T_RHSTU_MEDICO (CD_MEDICO);

--ALTER TABLE T_RHSTU_MEDICO_CONTATO MODIFY ST_CONTATO VARCHAR2(16);

ALTER TABLE T_RHSTU_MEDICO_CONTATO ADD CONSTRAINT CK_RHSTU_MED_CONTATO_TIPO
CHECK (TP_CONTATO IN ('TELEFONE', 'FIXO', 'TELEFONE CELULAR', 'EMAIL', 
'TELEFONE CONTATO'));

ALTER TABLE T_RHSTU_MEDICO_CONTATO ADD CONSTRAINT CK_RHSTU_MED_CONTATO_STATUS
CHECK (ST_CONTATO IN ('A', 'I'));

ALTER TABLE T_RHSTU_MEDICO_CONTATO
MODIFY TP_CONTATO CONSTRAINT CK_RHSTU_MED_CONTATO_TIPO_NN NOT NULL;

ALTER TABLE T_RHSTU_MEDICO_CONTATO
MODIFY DS_CONATO CONSTRAINT CK_RHSTU_MED_CONTATO_DESCRICAO NOT NULL;

ALTER TABLE T_RHSTU_MEDICO_CONTATO ADD DT_CADASTRO DATE DEFAULT SYSDATE;

ALTER TABLE T_RHSTU_MEDICO ADD CONSTRAINT UK_RHSTU_MEDICO UNIQUE(NR_CRM);

-- COMENTARIOS
COMMENT ON TABLE T_RHSTU_MEDICO_CONTATO IS 
'A teabela de contato do m?dico ir? armazenar informa??es de das pessoas
que podem me dizer onde o m?dico se encontra';

COMMENT ON COLUMN T_RHSTU_MEDICO_CONTATO.DS_CONATO IS 
'A coluna descri??o do contato refere-se ao nome da pessoa que conhece o m?dico
Seu cont?do obrigat?rio e deve ser cadastrado no padr?o InitCap';