-- Desafio 9
-- Crie uma procedure chamada albuns_do_artista que recebe como parâmetro o nome de uma pessoa artista e em retorno deve exibir as seguintes colunas:
-- O nome da pessoa artista, com o alias "artista".
-- O nome do álbum, com o alias "album".
-- Os resultados devem ser ordenados pelo nome do álbum em ordem alfabética.
-- Confirme a execução correta da procedure, chamando-a e passando o nome igual a "Walter Phoenix". Sua procedure deve retornar o mesmo que o resultado abaixo:
-- CALL albuns_do_artista('Walter Phoenix');
-- O que será verificado:
-- Será validado se a procedure albuns_do_artista retorna a coluna artista contendo o nome da pessoa artista e a coluna album contendo o nome do album.
-- Será validado se as colunas estão ordenadas de forma correta.

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
    SELECT a.artist AS artista, ab.album AS album
    FROM SpotifyClone.artists AS a
    INNER JOIN albums AS ab
    ON ab.artist_id = a.artist_id
    WHERE artist LIKE CONCAT('%', nome, '%');
END $$
DELIMITER ;

-- CALL albuns_do_artista('Walter Phoenix');
