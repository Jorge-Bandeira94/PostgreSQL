CREATE TABLE "categoria" (
  "id" INT PRIMARY KEY,
  "genero" VARCHAR NOT NULL
);

CREATE TABLE "filmes" (
  "id" INT PRIMARY KEY,
  "nome" VARCHAR NOT NULL,
  "id_categoria" INT NOT NULL
);

CREATE TABLE "dvd" (
  "id" INT PRIMARY KEY,
  "id_filme" INT NOT NULL,
  "volumes_dvd" INT NOT NULL,
  "valor" DECIMAL NOT NULL
);

CREATE TABLE "atores" (
  "id" INT PRIMARY KEY,
  "nome" VARCHAR NOT NULL
);

CREATE TABLE "atores_filme" (
  "id" INT PRIMARY KEY,
  "id_filme" INT NOT NULL,
  "id_ator" INT NOT NULL,
  "personagem" VARCHAR NOT NULL
);

CREATE TABLE "cliente" (
  "id" INT PRIMARY KEY,
  "nome" VARCHAR NOT NULL,
  "telefone" VARCHAR NOT NULL,
  "endereco" VARCHAR NOT NULL
);

CREATE TABLE "alugado_filme" (
  "id" INT PRIMARY KEY,
  "id_cliente" INT NOT NULL,
  "data" DATETEMI NOT NULL
);

CREATE TABLE "emprestimo_total" (
  "id" INT PRIMARY KEY,
  "id_filme" INT NOT NULL,
  "id_alugado" INT NOT NULL
);

CREATE TABLE "devolucoes" (
  "id" INT PRIMARY KEY,
  "id_alugado_filme" INT NOT NULL,
  "data" DATETIME NOT NULL
);

CREATE TABLE "devolucao_total" (
  "id" INT PRIMARY KEY,
  "id_emprestimo_total" INT,
  "id_alugado_filme" INT
);

ALTER TABLE "filmes" ADD FOREIGN KEY ("id_categoria") REFERENCES "categoria" ("id");

ALTER TABLE "dvd" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "atores_filme" ADD FOREIGN KEY ("id_ator") REFERENCES "atores" ("id");

ALTER TABLE "alugado_filme" ADD FOREIGN KEY ("id_cliente") REFERENCES "cliente" ("id");

ALTER TABLE "emprestimo_total" ADD FOREIGN KEY ("id_filme") REFERENCES "filmes" ("id");

ALTER TABLE "emprestimo_total" ADD FOREIGN KEY ("id_alugado") REFERENCES "alugado_filme" ("id");

ALTER TABLE "devolucoes" ADD FOREIGN KEY ("id_alugado_filme") REFERENCES "alugado_filme" ("id");

ALTER TABLE "devolucao_total" ADD FOREIGN KEY ("id_emprestimo_total") REFERENCES "emprestimo_total" ("id");

ALTER TABLE "devolucao_total" ADD FOREIGN KEY ("id_alugado_filme") REFERENCES "alugado_filme" ("id");
