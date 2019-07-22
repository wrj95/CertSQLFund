--AULA 1

--Criação de tabela
create table PRODUTO (
    id integer not null primary key, --Id precisa ser único, por isso o Primary Key e not null para nenhum campo ficar vazio
    nome varchar2(250),
    preco number(10,2) --Qtd de digitos totais será 8, pois os dois primeiro serão destina as casas decimais
);

--Add coluna data
alter table PRODUTO add(DataCadastro date);

--Aula 2

--Apagando tabelas
drop table PRODUTOS

--Exibir dados de todas as colunas
select * from funcionarios;

--Exibir dados de uma coluna
select salario from funcionarios;

--Exibir dados de mais de uma coluna
select nome, salario from funcionarios;

--Apelidando colunas
select salario as 'SalarioBruto' from funcionarios; --Dá erro
select salario as SalarioBruto from funcionarios;

--Realizar contas com os campos que são numéricos
select salario + vale_refeicao from funcionarios;

--Select com soma e apelido
select (salario + vale_refeicao) * 12 as GastoAnual from funcionarios;
select (salario + vale_refeicao) / 30 as GastoPorDia from funcionarios;

--Unário
select (-salario + vale_refeicao) / 30 as GastoPorDia from funcionarios;

--Concatenar
select 'Custo por dia: ' || (salario + vale_refeicao) / 30 as GastoPorDia from funcionarios;

--OBS
--Concatenar
select 'Custo por dia: ' || salario + vale_refeicao / 30 as GastoPorDia from funcionarios; --DESTE JEITO DÁ ERRO
/*SQL> select 'Custo por dia: ' || salario + vale_refeicao / 30 as GastoPorDia from funcionarios;
select 'Custo por dia: ' || salario + vale_refeicao / 30 as GastoPorDia from funcionarios
                          *
ERROR at line 1:
ORA-01722: invalid number


SQL> 
*/

------------------------------------------------------------------------------------------------------------------------
--Aula 3 - WHERE

select distinct vale_refeicao from funcionarios;


--Where
select salario from funcionarios where salario > 3000;
select salario from funcionarios where salario < 3000;
select salario from funcionarios where salario != 3000;
select salario from funcionarios where salario = 3000;
select salario from funcionarios where salario >= 3000;

--Where filtrando pelo apelido
select salario + vale_refeicao as custo from funcionarios where custo >= 3000;
/*
SQL> select salario + vale_refeicao as custo from funcionarios where custo >= 3000;
select salario + vale_refeicao as custo from funcionarios where custo >= 3000
                                                                *
ERROR at line 1:
ORA-00904: "CUSTO": invalid identifier


SQL> 
*/ 
--Acontece a mesma coisa que no distinct, não pode usar o alias no where pq ele também está sendo usando na hora que está puxando os dados e o alias ainda não foi criado
select salario + vale_refeicao as custo from funcionarios where salario + vale_refeicao >= 3000;

----------------------------------------------------------------------------------------------------------------
--Aula 4 And e Or

select nome, salario from funcionarios where salario = 3700 or salario = 6700;


select nome, salario from funcionarios where salario = 3700 or salario = 6700 and vale_refeicao = 0;

select nome, salario from funcionarios where salario in (3700, 6700);

select nome, salario from funcionarios where salario not in (3700, 6700);

select nome, salario from funcionarios where salario = some (3700, 6700);

select nome, salario from funcionarios where salario = any(3700, 6700);

select nome, salario from funcionarios where salario > any (3700, 6700);

---------------------------------------------------------------------------------------------------------------
--Aula 5 - Like

select nome from funcionarios where nome like 'eduarda' --Isso é a mesma coisa que usar o operador =


select nome from funcionarios where nome like 'Eduard_'; -- O underline aceita qualquer carater

select nome from funcionarios where nome like 'E%'; --QUe começa com A

select nome from funcionarios where nome like '%a'; --Que termina

select nome from funcionarios where vale_refeicao is null; --Verificar se é valor Nulo

select nome from funcionarios where vale_refeicao is not null;

select nome from funcionarios where nome like 'Luan\_a' ESCAPE '\' --ESCAPE é para tratar um caracter especial

-----------------------------------------------------------------------------------------------------------------
--AULA 6 - Order By
select nome, salario from funcionarios order by salario;

select nome, salario from funcionarios order by salario desc;

select distinct nome, salario from funcionarios order by salario desc;

select distinct salario + vale_refeicao as Custo, nome from funcionarios order by salario + vale_refeicao DESC;

select distinct salario + vale_refeicao as Custo, nome from funcionarios order by Custo DESC;

select distinct salario + vale_refeicao as Custo, vale_refeicao from funcionarios order by Custo DESC;

select distinct salario + vale_refeicao as Custo, vale_refeicao from funcionarios order by vale_refeicao DESC;

select distinct salario + vale_refeicao as Custo, vale_refeicao from funcionarios order by vale_refeicao DESC null first; --Traz os Nulls primeiro, por padrão

select distinct salario + vale_refeicao as Custo, vale_refeicao from funcionarios order by vale_refeicao DESC null last; --traz os null por último

-------------------------------------------------------------------------------------------------------------------------
--Aula 7 - Limitando pesquisa no Order By
select salario from funcionarios order by salario desc fetch first 5 rows only; --Mostrar as primeiras 5 linhas

select salario from funcionarios order by salario desc offset 2 rows fetch next 5 rows only; --offset corta as duas primeiras linhas e mostras as proximas 5


select salario from funcionarios order by salario desc offset 2 rows fetch next 5 rows only with ties; --Considera os empates


select salario from funcionarios order by salario desc offset 2 rows fetch next 5 percents rows only;