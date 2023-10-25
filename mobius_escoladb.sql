/*
	Estela Alves de Moraes
	Giovanna Silva Belo
  
	DS1BIT - A 
*/

/* Instituição de ensino que oferece cursos de graduação, pós-graduação, cursos
livres e formações continuadas. Ela possui também atividades de pesquisa, eventos
acadêmicos e parcerias com empresas para estágios e projetos.*/

/*Criar o banco de dados da escola "Mobius"*/
create database mobius_escoladb;

/*Selecionar o banco de dados (usar)*/
use mobius_escoladb;

/*Criação de tabelas para as informações da escola de acordo com as instruções e exemplos dados no documento da atividade e baseado em atividades anteriores*/

create table alunos
(
   	id_aluno integer primary key not null auto_increment,
    nome varchar(80) not null,
    data_nascimento date,
    endereco text,
    telefone text,
    cpf text
);

/*Categoria: "A organização oferece cursos de graduação, pós-graduação, cursos
livres e formações continuadas."*/
create table cursos
(
	id_curso integer primary key not null auto_increment,
    nome varchar(40),
    categoria text,
    carga_horaria integer, 
    valor integer
);


create table matriculas
(
	id_matricula integer primary key not null auto_increment,
    id_aluno integer not null,
    id_curso integer,
    data_matricula date,
    
    foreign key (id_aluno) references alunos(id_aluno),
    foreign key (id_curso) references cursos(id_curso)
);

create table bolsas
(
	id_bolsa integer primary key not null auto_increment,
    id_matricula integer not null,
    desconto integer,
    
    foreign key (id_matricula) references matriculas(id_matricula)
);

create table disciplinas
(
	id_disciplina integer primary key not null auto_increment,
    nome varchar(40),
    id_curso integer,
    
    foreign key (id_curso) references cursos(id_curso)
);

create table turmas
(
	id_turma integer primary key not null auto_increment,
    nome varchar(10),
    id_curso integer,
    ano varchar(4),
    semestre integer,
    turno varchar(5),
    dias text,
    
    foreign key (id_curso) references cursos(id_curso)
);

create table frequencia 
(
	id_frequencia integer primary key not null auto_increment,
    id_aluno integer,
    id_turma integer,
    data_aula date,
    presenca varchar(12),
    
    foreign key (id_aluno) references alunos(id_aluno),
    foreign key (id_turma) references turmas(id_turma)
);

create table notas
(
	id_nota integer primary key not null auto_increment,
    id_aluno integer,
    id_turma integer,
    id_disciplina integer,
    nota numeric,
    dataAvaliacao date,
    
    foreign key (id_aluno) references alunos (id_aluno),
    foreign key (id_turma) references turmas (id_turma),
    foreign key (id_disciplina) references disciplinas(id_disciplina)
);

create table professores
(
id_professor integer primary key not null auto_increment,
nome varchar(80),
data_contratacao date,
email varchar(50),
telefone text,
id_disciplina integer,

foreign key(id_disciplina) references disciplinas (id_disciplina)
);

/* "Ela possui também atividades de pesquisa, eventos
acadêmicos e parcerias com empresas para estágios e projetos."*/

create table pesquisas 
(
	id_pesquisa integer primary key not null auto_increment,
    id_professor integer,
    descricao text,
    
    foreign key (id_professor) references professores (id_professor)
);

create table eventos
(
	id_evento integer primary key not null auto_increment,
    id_curso integer,
    data_evento date,
    descricao text,
    
    foreign key (id_curso) references cursos(id_curso)
);

create table empresasRegistradas
(
	id_empresa integer primary key not null auto_increment,
    nome varchar(40),
    email varchar(50),
    telefone text
);

create table projetosEmpresas
(
	id_projeto integer primary key not null auto_increment,
    id_empresa integer,
    descricao text,
    
    foreign key (id_empresa) references empresasRegistradas(id_empresa) 
);

create table estagios
(
    id_estagio integer primary key not null auto_increment,
    id_empresa integer,
    id_curso integer,
    descricao text,
    
    foreign key (id_empresa) references empresasRegistradas (id_empresa),
 foreign key (id_curso) references cursos (id_curso)
);

