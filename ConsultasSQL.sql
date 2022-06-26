-- LINK DO GITHUB: https://github.com/t3mpest4d3/Projeto_Banco_De_Dados.git


drop table if exists aluno, Turma, Matricula, disciplina, professor, turma_tem_disciplina, professor_leciona_disciplina, prof_resp_turma, funcionario_nivel_2, diret_contr_prof, funcionario_nivel_1, diret_contr_funci, local_escola, turma_ocupa_local, func_2_ocupa_local, cord_aluno, funci_1_trabalha_local, respons_aluno;

create table aluno (
id integer not null auto_increment,
nome varchar(30),
contato bigint,
endereco text,
primary key (id)
);


create table turma (
codigo integer auto_increment,
nome varchar(30),
turno enum ('Matutino','Vespertino'),
primary key (codigo)
);

create table matricula (
data_de_matricula date,
id_aluno integer,
codigo_turma integer,
foreign key (id_aluno) references Alunos (id),
foreign key (codigo_turma) references Turma (codigo),
primary key (id_aluno, codigo_turma)
);

create table disciplina (
codigo integer not null auto_increment,
nome varchar(30),
carga_horaria integer,
primary key (codigo)
);

create table professor (
id integer not null,
nome varchar(30),
contato bigint,
especializacao varchar(40),
primary key (id)
);

create table turma_tem_disciplina (
codigo_turma integer,
codigo_disciplina integer,
foreign key (codigo_turma) references turma (codigo),
foreign key (codigo_disciplina) references disciplina (codigo),
primary key (codigo_turma, codigo_disciplina)
);

create table professor_leciona_disciplina (
id_prof integer,
codigo_disciplina integer,
foreign key (id_prof) references professor (id),
foreign key (codigo_disciplina) references disciplina (codigo),
primary key (id_prof, codigo_disciplina)
);

create table prof_resp_turma (
id_prof integer,
codigo_turma integer,
foreign key (id_prof) references professor (id),
foreign key (codigo_turma) references turma (codigo),
primary key (id_prof, codigo_turma)
);

create table funcionario_nivel_2 (
id integer not null auto_increment,
nome varchar(30),
cpf varchar(14),
especialidade enum('Diretoria', 'Cordenação'),
salario decimal(6,2),
primary key (id)
);

create table diret_contr_prof (
data_contrato date,
id_diret integer,
id_prof integer,
foreign key (id_diret) references funcionario_nivel_2 (id),
foreign key (id_prof) references professor (id),
primary key (id_prof, id_diret)
);

create table funcionario_nivel_1 (
cpf varchar(14),
nome varchar(30),
contato bigint,
servico enum ('manutencao', 'limpeza'),
salario decimal (6,2),
primary key (cpf)
);


create table diret_contr_funci (
data_contrato date,
id_diret integer,
cpf_funci varchar(14),
foreign key (id_diret) references funcionario_nivel_2 (id),
foreign key (cpf_funci) references funcionario_nivel_1 (cpf),
primary key (id_diret, cpf_funci)
);


create table local_escola (
codigo integer not null auto_increment,
nome varchar(30),
capacidade enum ('20', '40', '60', '120'),
localizacao enum('Bloco A', 'Bloco B', 'Bloco C'),
primary key (codigo)
);


create table turma_ocupa_local (
cod_turma integer,
cod_local integer,
foreign key (cod_turma) references turma (codigo),
foreign key (cod_local) references local (codigo),
primary key (cod_turma, cod_local)
);

create table func_2_ocupa_local (
id_func_2 integer,
cod_local integer,
foreign key (id_func_2) references funcionario_nivel_2 (id),
foreign key (cod_local) references local_escola (codigo),
primary key (id_func_2, cod_local) 
);


create table cord_aluno (
id_cord integer,
id_aluno integer,
foreign key (id_cord) references funcionario_nivel_2 (id),
foreign key (id_aluno) references alunos (id),
primary key (id_cord, id_aluno)
);


