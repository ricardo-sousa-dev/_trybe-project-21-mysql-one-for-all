-- Crie uma VIEW chamada historico_reproducao_usuarios. Essa VIEW deverá ter apenas duas colunas:
-- A primeira coluna deve possuir o alias "usuario" e exibir o nome da pessoa usuária.
-- A segunda coluna deve possuir o alias "nome" e exibir o nome da canção ouvida pela pessoa com base no seu histórico de reprodução.
-- Os resultados devem estar ordenados por nome da pessoa usuária em ordem alfabética e em caso de empate no nome os resultados devem ser ordenados pelo nome da canção em ordem alfabética.
-- Histórico de reprodução das pessoas usuárias
-- O que será verificado:
-- Será validado se existe uma VIEW chamada historico_reproducao_usuarios que exibe os dados corretos nas colunas usuario e nome".
-- Será validado se as colunas estão ordenadas de forma correta.

CREATE VIEW historico_reproducao_usuarios AS
SELECT t1.username AS usuario, t3.song_name AS nome FROM SpotifyClone.user AS t1
INNER JOIN SpotifyClone.reproductionHistory AS t2
ON t1.user_id = t2.user_id
INNER JOIN SpotifyClone.songs AS t3
ON t3.song_id = t2.song_id
ORDER BY 1, 2;
