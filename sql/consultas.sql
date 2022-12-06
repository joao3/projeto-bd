/* Seleciona as doações de maior valor */
SELECT
    *
FROM
    transacao
WHERE
        tipo = 'ENTRADA'
    AND valor = (
        SELECT
            MAX(valor)
        FROM
            transacao
        WHERE
            tipo = 'ENTRADA'
    );

/* Seleciona todos os voluntários e os intercãmbios em que foi aprovado. */
SELECT
    v.cpf,
    v.nome,
    i.nome_faculdade,
    i.duracao
FROM
         resultado r
    JOIN bolsa       b ON r.id = b.id_resultado
                    AND r.isaprovado = true
    JOIN intercambio i ON b.nome_faculdade = i.nome_faculdade
                          AND b.duracao = i.duracao
    RIGHT JOIN voluntario  v ON v.cpf = r.voluntario;

/* Seleciona cpf e nome dos voluntários que deram aula para todas as turmas cadastradas (e que tiveram pelo menos uma aula dada). */
SELECT
    v.cpf,
    v.nome
FROM
    voluntario v
WHERE
    NOT EXISTS (
        (
            SELECT DISTINCT
                id_turma
            FROM
                aula
        )
        EXCEPT
        (
            SELECT
                a.id_turma
            FROM
                aula a
            WHERE
                a.instrutor = v.cpf
        )
    );


/* Seleciona cpf, nome, número de aulas dadas e carga horária de cada instrutor. */
SELECT
    v.cpf,
    v.nome,
	COUNT(a.data) AS nmr_aulas_dadas,
	SUM(a.duracao) AS carga_horaria
FROM
    voluntario v
    LEFT JOIN aula       a ON v.cpf = a.instrutor
GROUP BY
    v.cpf,
    v.nome
ORDER BY
    COUNT(a.data), SUM(a.duracao);

/* Para cada prova, seleciona cpf, nome e nota dos alunos que obtiveram uma nota maior ou igual que a média. */
SELECT
	a.cpf,
    a.nome,
    id_turma,
    numero,
    r.nota
FROM
         resultadoprova r
    JOIN aluno a ON a.cpf = r.aluno
WHERE
    r.nota >= (
        SELECT
            AVG(nota)
        FROM
            resultadoprova
        WHERE
                id_turma = r.id_turma
            AND numero = r.numero
    )
GROUP BY
    id_turma,
    numero,
    a.cpf,
    a.nome,
    r.nota
ORDER BY
    id_turma;

