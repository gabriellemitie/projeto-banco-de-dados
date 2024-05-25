CREATE FUNCTION lista_chefes()
RETURNS TABLE(nome_prof VARCHAR(255), codigo_prof INTEGER, nome_dep VARCHAR(255))
AS $$
BEGIN 
    RETURN QUERY 
    SELECT 
        professor.nome_prof,
        professor.codigo_prof,
        professor_departamento.nome_dep
    FROM
        professor
    INNER JOIN professor_departamento ON professor.codigo_prof = professor_departamento.codigo_prof
    WHERE professor.chefe_dep = TRUE;
END;
$$ LANGUAGE plpgsql;
