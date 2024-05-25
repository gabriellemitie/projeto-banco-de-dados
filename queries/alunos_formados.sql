CREATE TYPE formados_ AS (
	nome_aluno VARCHAR(255),
    ra INTEGER,
	id_matriz INTEGER, 
	id_curso INTEGER,
	nome_curso VARCHAR(255)
);

CREATE FUNCTION alunos_formados(
    IN semestre INTEGER, ano INTEGER
)
RETURNS SETOF formados_
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT 
		aluno.nome_aluno,   
        aluno.ra,
		matrizcurricular.id_matriz,
		curso.id_curso,
		curso.nome_curso
    FROM aluno
    JOIN formados ON formados.ra = aluno.ra
	JOIN matrizcurricular ON matrizcurricular.id_matriz = formados.id_matriz
	JOIN curso ON curso.id_curso = matrizcurricular.id_curso
	
    WHERE 
        matrizcurricular.ano_aprovado = ano AND matrizcurricular.semestre_aprovado = semestre; 
END;
$$;
