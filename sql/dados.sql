/* TABELA MATRICULA */
ALTER SEQUENCE matricula_numero_seq RESTART WITH 1; /* Reseta contagem do atributo do tipo Serial*/
INSERT INTO Matricula(data, status) VALUES('2020-12-08 10:42', 'INATIVA');
INSERT INTO Matricula(data, status) VALUES('2021-04-27 14:06', 'TRANCADA');
INSERT INTO Matricula(data, status) VALUES('2022-01-19 15:28', 'ATIVA');
INSERT INTO Matricula(data, status) VALUES('2022-08-25 16:14', 'ATIVA');
INSERT INTO Matricula(data, status) VALUES('2022-12-26 16:46', 'ATIVA');


/* TABELA ALUNO */
INSERT INTO Aluno VALUES('61483982149', 'Diego Melo', '1997-11-04', 1);
INSERT INTO Aluno VALUES('29527295815', 'Clarice Martins', '1996-05-01', 2);
INSERT INTO Aluno VALUES('84582293239', 'João Gabriel Peixoto', '1998-08-15', 3);
INSERT INTO Aluno VALUES('10979101565', 'Thales da Cruz', '1999-06-09', 4);
INSERT INTO Aluno VALUES('11396888390', 'Maite da Paz', '2002-11-11', 5);

/* TABELA VOLUNTARIO */
INSERT INTO Voluntario VALUES('70271551178', 'Luiz Fernando Nascimento', '1988-06-29');
INSERT INTO Voluntario VALUES('03609113669', 'Sofia Souza', '1988-10-25');
INSERT INTO Voluntario VALUES('66395707345', 'Emilly Correia', '1989-05-15');
INSERT INTO Voluntario VALUES('01129317587', 'Maria Alice Azevedo', '1992-09-23');
INSERT INTO Voluntario VALUES('25386829670', 'Kaique da Rosa', '1991-10-31');
INSERT INTO Voluntario VALUES('03629113669', 'Matheus', '1985-10-25');


/* TABELA NIVEL */
INSERT INTO Nivel VALUES('A1', '0-6');
INSERT INTO Nivel VALUES('A2', '1-0');
    
/* TABELA BIBLIOGRAFIA */    
INSERT INTO Bibliografia VALUES('A1', 'Essential Grammar in Use');
INSERT INTO Bibliografia VALUES('A2', 'Speak English like an American');
INSERT INTO Bibliografia VALUES('A2', 'Advanced Grammar in Use');

/* TABELA TURMA */
ALTER SEQUENCE turma_id_seq RESTART WITH 1; /* Reseta contagem do atributo do tipo Serial*/
INSERT INTO Turma(nivel, numero, ano) VALUES('A1', 1, 2020);
INSERT INTO Turma(nivel, numero, ano) VALUES('A1', 2, 2020);
INSERT INTO Turma(nivel, numero, ano) VALUES('A2', 1, 2020);
INSERT INTO Turma(nivel, numero, ano) VALUES('A1', 1, 2021);
INSERT INTO Turma(nivel, numero, ano) VALUES('A2', 1, 2021);

/* TABELA AULA */
INSERT INTO Aula VALUES(1, '2020-01-08', '03609113669', 0.8);
INSERT INTO Aula VALUES(1, '2020-04-13', '03609113669', 1.7);
INSERT INTO Aula VALUES(1, '2020-04-17', '66395707345', 2.0);
INSERT INTO Aula VALUES(1, '2020-08-19', '70271551178', 0.9);
INSERT INTO Aula VALUES(1, '2020-12-24', '01129317587', 1.7);

INSERT INTO Aula VALUES(2, '2020-03-23', '66395707345', 2.0);
INSERT INTO Aula VALUES(2, '2020-08-19', '70271551178', 0.7);
INSERT INTO Aula VALUES(2, '2020-11-06', '03609113669', 1.3);
INSERT INTO Aula VALUES(2, '2020-11-11', '01129317587', 1.7);
INSERT INTO Aula VALUES(2, '2020-11-18', '01129317587', 1.9);

INSERT INTO Aula VALUES(3, '2020-01-03', '66395707345', 1.0);
INSERT INTO Aula VALUES(3, '2020-04-09', '70271551178', 1.9);
INSERT INTO Aula VALUES(3, '2020-06-24', '70271551178', 1.5);
INSERT INTO Aula VALUES(3, '2020-08-11', '01129317587', 1.4);
INSERT INTO Aula VALUES(3, '2020-09-21', '70271551178', 0.7);

INSERT INTO Aula VALUES(4, '2021-01-06', '01129317587', 2.0);
INSERT INTO Aula VALUES(4, '2021-02-15', '03609113669', 1.5);
INSERT INTO Aula VALUES(4, '2021-03-19', '70271551178', 1.6);
INSERT INTO Aula VALUES(4, '2021-06-24', '66395707345', 0.8);
INSERT INTO Aula VALUES(4, '2021-08-12', '25386829670', 1.7);

INSERT INTO Aula VALUES(5, '2021-03-01', '03609113669', 1.5);
INSERT INTO Aula VALUES(5, '2021-03-03', '25386829670', 0.8);
INSERT INTO Aula VALUES(5, '2021-03-11', '70271551178', 0.6);
INSERT INTO Aula VALUES(5, '2021-03-15', '70271551178', 2.0);
INSERT INTO Aula VALUES(5, '2021-11-17', '25386829670', 1.8);

