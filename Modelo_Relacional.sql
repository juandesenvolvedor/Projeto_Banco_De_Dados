-- LINK DO GITHUB: https://github.com/t3mpest4d3/Projeto_Banco_De_Dados.git


drop table if exists aluno, Turma, Matricula, disciplina, professor, turma_tem_disciplina, professor_leciona_disciplina, prof_resp_turma, diretoria, diret_contr_prof, funcionario, diret_contr_funci, local_escola, turma_ocupa_local, diret_ocupa_local, cordenacao, cord_aluno, cord_ocupa_local, funci_trabalha_local, respons_aluno;

create table aluno (
id integer not null auto_increment,
nome varchar(30),
contato bigint,
endereco text,
primary key (id)
);


create table turma (
codigo integer,
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
codigo integer not null,
nome varchar(30),
horas_letivas integer,
primary key (codigo)
);

create table professor (
id integer not null auto_increment,
nome varchar(30),
contato bigint,
especializacao varchar(30),
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

create table diretoria (
id integer not null auto_increment,
nome varchar(30),
localizacao varchar(30),
primary key (id)
);

create table diret_contr_prof (
data_contrato date,
id_diret integer,
id_prof integer,
foreign key (id_diret) references diretoria (id),
foreign key (id_prof) references professor (id),
primary key (id_prof, id_diret)
);

create table funcionario (
cpf integer(6),
servico enum ('manutencao', 'limpeza'),
salario decimal (6,2),
primary key (cpf)
);


create table diret_contr_funci (
data_contrato date,
id_diret integer,
cpf_funci integer,
foreign key (id_diret) references diretoria (id),
foreign key (cpf_funci) references funcionario (cpf),
primary key (id_diret, cpf_funci)
);

create table local_escola (
codigo integer not null auto_increment,
capacidade integer,
localizacao varchar(30),
primary key (codigo)
);

create table turma_ocupa_local (
cod_turma integer,
cod_local integer,
foreign key (cod_turma) references turma (codigo),
foreign key (cod_local) references local (codigo),
primary key (cod_turma, cod_local)
);

create table diret_ocupa_local (
id_diret integer,
cod_local integer,
foreign key (id_diret) references diretoria (id),
foreign key (cod_local) references local_escola (codigo),
primary key (id_diret, cod_local) 
);

create table cordenacao (
id integer not null auto_increment,
nome varchar(30),
localicazao varchar(30),
primary key (id)
);

create table cord_aluno (
id_cord integer,
id_aluno integer,
foreign key (id_cord) references cordenacao (id),
foreign key (id_aluno) references alunos (id),
primary key (id_cord, id_aluno)
);

create table cord_ocupa_local (
id_cord integer,
cod_local integer,
foreign key (id_cord) references cordenacao (id),
foreign key (cod_local) references local_escola (codigo),
primary key (id_cord, cod_local)
);

create table funci_trabalha_local (
cpf_funci integer,
cod_local integer,
foreign key (cpf_funci) references funcionario (cpf),
foreign key (cod_local) references local_escola (codigo),
primary key (cpf_funci, cod_local)
);

create table respons_aluno (
nome varchar(30),
parentesco varchar(30),
contato bigint,
id_aluno integer,
primary key (nome, id_aluno),
foreign	key (id_aluno) references aluno (id) ON DELETE CASCADE
);