create table funci_1_trabalha_local (
cpf_funci varchar(14),
localizacao enum('Bloco A', 'Bloco B', 'Bloco C'),
foreign key (cpf_funci) references funcionario (cpf),
foreign key (localizacao) references local_escola (localizacao),
primary key (cpf_funci, localizacao)
);

create table respons_aluno (
nome varchar(40),
parentesco varchar(30),
contato bigint,
id_aluno integer,
primary key (nome, id_aluno),
foreign	key (id_aluno) references aluno (id) ON DELETE CASCADE
);


INSERT INTO Aluno (nome, contato, endereco) VALUES ('João Carlos Da Silva', '999865884', 'Rua Campinas, n 142 - centro' ), ('Amanda Borges Rodriguez', '998995687', 'Rua santa cruz, n 44 - Jardim Florida'), ('Carlos Amadeus Gonçalvez', '978852655', 'Travessa Campos, n 77 - Jardim Paulista' ), ('Suzanna Cass Barebold' , '999856632', 'Avenida Guilherme Augusto, n 4 - Centro'), ('Lucia Pevensie', '947586552', 'Rua Guarda Erri, n 50 - Centro'), ('Pedro Pevensie', '947586552', 'Rua Guarda Erri, n 50 - Centro'), ('Alessandra Cristina Pereira', '995786354', 'Avenida Esbertalina Barbosa, n 75 - Vila Pavão'), ('Fabiene Sodero Cruz', '958754662', 'Rodovia Raposo Tavares, n 88 - Lageadinho'), ('Gabriella Mendes Bugni', '978852214', 'Rua das Fiandeiras, n 45 - Vila Olímpia'), ('Katharine Camelo Campos', '994545005', 'Rua Arlindo Nogueira, n 64 - República'), ('João Otávio Iago Pereira', '937095113', 'Avenida Senador Area Leão,n 655 - São Cristóvão'), ('Sophia Emilly Aline Teixeira', '964027285', 'Rua Teresa Cristina, n 864 - Promorar'), ('Anthony Carlos Ribeiro', '985647213', 'Beco Tucumã, 245 - Coroado'), ('Yago Danilo Enzo das Neves', '945682371', 'Rua Butoporã, n 322 - Jardim Jordão'), ('Rodrigo Cauã Assunção', '9636258741', 'Rua C-05, n 676 - Benedito Bentes'), ('Alícia Fátima Caldeira', '985647123', 'Rua Dagoberto Renato Damião de Araújo, n 941 - Louzeiro'), ('Silvana Teresinha Silveira', '985647123', 'Rua Governador Álvaro Maia, n 882 - Conjunto Castelo Branco'), ('Lorena Silvana Pires', '987454786', 'Rua Artur Barbosa Pereira Freire, n 679 - Ernani Sátiro'), ('Esther Luiza Alves', '956741236', 'Quadra SOFN Quadra 5 Conjunto B, n 445 - Zona Industrial'), ('Fabiana Bárbara Barbosa', '98633687', 'Rua Cairo, 167 - Senador Camará'), ('Alessandra Cláudia das Neves', '945687458', 'Rodovia AC-40, n 782 - Loteamento Santa Helena'), ('Sabrina Giovanna Mirella', '963325687', 'Rua das Violetas, n 177 - Jardim Paraíso');
INSERT INTO Turma (codigo, nome, turno) VALUES ('25244', '9° ano B', 'Vespertino'), (default, '8° ano B', 'Vespertino'), (default, '7° ano B', 'Vespertino'), (default, '6° ano B', 'Vespertino'), (default, '6° ano A', 'Vespertino'), (default, '7° ano A', 'Vespertino'), (default, '8° ano A', 'Vespertino'), (default, '9° ano A', 'Vespertino'), ('87754', '1° ano', 'Matutino'), (default, '2° ano', 'Matutino'), (default, '3° ano', 'Matutino');
INSERT INTO Matricula (data_de_matricula, id_aluno, codigo_turma) VALUES ('2012-08-24', '1', '25244'), ('2015-01-15', '2', '25244'), ('2015-07-16', '3', '25245'), ('2016-05-03', '4', '25245'), ('2015-05-05', '5', '25246'), ('2020-09-02', '6', '25246'), ('2011-10-13', '7', '25247'), ('2016-10-12', '8', '25247'), ('2020-01-15', '9', '25248'), ('2020-05-12', '10', '25248'), ('2020-12-01', '11', '25249'), ('2014-03-13', '12', '25249'), ('2015-12-22', '13', '25250'), ('2016-12-28', '14', '25250'), ('2018-02-15', '15', '25251'), ('2018-05-22', '16', '25251'), ('2011-07-07', '17', '87754'), ('2012-11-30', '18', '87754'), ('2015-06-29', '19', '87755'), ('2011-08-02', '20', '87755'), ('2013-03-18', '21', '87756'), ('2020-04-17', '22', '87756');
INSERT INTO Disciplina (codigo, nome, carga_horaria) VALUES ('100', 'Arte', '40'), (default, 'Biologia', '120'), (default, 'Educação Fisica', '40'), (default, 'Espanhol', '40'), (default, 'Filosofia', '40'), (default, 'Fisica', '80'), (default, 'Geografia', '80'), (default, 'Historia', '80'), (default, 'Ingles', '80'), (default, 'Lingua Portuguesa', '160'), (default, 'Redação', '80'), (default, 'Matematica', '160'), (default, 'Quimica', '80'), (default, 'Sociologia', '40'), (default,'Ensino Religioso', '40'), (default, 'Fisica Pratica', '80'), (default, 'Quimica Pratica', '80'), (default, 'Ciencias', '120');
INSERT INTO Professor (id, nome, contato, especializacao) VALUES ('54587', 'Paulo Cezar Antunes', '955687412', 'Sociologia - USP'), ('54588', 'Regina Souza Soares',  '954486255', 'Artes - EMBAP'), ('54589', 'Lupita Adelane Rodriguez', '985633745', 'Letras - USP'), ('54590', 'Edna Macedo De Afonso', '965887425', 'Fisica - UEM'), ('54591', 'Gabriela Laiz Amarães', '957663248', 'Letras - UNESPAR'), ('54592', 'Suzane Guerreiro Polinacci', '971145638', 'Letras - USP'), ('54593', 'Misa Sun Takahashi', '956988741', 'Licenciatura Em Quimica - UTFPR'), ('54594', 'José Bezerra Carnotel', '986332456', 'Matimatica - UEM'), ('54595', 'Jhonny Pereira Artroz', '957585632', 'Letras Portugues/Ingles - UNESPAR'), ('54596', 'Eduardo Barça Fagundes', '987456321', 'Filosofia - PUCPR'), ('54597', 'Nathalia Ellizabeth Rocz', '978567428', 'Ciencias Biologicas - PUCPR'), ('54598', 'Fabricio De Souza Meireles', '985336475', 'Educação Fisica - UNICESUMAR'), ('54599', 'Claudette Amandes De Souza', '98567741', 'Geografia - UEM'), ('54600', 'Aleandro Pereira Dos Santos', '985246719', 'Historia - USP'), ('54601', 'Gabriel Souza Antunes', '98875564', 'Teologia - UNIFEV');
INSERT INTO turma_tem_disciplina (codigo_turma, codigo_disciplina) VALUES ('25244', '100'), ('25244', '102'), ('25244', '103'), ('25244', '104'), ('25244', '106'), ('25244', '107'), ('25244', '108'), ('25244', '109'), ('25244', '111'), ('25244', '113'), ('25244', '114'), ('25244', '117'), ('25245', '100'), ('25245', '102'), ('25245', '103'), ('25245', '104'), ('25245', '106'), ('25245', '107'), ('25245', '108'), ('25245', '109'), ('25245', '111'), ('25245', '113'), ('25245', '114'), ('25245', '117'), ('25246', '100'), ('25246', '102'), ('25246', '103'), ('25246', '104'), ('25246', '106'), ('25246', '107'), ('25246', '108'), ('25246', '109'), ('25246', '111'), ('25246', '113'), ('25246', '114'), ('25246', '117'), ('25247', '100'), ('25247', '102'), ('25247', '103'), ('25247', '104'), ('25247', '106'), ('25247', '107'), ('25247', '108'), ('25247', '109'), ('25247', '111'), ('25247', '113'), ('25247', '114'), ('25247', '117'), ('25248', '100'), ('25248', '102'), ('25248', '103'), ('25248', '104'), ('25248', '106'), ('25248', '107'), ('25248', '108'), ('25248', '109'), ('25248', '111'), ('25248', '113'), ('25248', '114'), ('25248', '117'), ('25249', '100'), ('25249', '102'), ('25249', '103'), ('25249', '104'), ('25249', '106'), ('25249', '107'), ('25249', '108'), ('25249', '109'), ('25249', '111'), ('25249', '113'), ('25249', '114'), ('25249', '117'), ('25250', '100'), ('25250', '102'), ('25250', '103'), ('25250', '104'), ('25250', '106'), ('25250', '107'), ('25250', '108'), ('25250', '109'), ('25250', '111'), ('25250', '113'), ('25250', '114'), ('25250', '117'), ('25251', '100'), ('25251', '102'), ('25251', '103'), ('25251', '104'), ('25251', '106'), ('25251', '107'), ('25251', '108'), ('25251', '109'), ('25251', '111'), ('25251', '113'), ('25251', '114'), ('25251', '117'),
('87754', '100'), ('87754', '101'), ('87754', '102'), ('87754', '104'), ('87754', '105'), ('87754', '106'), ('87754', '107'), ('87754', '108'), ('87754', '109'), ('87754', '110'), ('87754', '111'), ('87754', '112'), ('87754', '113'), ('87754', '115'), ('87754', '116'), ('87755', '100'), ('87755', '101'), ('87755', '102'), ('87755', '104'), ('87755', '105'), ('87755', '106'), ('87755', '107'), ('87755', '108'), ('87755', '109'), ('87755', '110'), ('87755', '111'), ('87755', '112'), ('87755', '113'), ('87755', '115'), ('87755', '116'), ('87756', '100'), ('87756', '101'), ('87756', '102'), ('87756', '104'), ('87756', '105'), ('87756', '106'), ('87756', '107'), ('87756', '108'), ('87756', '109'), ('87756', '110'), ('87756', '111'), ('87756', '112'), ('87756', '113'), ('87756', '115'), ('87756', '116');
INSERT INTO professor_leciona_disciplina (id_prof, codigo_disciplina) VALUES ('54587', '113'), ('54588', '100'), ('54589', '103'), ('54590', '105'), ('54591', '109'), ('54592', '110'), ('54593', '112'), ('54594', '111'), ('54595', '108'), ('54596', '104'), ('54597', '101'), ('54598', '102'), ('54599', '106'), ('54600', '107'), ('54601', '114'), ('54590','115'), ('54593' ,'116'), ('54597', '117');
INSERT INTO prof_resp_turma (id_prof, codigo_turma) VALUES ('54587', '25244'), ('54588', '25245'), ('54598', '25246'), ('54589', '25247'), ('54590', '25248'), ('54591', '25248'), ('54592', '25249'), ('54593', '25250'), ('54594', '25251'), ('54595', '25252'), ('54596', '25253'), ('54597', '25254'), ('54598', '25255');
INSERT INTO funcionario_nivel_2 (id, nome, cpf, especialidade, salario) VALUES ('4002', 'Edneia Ferreira Rodriguez', '109.619.820-71', 'Diretoria', '6300'), ('4003', 'Joeslin Romana Juiz', '928.118.180-06', 'Diretoria', '6200'), ('4004', 'Teodoro Marcos Massão', '910.468.080-44', 'Diretoria', '6200'), ('4005', 'Cassio Andrade Farias', '168.440.920-91', 'Diretoria', '6205'), ('4000', 'Andre Souza Marinho', '892.602.190-43', 'Diretoria', '6300'), ('5000', 'Erica Camila Ramos Frazao', '752.590.540-16', 'Cordenação', '3500'), ('5001', 'Fátima Gonçalves Jepes', '880.093.550-89', 'cordenacao', '3600'), ('5002', 'Giovanna Orso Moraga', '647.434.410-56', 'cordenacao', '3500'), ('5003', 'Edilaine Fernandes De Melo', '888.734.770-03', 'Cordenacao', '3700'), ('5004', 'Camila Calixto Moreira Dias', '148.219.960-22', 'Cordenacao', '3650');
INSERT INTO diret_contr_prof (data_contrato, id_diret, id_prof) VALUES ('2010-08-25', '4002', '54587'), ('2015-05-16', '4002', '54588'), ('2012-05-22','4003', '54589'), ('2020-10-04', '4004', '54590'), ('2018-07-25', '4004', '54591'), ('2015-06-14', '4005', '54592'), ('2010-05-15', '4005', '54593'), ('2010-12-22', '4000', '54594'), ('2012-10-06', '4000', '54595'), ('2013-10-15', '4000', '54596'), ('2010-04-25', '4005', '54597'), ('2009-05-09', '4003', '54598'), ('2010-05-25', '4003', '54599'), ('2010-01-15', '4003', '54600'), ('2009-05-14', '4002', '54601');
INSERT INTO funcionario_nivel_1 (cpf, nome, contato, servico, salario) VALUES ('302.044.810-74', 'Suzan Michelle Augusta', '985665745', 'Limpeza', '1500'), ('803.591.260-73', 'Joana Silveira Martins', '958664752', 'Limpeza', '1500'), ('095.778.240-30', 'Gabrielle Josefa De Oliveira', '988758446', 'Limpeza', '1700'), ('706.028.920-82', 'Kelly Regina Lima Pereira', '966325587', 'Limpeza', '1600'), ('312.412.040-04', 'Leticia Matos Dos Santos', '977421528', 'Limpeza', '1600'), ('526.980.560-02', 'Luiz Azevedo De Carvalho', '978563258', 'manutencao', '1800'), ('282.284.110-14', 'Aldair Macedo Ferreira', '951478632','manutencao', '1800'), ('018.866.020-85', 'Junior Leandro Goncalves', '984625731', 'manutencao', '1900'), ('357.590.980-63', 'Luan Dos Santos Silva', '964789321', 'manutencao', '1900'), ('728.830.200-86', 'Evandro Henrique De Carvalho', '946358741', 'manutencao', '2000'), ('083.520.030-20', 'Mirian Rodriguez Alvarez', '987452163', 'limpeza', '1800'), ('680.515.250-00', 'Eduardo Campos Ametista', '951487632', 'manutencao', '2000');
INSERT INTO diret_contr_funci (data_contrato, id_diret, cpf_funci) VALUES ('2012-05-14', '4000', '302.044.810-74'), ('2012-01-12', '4000', '803.591.260-73'), ('2011-01-22', '4002', '095.778.240-30'), ('2010-01-25', '4000', '706.028.920-82'), ('2015-05-12', '4003', '312.412.040-04'), ('2013-01-29', '4002', '526.980.560-02'), ('2012-04-17', '4003','282.284.110-14'), ('2011-03-25', '4004', '018.866.020-85'), ('2017-06-08', '4004', '357.590.980-63'), ('2016-09-05', '4004', '728.830.200-86'), ('2020-10-14', '4005', '083.520.030-20'), ('2019-06-25', '4005', '680.515.250-00');
INSERT INTO local_escola (codigo, nome, capacidade, localizacao) VALUES ('55750', 'Sala 100', '20', 'Bloco A'), ('55751', 'Sala 101', '20', 'Bloco A'), ('55752', 'Sala 102', '20', 'Bloco A'), ('55753', 'Sala 103', '40', 'Bloco A'), ('55754', 'Sala 104', '40', 'Bloco A'), ('55755', 'Sala 205', '40', 'Bloco B'), ('55756', 'Sala 206', '40', 'Bloco B'), ('55757', 'Sala 207', '40', 'Bloco B'), ('55758', 'Sala 208', '40', 'Bloco B'), ('55759', 'Sala 209', '40', 'Bloco B'), ('55760', 'Sala 110', '40', 'Bloco B'), ('55000', 'Auditorio', '120', 'Bloco C'), ('55001', 'Quadra', '120', 'Bloco C'), ('55002', 'Laboratorio', '40', 'Bloco C'), ('55800', 'Sala 300', '20', 'Bloco C'), ('55801', 'Sala 301', '20', 'Bloco C'), ('55802', 'Sala 302', '20', 'Bloco C'), ('55803', 'Sala 303', '20', 'Bloco C'), ('55804', 'Sala 304', '20', 'Bloco C'), ('55805', 'Sala 105', '20', 'Bloco C');
INSERT INTO turma_ocupa_local (cod_turma, cod_local) VALUES ('25244', '55750'), ('25245', '55751'), ('25246', '55752'), ('25247', '55753'), ('25248', '55754'), ('25249', '55755'), ('25250', '55756'), ('25251', '55757'), ('87754', '55758'), ('87755', '55759'), ('87756', '55760');
INSERT INTO func_2_ocupa_local (id_func_2, cod_local) VALUES ('4002', '55800'), ('4003', '55800'), ('4004', '55801'), ('4005', '55801'), ('4000', '55802'), ('5001', '55803'), ('5002', '55803'), ('5003', '55804'), ('5004', '55804'), ('5000', '55805');
INSERT INTO cord_aluno (id_cord, id_aluno) VALUES ('5000', '1'), ('5000', '2'), ('5000', '3'), ('5000', '4'), ('5001', '5'), ('5001', '6'), ('5001', '7'), ('5001', '8'), ('5002', '9'), ('5002', '10'), ('5002', '11'), ('5002', '12'), ('5003', '13'), ('5003', '14'), ('5003', '15'), ('5003', '16'), ('5004', '17'), ('5004', '18'), ('5004', '19'), ('5004', '20');
INSERT INTO funci_1_trabalha_local (cpf_funci, localizacao) VALUES ('302.044.810-74', 'Bloco A'), ('803.591.260-73', 'Bloco A'), ('526.980.560-02', 'Bloco A'), ('282.284.110-14', 'Bloco A'), ('018.866.020-85', 'Bloco B'), ('095.778.240-30', 'Bloco B'), ('706.028.920-82', 'Bloco B'), ('680.515.250-00', 'Bloco B'), ('312.412.040-04', 'Bloco C'), ('083.520.030-20', 'Bloco C'), ('728.830.200-86', 'Bloco C'), ('357.590.980-63', 'Bloco C');
INSERT INTO respons_aluno (nome, contato, parentesco, id_aluno) VALUES ('Bruna Fabiana Monteiro', '35185716', 'Mãe', '1'), ('Marina Natália Raimunda Nunes', '963258523', 'Mãe', '2'), ('Antonio Gustavo Felipe Almada', '985675685', 'Pai', '3'), ('Manuela Tereza Figueiredo', '985658745', 'Mãe', '4'), ('André Caio Fernandes', '35930929', 'Pai', '5'), ('André Caio Fernandes', '35930929', 'Pai', '6'), ('Maria Tatiane Cavalcanti', '996844752', 'Avó', '7'), ('Rebeca Marcela Aparecida de Paula', '944523678', 'Mãe', '8'), ('Lucas César Anderson Cavalcanti', '922145873', 'Pai', '9'), ('Beatriz Jennifer Lima', '965874521', 'Tia', '10'), ('Lorena Tereza Rezende', '955874123', 'Mãe', '11'), ('Vitor Otávio Severino Castro', '38442401', 'Tio', '12'), ('Carlos Eduardo Enzo Bernardes', '954748236', 'Avô', '13'), ('Bianca Pietra Isabella Bernardes', '933658741', 'Mãe', '14'), ('Melissa Luana Rosângela Silva', '955214863', 'Tia', '15'), ('Heitor Augusto Osvaldo da Silva', '988567412', 'Pai', '16'), ('Leandro Bernardo Ian Farias', '988564712', 'Pai', '17'), ('Yuri Lucas Nathan Santos', '987452361', 'Pai', '18'), ('Rosângela Luiza Monteiro', '966586333', 'Mãe', '19'), ('Samuel Isaac Arthur Farias', '966325587', 'Pai', '20'), ('Luiza Isabela Tatiane Lima', '944786325', 'Tia', '21'), ('Alícia Analu Carla Figueiredo', '933258746', 'Mãe', '22');

