-- Crie um banco com o nome de SpotifyClone.
-- Providencie as queries necessárias para criar tabelas normalizadas que atendam aos requisitos descritos na seção anterior;
-- Providencie as queries necessárias para popular as tabelas de acordo com os dados listados na seção anterior;
-- Crie um arquivo de configurações desafio1.json, que mapeará em qual tabela e coluna se encontram as informações necessárias para a avaliação automatizada deste desafio. As configurações devem possuir o seguinte formato:

-- {
--   "coluna_usuario": "nome-da-coluna",
--   "tabela_que_contem_usuario": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_plano": "nome-da-coluna",
--   "tabela_que_contem_plano": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_historico_de_reproducoes": "nome-da-coluna",
--   "tabela_que_contem_historico_de_reproducoes": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_seguindo_artistas": "nome-da-coluna",
--   "tabela_que_contem_seguindo_artistas": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_artista": "nome-da-coluna",
--   "tabela_que_contem_artista": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_album": "nome-da-coluna",
--   "tabela_que_contem_album": "nome-da-tabela-que-armazena-a-coluna",
--   "coluna_cancoes": "nome-da-coluna",
--   "tabela_que_contem_cancoes": "nome-da-tabela-que-armazena-a-coluna"
-- }
-- Essa configuração deve ser feita baseada no seu banco de dados após a normalização. Ou seja, se você criou uma tabela chamada users que possui a coluna name, você substituiria "coluna_usuario" e "tabela_que_contem_usuario" da seguinte forma:

-- {
--   "coluna_usuario": "name",
--   "tabela_que_contem_usuario": "users",
--   ...
-- }
-- Salve as queries criadas no arquivo desafio1.sql. Seu código deverá ser similar ao seguinte:
-- DROP DATABASE IF EXISTS SpotifyClone;

-- CREATE DATABASE SpotifyClone;

-- USE SpotifyClone;

-- CREATE TABLE tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;

-- CREATE TABLE tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
--   ('exemplo de dados 2', 'exemplo de dados Y');
-- O que será verificado:
-- Será validado se os planos estão na tabela normalizada.
-- Será validado se o histórico de reprodução está na tabela normalizada.
-- Será validado se as informações sobre pessoas seguindo artistas estão na tabela normalizada.
-- Será validado se os álbuns estão na tabela normalizada.
-- Será validado se os canções estão na tabela normalizada.
-- Será validado se as informações sobre pessoas usuárias estão na tabela normalizada.
-- Será validado se as informações sobre pessoas artistas estão na tabela normalizada.
-- ⚠️ Note que uma vez executado um teste, a sua base de dados SpotifyClone será dropada. Logo, se atente a salvar seu progresso nos arquivos de desafio! ⚠️


DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plan(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(255),
  price DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

INSERT INTO
  plan (plan_id, plan_name, price)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99);

CREATE TABLE artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist VARCHAR(255) NOT NULL
) engine = InnoDB;

INSERT INTO
  artists (artist_id, artist)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');
  
CREATE TABLE user(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  userName VARCHAR(255) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
) engine = InnoDB;

INSERT INTO
  user (userName, age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
  
CREATE TABLE follow_artists (
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
)  ENGINE=INNODB;

INSERT INTO
  follow_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);
  
CREATE TABLE albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(255) NOT NULL,
  artist_id INT NOT NULL,
   FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

INSERT INTO
  albums (album, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(255) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

INSERT INTO
  songs (song_id, song_name, album_id)
VALUES
	(1, 'Soul For Us', 1),
    (2, 'Reflections Of Magic', 1),
    (3, 'Dance With Her Own', 1),
    (4, 'Troubles Of My Inner Fire', 2),
    (5, 'Time Fireworks', 2),
    (6, 'Magic Circus', 3),
    (7, 'Honey, So Do I', 3),
    (8, "Sweetie, Let's Go Wild", 3),
    (9, 'She Knows', 3),
    (10, 'Fantasy For Me', 4),
    (11, 'Celebration Of More', 4),
    (12, 'Rock His Everything', 4),
    (13, 'Home Forever', 4),
    (14, 'Diamond Power', 4),
    (15, "Honey, Let's Be Silly", 4),
    (16, 'Thang Of Thunder', 5),
    (17, 'Words Of Her Life', 5),
    (18, 'Without My Streets', 5);

CREATE TABLE reproductionHistory (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id , song_id),
    FOREIGN KEY (user_id)
        REFERENCES user (user_id),
    FOREIGN KEY (song_id)
        REFERENCES songs (song_id)
)  ENGINE=INNODB;

INSERT INTO
  reproductionHistory (song_id, user_id)
VALUES
  (1, 1),
  (6, 1),
  (14, 1),
  (16, 1),
  (13, 2),
  (17, 2),
  (2, 2),
  (15, 2),
  (4, 3),
  (16, 3),
  (6, 3),
  (3, 4),
  (18, 4),
  (11, 4);
  