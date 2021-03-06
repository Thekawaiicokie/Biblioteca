DROP PROCEDURE IF EXISTS sp_insertar_modificar_autor;
DELIMITER $
CREATE PROCEDURE sp_insertar_modificar_autor
(
    _id_autor INT UNSIGNED,
    _nombre VARCHAR(30),
    _apellido VARCHAR(30),
    _fecha_nacimiento DATE
)
PROCEDIMIENTO:BEGIN
IF
(
    (
        SELECT
            COUNT(*)
        FROM
            autor
        WHERE
            id_autor = _id_autor
    ) = 0
) THEN
    INSERT INTO
        autor
        (
            nombre,
            apellido,
            fecha_nacimiento
        )
    VALUES
        (
            _nombre,
            _apellido,
            _fecha_nacimiento
        );
ELSE
    UPDATE
        autor
    SET
        nombre = _nombre,
        apellido = _apellido,
        fecha_nacimiento = _fecha_nacimiento
    WHERE
        id_autor = _id_autor;
END IF;
END $
DELIMITER ;
