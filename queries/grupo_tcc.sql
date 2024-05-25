
CREATE TYPE tcc_group AS (
    codigo_prof INTEGER, 
    nome_prof VARCHAR(255),
	nome_aluno VARCHAR(255),
    id_tcc INTEGER,
    ra INTEGER
);

CREATE FUNCTION grupo_tcc(
    IN tcc INTEGER
)
RETURNS SETOF tcc_group
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        professor.codigo_prof, 
        professor.nome_prof, 
		aluno.nome_aluno,  
        aluno.id_tcc, 
        aluno.ra
    FROM 
        aluno
    INNER JOIN professor ON professor.id_tcc = aluno.id_tcc
    WHERE 
        aluno.id_tcc = tcc;
END;
$$;