/*Inserir valores nas tabelas*/

insert into alunos (nome, data_nascimento, endereco, telefone, cpf ) values
('Igor Ferreira', '1999-07-30', 'Rua Afonso de Mendonça, 1756 Santo André - SP', '923731858', '39012112717'),
('Martim Ferreira', '2002-8-10', 'Rua Afonso de Mendonça, 1756 Santo André - SP', '923575158', '74937393760'),
('Catherine Zubareva', '2003-11-7', 'Rua Coronel Fernando Prestes, 365 Itapetininga-SP', '974657321', '764920545720'),
('Kai Rodrigues Santos', '2003-11-7', 'Rua Paraíba, 1166 Amparo-SP', '910142818', '999988865432'),
('Mirabel Madrigal', '2003-11-7', 'Rua Quinze de Novembro, 141 Bauru-SP', '910142818', '64730287965'),
('Eliza Morales', '2003-11-7', 'Rua Paraíba, 1166 Amparo-SP', '910142818', '87454632642'),
('Camilla SIlva', '2003-11-7', 'Rua Rubi, 1458 Itapetininga-SP', '910142818', '22277966310'),
('Alex Poljak ', '200-11-7', 'Rua Paraíba, 1166 Amparo-SP', '974629081', '54637398291'),
('Luigi diAngelo', '2004-11-16', 'Rua Alfredo Mendes, 181 Ribeirão Pires-SP', '2593-3090' , '53819273978'),
('Ágatha Barros Goncalves', '1980-05-20', 'Rua Maquiru, 401
Ribeirão Pires-SP', '945782937', '22828773364');

select * from alunos;

insert into cursos (nome, categoria, carga_horaria, valor) values
('Educação Física', 'Curso de graduação', 3200, 1000),
('Arquitetura', 'Curso pós-graduação', 360, 600),
('Artesanato', 'Curso Livre', 800, 7900),
('Informação e Comunicação', 'Curso de formação continuada', 40, 1000),
('Gastronomia', 'Curso livre', 800, 3000),
('Desenvolvimento de Sistemas','Curso técnico', 1600, 700 );

select * from cursos;

/*mudar dado que foi inserido errado*/
update cursos set carga_horaria = 3200 where id_curso = 1;

insert into matriculas (id_aluno, id_curso, data_matricula) values
(1, 2, '2022-04-14'),
(2, 6, '2022-12-05'),
(3, 5, '2023-01-14'),
(4, 3, '2022-01-08'),
(5, 1, '2022-11-12' ),
(5, 3, '2023-01-26'),
(6, 1, '2020-05-14'),
(7, 6, '2022-12-11' ),
(8, 2, '2022-04-25'),
(9, 6, '2022-11-16'),
(10, 6, '2022-12-29');

select * from matriculas;

insert into bolsas (id_matricula, desconto) values
(1, 90),
(2, 100),
(3, 60), 
(4, 50), 
(5, 80),
(5, 50); 

select * from bolsas;

insert into turmas (nome, id_curso, ano, semestre, turno, dias) values
('EF0820', 1,'2020', 2, 'manhã', 'segunda e quinta'),
('EF1021', 1,'2021', 1, 'manhã', 'terça e sexta'),
('ARQ0422', 2,'2022', 4, 'tarde', 'quarta e sexta'),
('ARQ0522', 2,'2022', 2, 'tarde', 'segunda e quinta'),
('ART0322', 3,'2022', 1, 'manhã', 'segunda e quarta'),
('ART0323', 3,'2023', 3, 'tarde', 'quarta e quinta'),
('GAS0421', 5,'2023', 3, 'noite', 'terça e quinta'),
('DS0522', 6, '2022', 4, 'manhã', 'quarta e sexta');

select * from turmas;

insert into disciplinas(nome, id_curso) values
("Fisiologia do Exercício", 1),
("Metodologia do Ensino em Educação Física", 1),
("Projeto Arquitetônico", 2),
("Construção e Materiais", 2),
("Técnicas de Artesanato", 3),
("Oficinas Práticas", 3),
("Informação e comunicação", 4),
("Técnica Culinária", 5),
("Segurança Alimentar", 5),
("Programação de Computadores", 6),
("Banco de dados", 6);

select * from disciplinas;

insert into frequencia (id_aluno, id_turma, data_aula, presenca) values
(1, 3, '2022-11-10', 'ausente'),
(2, 8, '2022-11-10', 'presente'),
(3, 7, '2023-10-10', 'presente'),
(4, 5, '2022-09-10', 'ausente'),

(5, 1, '2021-10-10', 'presente'),
(5, 6, '2023-11-10', 'presente'),

(6, 2, '2021-10-10', 'ausente'),
(7, 8, '2022-11-10', 'presente'),
(8, 4, '2022-09-10', 'presente'),
(9, 8, '2022-11-10', 'presente'),
(10,8, '2022-11-10', 'ausente');

select * from  disciplinas;

insert into notas (id_aluno, id_turma, id_disciplina, nota, dataAvaliacao) values
(1, 3, 5, 100, '2022-10-12'),
(2, 8, 6, 90, '2022-08-15'),
(3, 7, 9, 80, '2023-05-20'),
(4, 5, 5, 70, '2022-10-12'), 

(5, 1, 2, 100, '2021-09-03'),
(5, 1, 1, 90, '2022-04-03'),
(5, 1, 1, 90, '2022-08-03'),
(5, 1, 2, 100, '2022-09-03'),
(5, 6, 6, 80, '2023-05-11'),
(5, 6, 6, 100, '2023-06-10'),
(5, 6, 6, 95, '2023-09-14'),

(6, 2, 11, 90, '2021-09-07'),
(7, 8, 10, 60, '2022-06-07'),
(8, 4, 4, 85, '2022-05-08'),
(9, 8, 11, 75, '2022-11-28'),
(10,8, 11, 55, '2022-06-19');

select * from notas;

insert into professores (nome, data_contratacao, email, telefone, id_disciplina) values
("João Arnaldo de Almeida", '2010-02-20', 'joaoalmeida@mobemail.com', '11917689462', 1),
("Jennifer Corrêa", '2010-02-20',' jennifercorrea@mobemail.com', '1198486573', 2),
("Oswaldo Geoberto Callado", '2015-06-06', 'oswaldocalado@mobemail.com','1173829467',3),
("Vivianne Karlei", '2017-04-17', 'viviannekarlei@mobemail.com', '11901704017', 4),
("Olivia Helena Santos", '2015-03-30', 'oliviasantos@mobemail.com', '11903213023', 5),
("Kimberly Lacerda Paes", '2018-03-10', 'kimberlypaes@mobemail.com', '11903213027', 6),
("Pedro Emilio Camargo", '2018-03-30', 'pedrocamargo@mobemail.com', '11903213029', 7),
("Antonio Lacerda ", '2018-11-10', 'antoniolacerda@mobemail.com', '11932017388', 8),
("Jorge Amado", '2019-02-27', 'jorgeamado@mobemail.com', '11949320263', 9),
("Sócrates da Silva", '2021-05-30', 'socratessilva@mobemail.com', '11954292731', 10),
("Karina de Aragão", '2023-06-30', 'karinaaragao@mobemail.com', '11954027658', 11);

select * from professores;

insert into pesquisas (id_professor, descricao) values
(1, "A Influência da Nutrição no Desempenho Esportivo"),
(3, "Arquitetura Sustentável"),
(5, "Artesanato com Materiais Reciclados"),
(9, "Visita a Mercados Locais"),
(10, " Avaliação da Experiência do Usuário ");

select * from pesquisas;

insert into eventos (id_curso, data_evento, descricao) values
(1, '2021-08-12', 'Jornada Acadêmica de Educação Física; Fechado; Participação facultativa'),
(2, '2023-05-27', 'Congresso de Arquitetura; Aberto; Participação obrigatória' );


insert into empresasRegistradas (nome, email, telefone) values
('Microsoft', 'microsoft@outlook.com' , '1155042155'),
('Consuma Gastronomia', 'gastronomia@outlook.com' , '1132157000');

select * from empresasRegistradas;

insert into projetosEmpresas (id_empresa, descricao) values
(2, "Instituição da Gastronomia Internacional"),
(1, "Projeto da Microsoft");

select * from projetosEmpresas;

insert into estagios (id_empresa, id_curso, descricao) values
(1, 6,  "Estágio em Desenvolvimento de Sistemas na Microsoft"),
(2, 5, "Gastronomia"),
(2, 5, "Gastronomia");

select * from estagios;

/*Funcionalidades que o banco de dados deve suportar e possíveis consultas como...*/

/*Relatório de desempenho dos alunos   -- relatório de um aluno*/
select alunos.nome, disciplinas.nome as disciplina, ROUND(avg(nota)) as media from notas inner join alunos on notas.id_aluno=alunos.id_aluno 
inner join disciplinas on notas.id_disciplina=disciplinas.id_disciplina 
where alunos.nome='Mirabel Madrigal' group by disciplinas.nome;

select alunos.nome, disciplinas.nome, dataAvaliacao, nota from notas inner join alunos on notas.id_aluno=alunos.id_aluno 
inner join disciplinas on notas.id_disciplina=disciplinas.id_disciplina 
where alunos.nome='Mirabel Madrigal' and disciplinas.id_disciplina="6" group by dataAvaliacao;

/*Histórico escolar --- Mirabel Madrigal*/
select alunos.nome, cursos.categoria, cursos.nome as curso, disciplinas.nome as disciplina, 
round(avg(nota)) as media, bolsas.desconto as 'bolsas (%)',
 matriculas.data_matricula from notas inner join alunos on 
 notas.id_aluno=alunos.id_aluno inner join disciplinas on notas.id_disciplina=disciplinas.id_disciplina 
 inner join cursos on disciplinas.id_curso=cursos.id_curso 
 inner join turmas on cursos.id_curso = turmas.id_curso 
 inner join frequencia on turmas.id_turma = frequencia.id_turma 
 inner join matriculas on matriculas.id_curso=cursos.id_curso inner join
 bolsas on matriculas.id_matricula=bolsas.id_matricula where 
 alunos.nome='Mirabel Madrigal' and frequencia.id_turma =turmas.id_turma 
 group by disciplinas.id_disciplina; 

/*Agenda de eventos acadêmicos*/
select data_evento, descricao from eventos;

/*Registro de frequência dos alunos -- Frequência da 
turma DS0522 (desenvolvimento de sistemas) em 10/11/2022 */
select alunos.nome, data_aula, presenca from frequencia inner join alunos on frequencia.id_aluno=alunos.id_aluno
 inner join turmas on frequencia.id_turma=turmas.id_turma where frequencia.data_aula= '2022-11-10' and turmas.nome='DS0522';

/*Gestão de matrículas e inscrições: todos os alunos e alunos matriculados em 2023*/
select alunos.nome, matriculas.data_matricula, cursos.nome from 
alunos inner join matriculas on alunos.id_aluno = matriculas.id_aluno 
inner join cursos on matriculas.id_curso = cursos.id_curso order by data_matricula;

select matriculas.id_matricula, alunos.nome, matriculas.data_matricula, 
cursos.nome from alunos inner join matriculas on alunos.id_aluno = matriculas.id_aluno 
inner join cursos on matriculas.id_curso = cursos.id_curso where matriculas.data_matricula like "%2023%";

/*Listar todos os alunos de um determinado curso, independente da turma/semestre*/
select alunos.nome, turmas.nome from turmas inner join cursos on 
turmas.id_curso=cursos.id_curso inner join frequencia on turmas.id_turma=frequencia.id_turma 
inner join alunos on frequencia.id_aluno=alunos.id_aluno  where cursos.nome = 'Desenvolvimento de Sistemas';

/*Encontrar todos os professores que orientam projetos de pesquisa*/
select professores.nome, pesquisas.descricao from professores join 
pesquisas on professores.id_professor=pesquisas.id_professor;

/*Contagem de presença de um aluno no curso*/
select alunos.nome, turmas.nome as turma, count(distinct presenca) 
as 'presenças' from frequencia inner join turmas on 
frequencia.id_turma=turmas.id_turma inner join alunos on 
frequencia.id_aluno = alunos.id_aluno inner join cursos on 
turmas.id_curso=cursos.id_curso where frequencia.id_aluno = 5 
and presenca= "presente" group by turma;