ALTER TABLE disciplina
CHANGE Nome Disciplina VARCHAR(30);

-- 1) nome, id e data dos alunos que se matricularam em 2015

select a.id, a.nome, m.data_de_matricula from aluno a join matricula m
on a.id = m.id_aluno
where m.data_de_matricula like '2015-%-%'
;

-- 2) O nome e id dos alunos matriculados no 1° ano

select a.id, a.nome from aluno a join matricula m 
on a.id = m.id_aluno join turma t
on m.codigo_turma = t.codigo
where t.nome = '1° ano'
;

-- 3) Liste todos os professores e suas respectivas disciplinas (ordem alfabetica dos nomes dos professores)

select p.nome, d.Disciplina from professor p join professor_leciona_disciplina l
on p.id = l.id_prof join disciplina d
on l.codigo_disciplina = d.codigo
order by p.nome
;

-- 4) Qual professor é responsavel pela turma 9° ano B? (mostrar nome do professor e nome da turma)

select p.nome, t.nome from professor p join prof_resp_turma r
on p.id = r.id_prof join turma t
on r.codigo_turma = t.codigo
where t.nome = '9° ano B'
;

-- 5) liste todos os alunos que começam com 'a' e se matricularam em 2015 (deve aparecer o nome, contato e data de matricula)

