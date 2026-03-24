--CREATE DATABASE minhaBiblioteca
--CREATE SCHEMA biblioteca

CREATE TABLE biblioteca.livro(
	id_livro SERIAL PRIMARY KEY,
	titulo varchar (40) NOT NULL,
	autor varchar (40) NOT NULL,
	ano_publicacao int NOT NULL,
	genero varchar(20) NOT NULL,
	quantidade_estoque int NOT NULL
);

CREATE TABLE biblioteca.usuario(
	id_usuario SERIAL PRIMARY KEY,
	nome varchar (40) NOT NULL,
	cpf varchar (15) UNIQUE,
	email varchar (40) UNIQUE,
	telefone varchar(20) NOT NULL,
	endereco varchar (40) NOT NULL	
);

	CREATE TYPE status_pedido AS ENUM ('emprestado', 'devolvido')

CREATE TABLE biblioteca.emprestimo(
	id_emprestimo SERIAL PRIMARY KEY,
	id_usuario int REFERENCES biblioteca.usuario(id_usuario),
	id_livro int REFERENCES biblioteca.livro(id_livro),
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,
	status status_pedido			
);

	ALTER TABLE livro 
	ADD COLUMN editora varchar(100);
		
