CREATE TYPE historico_professor AS (
    id_curso INTEGER, 
    nome_prof VARCHAR(255),
	nome_disc VARCHAR(255),
    semestre_disc INTEGER,
    ano_disc INTEGER, 
	codigo_prof INTEGER
);

CREATE FUNCTION obter_historico_prof(
    IN nome_professor VARCHAR(255)
)
RETURNS SETOF historico_professor
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        professor.id_curso, 
        professor.nome_prof, 
        disciplina.nome_disc, 
        disciplina.semestre_disc,  
        disciplina.ano_disc, 
        professor.codigo_prof
    FROM 
        disciplina
    INNER JOIN professor ON disciplina.codigo_prof = professor.codigo_prof

    WHERE 
        professor.nome_prof = nome_professor;
END;
$$;