select a.nome, a.contato, m.data_de_matricula from aluno a join matricula m
on a.id = m.id_aluno
where a.nome like 'a%' and m.data_de_matricula like '2015-%-%'
;

-- 6) liste todos os responsaveis, que sejam Pai, para cada aluno mostrando tambem o numero de contato dos responsaveis

select a.nome, r.nome, r.contato from aluno a join respons_aluno r
on a.id = r.id_aluno
where r.parentesco = 'Pai'
;


-- 7) Selecione em ordem alfabetica o nome dos funcionarios da limpeza que trabalham em locais com '120' de capacidade.

select distinct f.nome from funcionario_nivel_1 f join funci_1_trabalha_local t
on f.cpf = t.cpf_funci join local_escola l
on t.localizacao = l.localizacao
where l.capacidade = '120' and f.servico = 'Limpeza'
order by f.nome
;


-- 8) conte quantos alunos tem a mãe como responsavel

select count(*) from aluno a join respons_aluno r
on a.id = r.id_aluno
where r.parentesco = 'Mãe'
;


-- 9) liste todos professores, em ordem alfabetica, contratados em 2010, mostrando o nome e a data exata de contratação

select p.nome, c.data_contrato from professor p join diret_contr_prof c
on p.id = c.id_prof join funcionario_nivel_2 d
on c.id_diret = d.id
where data_contrato like '2010-%-%'
order by p.nome
;

-- 10) liste o nome, contato, salario e data de contrato de todos funcionarios da limpeza contratados pelo diretor 'Andre Souza Marinho'

select f.nome, f.contato, f.salario, c.data_contrato from funcionario_nivel_2 d join diret_contr_funci c
on c.id_diret = d.id join funcionario_nivel_1 f
on c.cpf_funci = f.cpf
where f.servico = 'Limpeza' and d.nome = 'Andre Souza Marinho'
;