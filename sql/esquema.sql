CREATE TABLE Matricula (
    numero SERIAL,
    data TIMESTAMP,
    status VARCHAR(8),

    CONSTRAINT PK_MATRICULA PRIMARY KEY(numero),
    CONSTRAINT CK_STATUS CHECK(UPPER(status) IN ('ATIVA', 'INATIVA', 'TRANCADA'))
);

CREATE TABLE Aluno (
    cpf CHAR(11),
    nome VARCHAR(30),
    data_nascimento DATE,
    matricula INTEGER NOT NULL,

    CONSTRAINT PK_ALUNO PRIMARY KEY (cpf),
    CONSTRAINT FK_ALUNO FOREIGN KEY (matricula) REFERENCES Matricula(numero) ON DELETE CASCADE
);

CREATE TABLE Voluntario (
    cpf CHAR(11),
    nome VARCHAR(30),
    data_nascimento DATE,

    CONSTRAINT PK_VOLUNTARIO PRIMARY KEY (cpf)
);

CREATE TABLE Nivel (
    nome VARCHAR(15),
    duracao INTERVAL, /* Inserção da forma 'Y-M' -> '1-6' = 1 ano e 6 meses */

    CONSTRAINT PK_NIVEL PRIMARY KEY (NOME)
);

CREATE TABLE Bibliografia (
    nivel VARCHAR(15),
    livro VARCHAR(30),

    CONSTRAINT PK_BIBLIOGRAFIA PRIMARY KEY(nivel, livro),
    CONSTRAINT FK_BIBLIOGRAFIA FOREIGN KEY(nivel) REFERENCES Nivel (nome)
);

CREATE TABLE Turma (
    id SERIAL,
    nivel VARCHAR(15) NOT NULL,
    numero INTEGER,
    ano SMALLINT,

    CONSTRAINT PK_TURMA PRIMARY KEY(id),
    CONSTRAINT UQ_TURMA UNIQUE(nivel, numero, ano),
    CONSTRAINT FK_TURMA FOREIGN KEY(nivel) REFERENCES Nivel (nome)
);

CREATE TABLE Aula (
    id_turma INTEGER,
    data TIMESTAMP,
    instrutor CHAR(11) NOT NULL,
    duracao REAL NOT NULL, /* Número de horas */

    CONSTRAINT PK_AULA PRIMARY KEY(id_turma, data),
    CONSTRAINT FK_AULA1 FOREIGN KEY(id_turma) REFERENCES Turma(id),
    CONSTRAINT FK_AULA2 FOREIGN KEY(instrutor) REFERENCES Voluntario(cpf) ON DELETE CASCADE
);

CREATE TABLE Historico (
    aluno CHAR(11),
    id_turma INTEGER,
    frequencia REAL, /* Porcentagem */
    media REAL,
    status VARCHAR(20),
    feedback TEXT,

    CONSTRAINT PK_HISTORICO PRIMARY KEY(aluno, id_turma),
    CONSTRAINT FK_HISTORICO1 FOREIGN KEY(aluno) REFERENCES Aluno(cpf) ON DELETE CASCADE,
    CONSTRAINT FK_HISTORICO2 FOREIGN KEY(id_turma) REFERENCES Turma(id) ON DELETE CASCADE,
    CONSTRAINT CK_STATUS CHECK(UPPER(status) IN ('APROVADO', 'REPROVADO POR NOTA', 'REPROVADO POR FALTA'))
);

CREATE TABLE Prova (
    id_turma INTEGER,
    numero INTEGER,
    nome VARCHAR(15),
    data DATE,

    CONSTRAINT PK_PROVA PRIMARY KEY(id_turma, numero),
    CONSTRAINT FK_PROVA FOREIGN KEY(id_turma) REFERENCES Turma(id) ON DELETE CASCADE
);

CREATE TABLE ResultadoProva (
    aluno CHAR(11),
    id_turma INTEGER,
    numero INTEGER,
    nota REAL,

    CONSTRAINT PK_RESULTADOPROVA PRIMARY KEY(aluno, id_turma, numero),
    CONSTRAINT FK_RESULTADOPROVA FOREIGN KEY(aluno) REFERENCES Aluno(cpf) ON DELETE CASCADE
);

CREATE TABLE Certificado (
    voluntario CHAR(11),
    data TIMESTAMP,
    carga_horaria DECIMAL, /* Número de horas */

    CONSTRAINT PK_CERTIFICADO PRIMARY KEY(voluntario, data),
    CONSTRAINT FK_CERTIFICADO FOREIGN KEY(voluntario) REFERENCES Voluntario(cpf) ON DELETE CASCADE
);

CREATE TABLE Transacao (
    data TIMESTAMP,
    valor REAL,
    metodo_pagamento VARCHAR(15),
    tipo VARCHAR(7) NOT NULL,

    CONSTRAINT PK_TRASACAO PRIMARY KEY(data),
    CONSTRAINT CK_TIPO CHECK(UPPER(tipo) IN ('ENTRADA', 'SALDO', 'SAIDA'))
);

CREATE TABLE Compra (
    transacao TIMESTAMP,

    CONSTRAINT PK_COMPRA PRIMARY KEY(transacao),
    CONSTRAINT FK_COMPRA FOREIGN KEY(transacao) REFERENCES Transacao(data) ON DELETE CASCADE
);

CREATE TABLE ProcessoSeletivo (
    sigla VARCHAR(7),
    ano SMALLINT,
    status VARCHAR(7),

    CONSTRAINT PK_PROCESSOSELETIVO PRIMARY KEY(sigla, ano),
    CONSTRAINT CK_STATUS CHECK(UPPER(status) IN ('ABERTO', 'FECHADO'))
);

CREATE TABLE Resultado (
    id SERIAL,
    sigla VARCHAR(7),
    ano SMALLINT,
    voluntario VARCHAR(11),
    pontuacao REAL,
    isAprovado BOOLEAN,

    CONSTRAINT PK_RESULTADO PRIMARY KEY(id),
    CONSTRAINT UQ_RESULTADO UNIQUE(sigla, ano, voluntario),
    CONSTRAINT FK_RESULTADO FOREIGN KEY(voluntario) REFERENCES Voluntario(cpf) ON DELETE CASCADE
);

CREATE TABLE Intercambio (
    nome_faculdade VARCHAR(15),
    duracao INTERVAL, /* Inserção da forma 'Y-M' -> '1-6' = 1 ano e 6 meses */
    custo REAL,

    CONSTRAINT PK_INTERCAMBIO PRIMARY KEY(nome_faculdade, duracao)
);

CREATE TABLE Bolsa (
    compra TIMESTAMP,
    nome_faculdade VARCHAR(15),
    duracao INTERVAL,
    id_resultado INTEGER,
    sigla_psel VARCHAR(7),
    ano_psel SMALLINT,

    CONSTRAINT PK_BOLSA PRIMARY KEY(compra, nome_faculdade, duracao),
    CONSTRAINT FK_BOLSA1 FOREIGN KEY(compra) REFERENCES Compra(transacao) ON DELETE CASCADE,
    CONSTRAINT FK_BOLSA2 FOREIGN KEY(nome_faculdade, duracao) REFERENCES Intercambio(nome_faculdade, duracao) ON DELETE CASCADE,
    CONSTRAINT FK_BOLSA3 FOREIGN KEY(id_resultado) REFERENCES Resultado (id) ON DELETE SET NULL,
    CONSTRAINT FK_BOLSA4 FOREIGN KEY(sigla_psel, ano_psel) REFERENCES ProcessoSeletivo (sigla, ano) ON DELETE SET NULL
);