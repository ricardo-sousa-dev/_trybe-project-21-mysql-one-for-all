-- Crie uma VIEW chamada estatisticas_musicais que exiba três colunas:
-- A primeira coluna deve exibir a quantidade total de canções. Dê a essa coluna o alias "cancoes".
-- A segunda coluna deve exibir a quantidade total de artistas e deverá ter o alias "artistas".
-- A terceira coluna deve exibir a quantidade de álbuns e deverá ter o alias "albuns".         
-- Estatísticas musicais
-- O que será verificado:
-- Será validado se existe uma VIEW chamada estatisticas_musicais que exibe os dados corretos nas colunas cancoes, artistas e albuns".


CREATE VIEW estatisticas_musicais AS
    SELECT 
        COUNT(song_id) AS cancoes,
        (SELECT 
                COUNT(artist_id)
            FROM
                SpotifyClone.artists) AS artistas,
        (SELECT 
                COUNT(album_id)
            FROM
                SpotifyClone.albums) AS albuns
    FROM
        SpotifyClone.songs;
