# 📚 Projeto: Banco de Dados - Biblioteca

## 📌 Descrição

Este projeto tem como objetivo a criação de um banco de dados relacional para um sistema de biblioteca, utilizando a linguagem SQL (DDL - Data Definition Language).

Foram desenvolvidas estruturas fundamentais para o funcionamento do sistema, incluindo tabelas para armazenamento de livros, usuários e controle de empréstimos.

---

## 🛠️ Tecnologias Utilizadas

* SQL (PostgreSQL)
* pgAdmin (para gerenciamento do banco)

---

## 🗄️ Estrutura do Banco de Dados

### 1. Criação do Banco de Dados

Foi criado um banco de dados chamado **biblioteca**, responsável por armazenar todas as tabelas do sistema.

```sql
CREATE DATABASE biblioteca;
```

---

### 2. Tabela: livro

Tabela responsável por armazenar informações sobre os livros disponíveis na biblioteca.

**Campos:**

* `id`: Identificador único (chave primária, autoincremento)
* `titulo`: Título do livro (não nulo)
* `autor`: Nome do autor (não nulo)
* `ano_publicacao`: Ano de publicação (não nulo)
* `genero`: Gênero do livro (não nulo)
* `quantidade_estoque`: Quantidade disponível em estoque (não nulo)

```sql
CREATE TABLE livro (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    ano_publicacao INT NOT NULL,
    genero VARCHAR(100) NOT NULL,
    quantidade_estoque INT NOT NULL
);
```

---

### 3. Tabela: usuario

Tabela responsável por armazenar os dados dos usuários da biblioteca.

**Campos:**

* `id`: Identificador único (chave primária, autoincremento)
* `nome`: Nome do usuário (não nulo)
* `cpf`: CPF (único)
* `email`: Email (único)
* `telefone`: Telefone (não nulo)
* `endereco`: Endereço (não nulo)

```sql
CREATE TABLE usuario (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(255) UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);
```

---

### 4. Tabela: emprestimo

Tabela responsável por gerenciar os empréstimos de livros realizados pelos usuários.

**Campos:**

* `id`: Identificador único (chave primária, autoincremento)
* `id_usuario`: Referência ao usuário (chave estrangeira)
* `id_livro`: Referência ao livro (chave estrangeira)
* `data_emprestimo`: Data do empréstimo (não nulo)
* `data_devolucao`: Data de devolução (pode ser nulo)
* `status`: Situação do empréstimo (emprestado ou devolvido)

Antes da criação da tabela, foi necessário definir um tipo ENUM para o campo `status`.

```sql
CREATE TYPE status_emprestimo AS ENUM ('emprestado', 'devolvido');
```

```sql
CREATE TABLE emprestimo (
    id SERIAL PRIMARY KEY,
    id_usuario INT REFERENCES usuario(id),
    id_livro INT REFERENCES livro(id),
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE,
    status status_emprestimo NOT NULL
);
```

---

### 5. Alteração da Tabela livro

Foi adicionado um novo campo chamado `editora` na tabela `livro`.

```sql
ALTER TABLE livro
ADD COLUMN editora VARCHAR(100);
```

---

## 🔗 Relacionamentos

* Um **usuário** pode realizar vários empréstimos (1:N)
* Um **livro** pode estar em um empréstimos (1:1)
* A tabela **emprestimo** atua como entidade associativa entre `usuario` e `livro`

---

## ✅ Considerações Finais

Este projeto representa a base estrutural de um sistema de biblioteca, permitindo o gerenciamento eficiente de livros, usuários e empréstimos.

A modelagem foi construída seguindo boas práticas de banco de dados, como:

* Uso de chaves primárias e estrangeiras
* Definição de restrições (NOT NULL, UNIQUE)
* Separação adequada das entidades
* Uso de ENUM para controle de status

Esse tipo de estrutura pode ser facilmente expandido para sistemas mais complexos, incluindo funcionalidades como reservas, multas e histórico de atividades.

---

## 🚀 Autor

Desenvolvido por **Gabriel Botelho**
Estudante de Análise e Desenvolvimento de Sistemas
