CREATE TYPE historico_escolar AS (
    codigo_disc INTEGER, 
    nome_disc VARCHAR(255),
    semestre_cursado INTEGER,
    ano_cursado INTEGER, 
    nota NUMERIC,
    nome_aluno VARCHAR(255),
    ra INTEGER
);

CREATE OR REPLACE FUNCTION obter_historico_esc(
    IN ra_aluno INTEGER
)
RETURNS SETOF historico_escolar
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        histesc.codigo_disc, 
        disciplina.nome_disc, 
        histesc.semestre_cursado, 
        histesc.ano_cursado, 
        histesc.nota, 
        aluno.nome_aluno, 
        aluno.ra
    FROM 
        histesc
    INNER JOIN aluno ON histesc.ra = aluno.ra
    INNER JOIN disciplina ON histesc.codigo_disc = disciplina.codigo_disc 
    WHERE 
        aluno.ra = ra_aluno;
END;
$$;