/* TABELA HISTORICO */ 
/* Essa tabela possui uma lógica associada citada na documentação do projeto (caraga media do histórico).
 * Tal lógica seria tratada na aplicação, porém nessas inserções iniciais os valores
 * foram calculados manualmente
 */
INSERT INTO Historico VALUES('61483982149', 1, 87.5, 8.7, 'APROVADO', 'Boa evolução nos conceitos básicos da língua inglesa');
INSERT INTO Historico VALUES('10979101565', 1, null, null, null, null);
INSERT INTO Historico VALUES('11396888390', 1, null, null, null, null);


INSERT INTO Historico VALUES('29527295815', 3, 62, 6.8, 'REPROVADO POR FALTA', 'Poderia ter participado mais das aula');
INSERT INTO Historico VALUES('84582293239', 3, null, null, null, null);

/* TABELA PROVA */
INSERT INTO Prova VALUES(1, 1, 'Vocabulário', '2020-08-19');
INSERT INTO Prova VALUES(1, 2, 'Redação', '2020-12-24');


INSERT INTO Prova VALUES(3, 1, 'Gramática', '2020-08-11');
INSERT INTO Prova VALUES(3, 2, 'Conversação', '2020-09-21');

/* TABELA RESULTADOPROVA */
INSERT INTO ResultadoProva VALUES('61483982149', 1, 1, 8.4);
INSERT INTO ResultadoProva VALUES('61483982149', 1, 2, 9);
INSERT INTO ResultadoProva VALUES('10979101565', 1, 1, 8.9);
INSERT INTO ResultadoProva VALUES('10979101565', 1, 2, 7.7);
INSERT INTO ResultadoProva VALUES('11396888390', 1, 1, 8.3);
INSERT INTO ResultadoProva VALUES('11396888390', 1, 2, 7.9);

INSERT INTO ResultadoProva VALUES('29527295815', 3, 1, 7);
INSERT INTO ResultadoProva VALUES('29527295815', 3, 2, 6.6);
INSERT INTO ResultadoProva VALUES('84582293239', 3, 1, 7.1);
INSERT INTO ResultadoProva VALUES('84582293239', 3, 2, 7.4);

/* TABELA CERTIFICADO */
/* Essa tabela possui uma lógica associada citada na documentação do projeto (caraga horária do certificado).
 * Tal lógica seria tratada na aplicação, porém nessas inserções iniciais os valores
 * foram calculados manualmente
 */
INSERT INTO Certificado VALUES('70271551178', '2021-08-07', 9.9);
INSERT INTO Certificado VALUES('03609113669', '2021-11-17', 6.8);

/* TABELA TRANSACAO */
INSERT INTO Transacao VALUES('2020-05-14', 20000, 'TRANSFERENCIA', 'ENTRADA');
INSERT INTO Transacao VALUES('2020-05-22', 15000, 'DINHEIRO', 'ENTRADA');
INSERT INTO Transacao VALUES('2020-05-23', 35000, null, 'SALDO');
INSERT INTO Transacao VALUES('2020-09-08', 15000, 'TRANSFERENCIA', 'SAIDA');
INSERT INTO Transacao VALUES('2020-09-14', 15000, 'TRANSFERENCIA', 'SAIDA');
INSERT INTO Transacao VALUES('2020-09-15', 5000, null, 'SALDO');

/* TABELA COMPRA */ 
INSERT INTO Compra VALUES('2020-09-08');
INSERT INTO Compra VALUES('2020-09-14');

/* TABELA PROCESSOSELETIVO */
INSERT INTO ProcessoSeletivo VALUES('HV1', 2020, 'FECHADO');
INSERT INTO ProcessoSeletivo VALUES('MT2', 2020, 'FECHADO');
INSERT INTO ProcessoSeletivo VALUES('HV1', 2021, 'ABERTO');
INSERT INTO ProcessoSeletivo VALUES('MT2', 2021, 'ABERTO');

/* TABELA RESULTADO */
ALTER SEQUENCE resultado_id_seq RESTART WITH 1; /* Reseta contagem do atributo do tipo Serial*/
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('HV1', 2020, '70271551178', 82.5, true);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('HV1', 2020, '03609113669', 74.7, false);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('HV1', 2020, '66395707345', 70.2, false);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('HV1', 2020, '01129317587', 77.3, false);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('HV1', 2020, '25386829670', 63.8, false);

INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('MT2', 2020, '01129317587', 80.7, true);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('MT2', 2020, '03609113669', 66.0, false);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('MT2', 2020, '66395707345', 76.4, false);
INSERT INTO Resultado(sigla, ano, voluntario, pontuacao, isAprovado)
    VALUES('MT2', 2020, '25386829670', 71.8, false);

/* TABELA INTERCAMBIO */
INSERT INTO Intercambio VALUES('HARVARD', '0-6', 15000);
INSERT INTO Intercambio VALUES('MIT', '0-6', 15000);

/* TABELA BOLSA */
INSERT INTO Bolsa VALUES('2020-09-08', 'HARVARD', '0-6', 1, 'HV1', 2020);
INSERT INTO Bolsa VALUES('2020-09-14', 'MIT', '0-6', 6, 'MT2', 2020);


