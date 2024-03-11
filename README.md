Login:
Usuario: ADMINISTRADOR
Senha: 123456
![image](https://github.com/klauberAguiar/Teste-Khipo/assets/108275217/133edce8-d8fb-4c00-89d1-375cdec7d27e)

Tela de gerenciamento de produtos: 
![image](https://github.com/klauberAguiar/Teste-Khipo/assets/108275217/6a53d9ff-efbb-4d06-8cbb-59f7843d9d6c)

Tela de gerenciamento de estoque:
![image](https://github.com/klauberAguiar/Teste-Khipo/assets/108275217/0ba3466b-6a26-466c-b8a3-8eadd881b158)

Log do test: 
![image](https://github.com/klauberAguiar/Teste-Khipo/assets/108275217/54f98f02-c435-4e6f-a9ed-c583e28bd240)

Banco de dados:

CREATE TABLE CATEGORIAS (
	ID INTEGER NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	CONSTRAINT INTEG_15 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX RDB$PRIMARY7 ON CATEGORIAS (ID);


CREATE TABLE PRODUTOS (
	ID INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	NOME VARCHAR(100) NOT NULL,
	PRECO DECIMAL(10,2) NOT NULL,
	QUANTIDADEEMESTOQUE INTEGER NOT NULL,
	CATEGORIAID INTEGER,
	CONSTRAINT INTEG_23 PRIMARY KEY (ID)
);
CREATE UNIQUE INDEX RDB$PRIMARY10 ON PRODUTOS (ID);

CREATE TABLE USUARIOS (
	ID INTEGER NOT NULL,
	NOME VARCHAR(100),
	EMAIL VARCHAR(100) NOT NULL,
	SENHA VARCHAR(255) NOT NULL,
	DATA_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	ULTIMO_ACESSO TIMESTAMP,
	CONSTRAINT INTEG_5 PRIMARY KEY (ID),
	CONSTRAINT INTEG_6 UNIQUE (EMAIL)
);
CREATE UNIQUE INDEX "RDB$3" ON USUARIOS (EMAIL);
CREATE UNIQUE INDEX RDB$PRIMARY2 ON USUARIOS (ID);


CREATE TABLE MOVIMENTACOES_ESTOQUE (
	ID INTEGER GENERATED BY DEFAULT AS IDENTITY NOT NULL,
	PRODUTO_ID INTEGER NOT NULL,
	QUANTIDADE INTEGER NOT NULL,
	TIPO_MOVIMENTACAO VARCHAR(10) NOT NULL,
	DATA_MOVIMENTACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT INTEG_31 PRIMARY KEY (ID),
	CONSTRAINT FK_PRODUTO_ID FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS(ID)
);
CREATE INDEX FK_PRODUTO_ID ON MOVIMENTACOES_ESTOQUE (PRODUTO_ID);
CREATE UNIQUE INDEX RDB$PRIMARY11 ON MOVIMENTACOES_ESTOQUE (ID);
