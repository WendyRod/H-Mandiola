-- Generado por Oracle SQL Developer Data Modeler 19.1.0.081.0911
--   en:        2019-06-14 14:26:11 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE easypay (
    num_cuenta         INTEGER NOT NULL,
    codigo_seguridad   INTEGER NOT NULL,
    clave              VARCHAR(15) NOT NULL
);

ALTER TABLE easypay ADD CONSTRAINT easypay_pk PRIMARY KEY ( num_cuenta );

CREATE TABLE Tarjeta_Credito_Debito (
    num_tarjeta   INTEGER NOT NULL,
    mes_exp       INTEGER NOT NULL,
    año_exp       INTEGER NOT NULL,
    cvv           INTEGER NOT NULL,
    monto         MONEY NOT NULL,
    tipo          VARCHAR(2) NOT NULL
);

ALTER TABLE "Tarjeta_Credito/Debito" ADD CONSTRAINT "Tarjeta_Credito/Debito_PK" PRIMARY KEY ( num_tarjeta );

